
[root@liudehua test1]# cat 1.txt
1     2   3 c
a b x                        g
a          k
c v 1 3 4  5 
xx kk
                b
xx    pp k

[root@liudehua test1]# cat 2.txt
b
a  k
xx kk
xx pp k
1 2 3 c
a b x g
c v 1 3 4 5 

��1.txt���ֶγ��ȴ�С������������ֶ���һ���ľͰ������ţ��õ�2.txt�Ľ��




#awk '{$1=$1;a[sprintf("%05d %s",NF,$0)]=$0}END{t=asorti(a,s);for(n=1;n<=t;n++)print a[s[n]]}' 1.txt
b
a k
xx kk
xx pp k
1 2 3 c
a b x g
c v 1 3 4 5

