��ǩ����{

			: lable # ���������ǣ����b��t����ʹ����ת
			b lable # ��֧���ű��д��б�ǵĵط��������֧���������֧���ű���ĩβ��
			t labe  # �жϷ�֧�������һ�п�ʼ������һ���������T,t��������·�֧�����б�ŵ�����������ߵ��ű�ĩβ����b������ͬ����t��ִ����תǰ���ȼ����ǰһ���滻�����Ƿ�ɹ�����ɹ�����ִ����ת��

			sed -e '{:p1;/A/s/A/AA/;/B/s/B/BB/;/[AB]\{10\}/b;b p1;}'     # �ļ����ݵ�һ��A�ڶ���B:������ǩp1;�����滻����(A�滻��AA,B�滻��BB)��A����B�ﵽ10���Ժ����b,����
			echo 'sd  f   f   [a    b      c    cddd    eee]' | sed ':n;s#\(\[[^ ]*\)  *#\1#;tn'  # ��ǩ����tʹ�÷���,�滻[]��Ŀո�
			echo "198723124.03"|sed -r ':a;s/([0-9]+)([0-9]{3})/\1,\2/;ta'  # ÿ�����ַ���һ������

		}


# add commas to numeric strings, changing "1234567" to "1,234,567"

-> gsed ':a;s/\B[0-9]\{3\}\>/,&/;ta'                     # GNU sed

-> sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta'  # other seds

-> awk -v FS=OFS= '{for(i=2;i<=NF;i++) $i=(NF-i+1)%3?$i:","$i}1'
		
		
		
[root@liudehua test1]# cat test
AA
BC
AA
CB
CC
AA

[root@liudehua test1]# sed '/^AA/s/$/ YES/;t;s/$/ NO/' test   ��t��
AA YES
BC NO
AA YES
CB NO
CC NO
AA YES
[root@liudehua test1]# sed '/^AA/ba;s/$/ NO/;b;:a;s/$/ YES/' test   ��b��
AA YES
BC NO
AA YES
CB NO
CC NO
AA YES
[root@liudehua test1]# sed '/AA/s#$# YES#;/AA/!s#$# NO#g' test    ���Ǳ�ǩ������
AA YES
BC NO
AA YES
CB NO
CC NO
AA YES