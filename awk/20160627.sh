��Դ�ļ���file1���Ŀ���ļ�file2


������
������ֲ����� ���ǵ����ģ����������ֱ�������11-11��18-18���������������������������ֵĵ�һ�������һ������"-"����������14-15 20-28 30-31
[root@localhost test]# cat file1
day11.fr_sd300
day15.fr_sd300
day14.fr_sd300
day21.fr_sd300
day20.fr_sd300
day18.fr_sd300
day23.fr_sd300
day24.fr_sd300
day22.fr_sd300
day27.fr_sd300
day26.fr_sd300
day25.fr_sd300
day30.fr_sd300
day31.fr_sd300
day28.fr_sd300
[root@localhost test]# cat file2
abc fr_sd300 11-11
abc fr_sd300 14-15
abc fr_sd300 18-18
abc fr_sd300 20-28
abc fr_sd300 30-31
[root@localhost test]# sort file1| awk -F'[.y]' 'NR==1{a=$2;b=$2;next}{m=$2-b;if(m==1){b=$2}else{print "abc",$NF,a"-"b;a=$2;b=$2}}END{print "abc",$NF,a"-"b}'
abc fr_sd300 11-11
abc fr_sd300 14-15
abc fr_sd300 18-18
abc fr_sd300 20-28
abc fr_sd300 30-31
