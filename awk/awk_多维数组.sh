#awk���������ļ��������鴦��ķ�ʽ
#datetime:201605191617
#auth��R��������,baby��
#edit:ɱ��
#QQ: linux /shell/awk/sed ���� 219636001


�����������ļ�1.txt,2.txt ������Ҫ��2.txt��$1��1.txt��$1�Ա�,2.txt��$3��1.txt��$3�Աȣ��������ͬ�����2.txt��ȫ�������
##################################################
Դ�ļ���
[root@localhost]# cat 1.txt 
1111 something1 something2 
2222 something3 something13
3333 something5 something6 
4444 something7 something11 
[root@localhost]# cat 2.txt 
4444 something10 something11 
2222 something12 something13 
9999 something14 something15
################################################
����ļ���
4444 something10 something11 
2222 something12 something13 
#################################################
���룺1  ��baby)
awk 'ARGIND==1{a[$1]=$1;b[$3]=$3;next}{if($1==a[$1]&&$3==b[$3])print}' 1.txt  2.txt 

awk 'ARGIND==1{a[$1]=$1;b[$3]=$3;next}$1==a[$1]&&$3==b[$3]' 1.txt  2.txt

(ע�ͣ�����һά���飬ͨ�� row == arry[item] ��ʽ)


���룺2 ��ɱ��)
awk 'ARGIND==1{a[$1]=$1;b[$3]=$3;next}{if($1 in a && $3 in b)print}' 1.txt  2.txt 

awk 'ARGIND==1{a[$1]=$1;b[$3]=$3;next}$1 in a && $3 in b' 1.txt  2.txt

(����һά���飬ͨ�� item in  arry ��ʽ)



���룺3  ��������)
awk 'ARGIND==1{a[$1$3]++;next}{if(a[$1$3]==1)print}' 1.txt  2.txt
 
awk 'ARGIND==1{a[$1$3]++;next}a[$1$3]==1' 1.txt  2.txt  ��ע�ͣ����ܰ�"++" ���� "=$0" )
 
����ά����)
 
(��������֧�� "++" ��֧�� "=$0")
#ע�⣺	awk 'ARGIND==1{a[$1$3]=$0;next}a[$1$3]==1' 1.txt  2.txt ������д������
 
 
 
 
 
���룺4 ��R��)
awk 'ARGIND==1{a[$1$3]++;next}{if(a[$1$3])print}' 1.txt  2.txt

awk 'ARGIND==1{a[$1$3]=$0;next}{if(a[$1$3])print}' 1.txt  2.txt

awk 'ARGIND==1{a[$1$3]++;next}a[$1$3]' 1.txt  2.txt

awk 'ARGIND==1{a[$1$3]=$0;next}a[$1$3]' 1.txt  2.txt

(��ά����)
(ע�⣺��������֧�� "++" �� "=$0" )
###################################################