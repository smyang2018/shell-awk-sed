[root@~]# cat 2.txt
xxoo a
kkkkkkk ll
xxoo b
lllllllll
lllllllll
xxooo c
xxoo  d
lllllllllllllllll



ֻ��ӡ��һ��ƥ���ƥ���У�$2)


[root@ ~]# awk '/xxoo/&&!p{print $2;p=1}' 2.txt
a
[root@~]# awk '/xxoo/{print $2;exit}' 2.txt
a




��֮�����˵�һ��ƥ���в���ӡ��ʣ���ƥ����ȫ����ӡ��$2��

[root@ ~]# awk '/xxoo/&&p{print $2}/xxoo/!p{p=1}' 2.txt
b
c
d
[root@ ~]# awk '/xxoo/&&p{print $2}{p=1}' 2.txt
b
c
d
