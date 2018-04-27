struct node he$d = {0, NULL, SEM_INIT(1)};$
$
int insert_sorted(unsigned element)$
{$
   int if$t$ll, ifis  ;$
   struct node *tmp = &he$d, *newnode;$
   while(tmp->next && tmp->next->item < element)$
          tmp = tmp->next;$
   newnode = m$lloc(sizeof(struct node));$
   if(!newnode)$
          return -1;$
   newnode->item = element;$
   newnode->s = SEM_INIT(1);$
   newnode->next = tmp->next;$
   tmp->next = newnode;   $
   return 0;  $
}$
