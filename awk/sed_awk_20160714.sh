#sed_awk_������ƴ��ƥ��ؼ��֣�http://bbs.chinaunix.net/thread-4250909-1-1.html��

���󣺽�Դ�ļ�file1ת��ΪĿ���ļ�file2
������1������file1�б�����omega��ֱ�������
        2��������кͣ���һ�л�����N���У���β��ƴ�ӳ�omega���������Щ��Ч�С�
        3)��Ч�в��������������ǰ�����������Ϊ��Ч�У�
      ���ر�ע�⣺ѭ�������line2��line3ƥ�䣬line3��line4ƥ�䣬�����line2line3��line3lin4,���������line2line3line4.��
	  
	  
	  
[localhost]# cat file1
omega ,omega
cding .cd dzzz erg omeg
a bc dde ome
ga zerg ome
bbb cc dde omega zz
omega zzz ome
bb

cc ome
ga
dd
om
ega,cc

bb

dd
[localhost]#cat file2
omega ,omega
cding .cd dzzz erg omega bc dde ome
a bc dde ome
a bc dde omega zerg ome
bbb cc dde omega zz
omega zzz ome
cc omega
omega,cc




#####################################
���룺

1.
[localhost]# sed -nr '/omega/p;N;/o\nmega|om\nega|ome\nga|omeg\na/{h;s#\n##;p;x;};D' file1
omega ,omega
cding .cd dzzz erg omega bc dde ome
a bc dde omega zerg ome
bbb cc dde omega zz
omega zzz ome
cc omega
omega,cc

2.
[localhost]#  sed -r '/omega/{p;d};$!N;/o\s*\nmega|om\s*\nega|ome\s*\nga|omeg\s*\na/!D;h;s/\s*\n//;/omega/p;g;D' file1
omega ,omega
cding .cd dzzz erg omega bc dde ome
a bc dde omega zerg ome
bbb cc dde omega zz
omega zzz ome
cc omega
omega,cc


3.
[localhost]# awk '/omega/{print;next}last$0~/omega/{print last$0}{last=$0}' file1
omega ,omega
cding .cd dzzz erg omega bc dde ome
a bc dde omega zerg ome
bbb cc dde omega zz
omega zzz ome
cc omega
omega,cc



4.���������Ϊ��line2lin3ƥ��,line3line4ƥ�䣬�����line2line3,line3,line3line4)

[localhost]# awk '/omega/{print;append=0;next}last$0~/omega/{if(append==1)print last;print last$0;append=1}last$0!~/omega/{append=0}{last=$0}' file1
omega ,omega
cding .cd dzzz erg omega bc dde ome
a bc dde ome
a bc dde omega zerg ome
bbb cc dde omega zz
omega zzz ome
cc omega
omega,cc
