#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<fcntl.h>
#include<string.h>
#define TDIFF(start, end) ((end.tv_sec - start.tv_sec) * 1000000UL + (end.tv_usec - start.tv_usec))
float *accounts;
int N;
struct param{
    int *type,*a1,*a2;
    float *m,*acc;
};
pthread_mutex_t l1,L[11001];
int ctr1=0;
void compute(void *arg)
{
		struct param *a=(struct param *)arg;
		while(1)
		{
			if(ctr1>=N){
			break;
			}
			pthread_mutex_lock(&l1);
			pthread_mutex_lock(&L[(a->a1)[ctr1]]);
			if ((a->type)[ctr1]==4){
				pthread_mutex_lock(&L[(a->a2)[ctr1]]);
			}
			pthread_mutex_unlock(&l1);
			accounts=a->acc;
			int curr_amt1,curr_amt2;
			curr_amt1=accounts[(a->a1)[ctr1]-1001];
			
			int value=(a->m)[ctr1];
			switch((a->type)[ctr1])
			{
				case 1:  accounts[(a->a1)[ctr1]-1001]=curr_amt1+0.99*value;
				//printf("1\n");
				     break;
				case 2:  accounts[(a->a1)[ctr1]-1001]=curr_amt1-1.01*value;//printf("2\n");
				     break;
				case 3:  accounts[(a->a1)[ctr1]-1001]=1.071*curr_amt1;//printf("3\n");
				     break;
				case 4:curr_amt2=accounts[(a->a2)[ctr1]-1001];
				 	accounts[(a->a1)[ctr1]-1001]=curr_amt1-1.01*value;
        			 	 accounts[(a->a2)[ctr1]-1001]=curr_amt2+0.99*value;//printf("4\n");
        				 pthread_mutex_unlock(&L[(a->a2)[ctr1]]);
        				 break;
        	}
        	pthread_mutex_unlock(&L[(a->a1)[ctr1]]);
        	ctr1++;
		}	
		pthread_exit(NULL);

}
int main(int argc, char ** argv){
	FILE *fd1;
	struct timeval start, end;
	char c,*buf2,*cbuff,**txns;
	int fd2,T,i=0,j=0,ctr=0,n;
	unsigned long size,bytes_read=0;
	accounts=(float *)malloc(10000*sizeof(float));
    memset(accounts,0,10000);
 	if(argc != 5){
            printf("Usage: %s <fileneme_account>\n", argv[0]);
            exit(-1);         
    }  
    N=atoi(argv[3]);
    T=atoi(argv[4]);
    pthread_t threads[T];
    txns=(char**)malloc(N*sizeof(char*));
    for (i=0;i<N;i++)
    	txns[i]=(char*)malloc(100*sizeof(char));
    fd1 = fopen(argv[1],"r");
     if(fd1 < 0){
           printf("Can not open file\n");
           exit(-1);
     }
    fd2 = open(argv[2], O_RDONLY);
    if(fd2 < 0){
           printf("Can not open file\n");
           exit(-1);
    } 
    size = lseek(fd2, 0, SEEK_END);
    if(size <= 0){
           perror("lseek");
           exit(-1);
    }
    
    if(lseek(fd2, 0, SEEK_SET) != 0){
           perror("lseek");
           exit(-1);
    }  
    char buf[100];
	for(n=1;n<10001;n++)
	{ 
	  	fscanf(fd1, "%s", buf);
	    fscanf(fd1, "%s", buf);
	    accounts[n-1]=atoi(buf);   
	}

    buf2 = malloc(size);
    if(!buf2){
           perror("mem");
           exit(-1);
    }  
    do{
         unsigned long bytes;
         cbuff = buf2 + bytes_read;
         bytes = read(fd2, cbuff, size - bytes_read);
         if(bytes < 0){
             perror("read");
             exit(-1);
         }
        bytes_read += bytes;
     }while(size != bytes_read);
	cbuff=buf2+size;
	
	int prev=0;
	for(i=0,ctr=0;i<N;i++,ctr=0)
	{for(j=1;j<size;j++)
		{
			if(buf2[prev+j]=='\n')
			{
				ctr=j;
				break;
			}
		}
		strncpy(txns[i],buf2+prev,j);
		prev=ctr+prev;
		
	}
	int *type,*a1,*a2; float *m;
	type=(int *)malloc(N*sizeof(int));
	m=(float *)malloc(N*sizeof(float));
	a1=(int *)malloc(N*sizeof(int));
	a2=(int *)malloc(N*sizeof(int));
	

for(i=0;i<11001;i++)
	pthread_mutex_init(&L[i],NULL);

pthread_mutex_init(&l1,NULL);
	gettimeofday(&start, NULL);

	for(i=0;i<N;i++)
		sscanf(txns[i],"%d %d %f %d %d",&n,&type[i],&m[i],&a1[i],&a2[i]);
	struct param arg;
	arg.type = type; arg.m = m;  arg.a1 = a1; arg.a2 = a2; arg.acc = accounts;	
	for(i=0;i<T;i++){
	if(pthread_create(&threads[i],NULL,compute,(void*)&arg)!=0){
			perror("pthread_create");
            exit(-1);
		}
	}
for(i=0;i<T;++i){
  	pthread_join(threads[i], NULL);
	}

	gettimeofday(&end, NULL);

	for(i=0;i<10000;i++){
		int x=i;
		printf("%d\t%lf\n",x+1001,accounts[i]);
	}

	printf("Time taken = %ld microsecs\n", TDIFF(start, end));
	//printf("ankush\n");
	for(i=0;i<N;i++)
		free(txns[i]);
	free(txns);
	free(buf2);
	close(fd2);\
	free(accounts);
	free(type);free(m);free(a1);free(a2);
	return 0;
}