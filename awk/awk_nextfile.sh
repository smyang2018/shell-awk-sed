cat file1
111
222
333
[root@localhost ~]# cat file2
aa
bb
cc
[root@localhost ~]# awk '{print;if(/2/)nextfile}' file1 file2
111
222
aa
bb
cc


ע�ͣ�ƥ�䵽'2',�Ϳ�ʼ������һ���ļ�������file1�����ӡ333����ӡ��222��ֱ��������һ���ļ��ˡ�