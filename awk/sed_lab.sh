#sed��ǩ��������
#datetime��20160603202300
#auth��shashen
#QQ:linux /shell/awk/sed ���� 219636001
#��лbaby��K�������ȣ��Լ�Ⱥ�������Ĵ���İ���
#�������׸���һ��sed�����Ļ�飬������������ҡ�
#���Ǹ����ˣ����н��͵Ĳ���֮��������¡�



sed ��ǩ������ ��6��ģʽ   T, t, b, T��label, t��label,  b��lable  (:lable �ǿ�ѡ�ģ���������ĸ����������)




[localhost]#  echo -e "123\n456\n789"
123
456
789



���ӣ�
1.
[localhost]# echo -e "123\n456\n789"|sed 's#123#& ok#;t;s#.*#& xxoo#;'   ��t��
123 ok
456 xxoo
789 xxoo

����������滻"123"Ϊ"123 ok";���滻ԭ��Ϊ"& xxoo"


������
��commad1;t;commad2��

��ע�ͣ�1)commad1ִ���滻�ɹ�����,����t,����û�нӱ�ǩ������ִ�к�ߵ�commad2;
		2)commad1ִ���滻ʧ�ܵ��У����ִ��command2��

(Ĭ��û���滻�����滻ʧ��)





2.
[localhost]# echo -e "123\n456\n789"|sed 's#123#& ok#;T;s#.*#& xxoo#;'     (T)
123 ok xxoo
456
789

������
��commad1;T;commad2��

��ע�ͣ�1)commad1ִ���滻�ɹ�����,����T,����û�нӱ�ǩ�������ִ��command2;
        2)commad1ִ���滻ʧ�ܵ��У�����ִ��command2)

(Ĭ��û���滻�����滻ʧ��)






3.
[localhost]#echo -e "123\n456\n789"|sed 's#123#& ok#;b;s#.*#& xxoo#;'   (b)
123 ok
456
789

������
��commad1;b;commad2��

��ע�ͣ�commad1ִ���滻�ɹ�����ʧ�ܵ���,����b,����û�нӱ�ǩ,��������ֱ�������ű�ĩβ������command2����ִ��)




4.
[localhost]#echo -e "123\n456\n789"|sed '/123/{s##& ok#;ta};s#.*#& xxoo#;b;:a;a\###'    (ta)
123 ok
###
456 xxoo
789 xxoo



������{commad1;ta};{command2};b;{:a;commd3}

(ע�ͣ�1)ƥ�䵽/123/����,command1ִ���滻�ɹ�������������ǩ:a��,�����ִ��command3,������ִ��command2;
	   2)��������ִ��command2,����b�������ű�ĩβ������ִ��command3,�������b,���������ִ��command3.)






5.
[localhost]# echo -e "123\n456\n789"|sed '/123/s##& ok#;ta;s#.*#& xxoo#;b;:a;a\###'     (ta)
123 ok
###
456 xxoo
789 xxoo

������{command1};ta;{command2};b;:a;{commad3}

(ע�ͣ�1)������,command1ִ���滻�ɹ����У�����������ǩa��,�����ִ��command3,������ִ��command2;
       2)command1ִ���滻ʧ�ܵ��У���������ת��ǩaȥִ��command3�����ǻ���ִ��command2,����b�������ű�ĩβ������ִ��command3,�������b,���������ִ��command3.)

(Ĭ��û���滻�����滻ʧ��)






6.
[localhost]# echo -e "123\n456\n789"|sed '/123/{s##& ok#;Ta};s#.*#& xxoo#;b;:a;a\###'     (Ta)
123 ok xxoo
456 xxoo
789 xxoo

������{commad1;Ta};{command2};b;{:a;commd3}
(ע�ͣ�1)ƥ�䵽/123/���У�command1ִ���滻�ɹ���������������ǩa��ȥִ��command3,������ִ��command2,����b,�����ű�ĩβ,�������b,�����ִ��command3;
       2)��������ִ��command2,����b�������ű�ĩβ������ִ��command3,�������b,���������ִ��command3.)
	  






7.
[localhost]# echo -e "123\n456\n789"|sed '/123/s##& ok#;Ta;s#.*#& xxoo#;b;:a;a\###'       (Ta)
123 ok xxoo
456
###
789
###

������{commad1};Ta;{command2};b;{:a;commd3}

(ע�ͣ�1)�����У�command1ִ���滻�ɹ����У�������������ǩ:a��ȥִ��command3��������ִ��command2,����b,�����ű�ĩβ,�������b,�����ִ��command3;
		2)ִ��command2ʧ�ܵ���,�����ת����ǩa��ִ��command3,����ִ��command2.) 

(Ĭ��û���滻�����滻ʧ��)





8.
[localhost]# echo -e "123\n456\n789"|sed '/123/{s##& ok#;ba};s#.*#& xxoo#;b;:a;a\###'     (ba)
123 ok
###
456 xxoo
789 xxoo

������{command1;ba};{command2};b;:a;{command3}

(ע�ͣ�1)ƥ�䵽/123/����,command1ִ����Ϻ�,��ת����ǩa��ִ��command3��Ȼ�����;
	   2)��������ִ��command2,����b,�����ű�ĩβ,�������b,�����ִ��command3;)




9.
[localhost]# echo -e "123\n456\n789"|sed '/123/s##& ok#;ba;s#.*#& xxoo#;b;:a;a\###'        (ba)
123 ok
###
456
###
789
###

����:{command1}:ba;{command2}:b;:a;{command3}

(ע��:������,command1�滻�ɹ�����ʧ�ܵ��У�������ת��command3��Ȼ�����,command2����ִ��.)

��ע�����滻ʧ�ܣ�����ƥ��ʧ�ܣ�
(Ĭ��û���滻�����滻ʧ��)