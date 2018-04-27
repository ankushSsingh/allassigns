#include<stdio.h>
#include<stdlib.h>
#include<sys/time.h>
#include<math.h>
#define NUM 10000000
#define CUDA_ERROR_EXIT(str) do{\
                                    cudaError err = cudaGetLastError();\
                                    if( err != cudaSuccess){\
                                             printf("Cuda Error: '%s' for %s\n", cudaGetErrorString(err), str);\
                                             exit(-1);\
                                    }\
                             }while(0);

#define TDIFF(start, end) ((end.tv_sec - start.tv_sec) * 1000000UL + (end.tv_usec - start.tv_usec))

__device__ unsigned int exor(unsigned long a,unsigned long b)
{	
	unsigned int res;

	   for (int i = 63; i >= 0; i--)                     
    {
       // Find current bits in x and y
       bool b1 = a & (1 << i);
       bool b2 = b & (1 << i);
        
        // If both are 1 then 0 else xor is same as OR
        bool xoredBit = (b1 & b2) ? 0 : (b1 | b2);          
 
        // Update result
        res <<= 1;
        res |= xoredBit;
    }
	//res=exor(a,b);
	return res;
}
__global__ void calculate(unsigned long *mem,int num,int iter)
{
      int i = blockDim.x * blockIdx.x + threadIdx.x;
      if(i >= num)
           return;
    // unsigned long *t1,*t2;
if(i<num/2){
        int tmp=i*2;
	if(tmp+iter<num)
        	mem[tmp]=exor(mem[tmp],mem[tmp+iter]);
//	else
	      // mem[tmp]=exor(mem[tmp],0);
    // mem[num]=res;
}
}

int main(int argc, char **argv){
	struct timeval start, end, t_start, t_end;
    int i,blocks=0;
	unsigned long *p1,*g1; 
    unsigned long seed,num;

    if(argc == 3){
    num = atoi(argv[1]);   /*Update after checking*/
    if(num <= 0)
       num = NUM;
    seed=atoi(argv[2]);
    }
//    printf("%d",time(0));
    p1 = (unsigned long *)malloc((num+1) *sizeof(unsigned long));
    srand(seed); 
    for(i=0; i<num; ++i){
 	p1[i]=random();
//	printf("%d  %lu\n",i,p1[i]);
    }
    p1[i]=0;

    gettimeofday(&t_start, NULL);

//for(i=0;i<num;i++)
//	printf("%d-%lu\n",i,p1[i]);
    cudaMalloc(&g1, (num+1) * sizeof(unsigned long));
    CUDA_ERROR_EXIT("cudaMalloc");

    cudaMemcpy(g1, p1, (num+1) * sizeof(unsigned long) , cudaMemcpyHostToDevice);
    CUDA_ERROR_EXIT("cudaMemcpy");
    
    gettimeofday(&start, NULL);
    blocks = num /1024;
    
    if(num % 1024)
           ++blocks;
	   


for(i=0;i<log(num)/log(2);i++){
    calculate<<<blocks,1024>>>(g1,num,(int)pow(2,i));
}



    CUDA_ERROR_EXIT("kernel invocation");
    gettimeofday(&end, NULL);
    
    /* Copy back result*/

    cudaMemcpy(p1, g1, (num+1) * sizeof(unsigned long), cudaMemcpyDeviceToHost);
    CUDA_ERROR_EXIT("memcpy");
    gettimeofday(&t_end, NULL);
    
//   for(i=0;i<num;i++)
//	printf("%d-%lu\n",i,p1[i]);   

   printf("%lu",p1[0]);
 printf("Total time = %ld microsecs Processsing =%ld microsecs\n", TDIFF(t_start, t_end), TDIFF(start, end));
    cudaFree(g1);
   
    /*Print the last element for sanity check*/ 
    printf("The XOR final value is %lu",p1[num]);
    
    free(p1);
 //   free(pfinal);

	return 0;
}


