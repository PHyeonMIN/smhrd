<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- %@������ : JSP�� Servlet�� ��ȯ�� �� ȯ�漳�����ִ� ���� --%>
<!DOCTYPE html>	<%-- %!���� --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- 
		JSP(Java Server Page)
			-> �����ϴ� �������� �����ڰ� ���� ���� �� �ְ� ���ִ� ����������
		JSP����Ǵ� ����
			ó������� �� : JSP -> Tomcat -> Servlet -> class -> HTML -> ��Ĺ�޸�����
			�ι�° ����ɶ�: JSP -> ��Ĺ�޸� ����� class������ �����ͼ� ����
			JSP = Servlet
			
			
	 --%>
	 
	 int num = 10;
	 <%	//��ũ��Ʋ��(scriptlet) : JSP���� Java�ڵ带 ������ �� �ִ� ����
	 	int num = 10;
	 	System.out.print(num);
	 %>
	 <style>
	 	b{
	 		font-size:50px;
	 	}
	 </style>
	 <br>
	 num�����ȿ� ����ִ� �� : <b><%=num %></b>
	 <%-- ǥ����(expression) : JSP���� Java������ ���������� ����� �� �ִ� ���� --%>

	 
	 <%-- 1~100������ ����  ���������� ����Ͻÿ�(for) --%>
	 <br>
	 <%
	 	int sum =0;
		for(int i = 1; i<101; i++){
			sum+=i;
		}
	 %>
	 1~100������ �� : <b><%=sum %></b>
	 
	 
	 
	 <table border="1">
	 	<tr>
	 		<%-- �Ʒ��� td�±׸� 10�� �ݺ��Ͻÿ�(for) --%>
	 		<%for(int i=0; i<10; i++){ %>
	 			<td>1</td>
	 		<%} %>
	 	</tr>
	 </table>
	 
	 
	 
	 
	 
	 
</body>
</html>