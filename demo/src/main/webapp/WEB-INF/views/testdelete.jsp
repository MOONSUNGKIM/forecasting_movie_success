<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"> </script>

<script>
	    $(document).ready(function() {
	        $("#btndelete").click(function() {
	            // ������ �ּ� ����(�̵�)	            
	        	document.form1.action = "${pageContext.servletContext.contextPath}/testdelete";
                document.form1.submit();
	        });
	    });
	    
</script>


</head>

<body>
   <form name="form1" method="post" action="${pageContext.servletContext.contextPath}/test">
   
     <input type="text" id= "TITLE" name = "TITLE" value = "��ȭ ���� ">
      <button type="button" id="btndelete">��ȭ ����</button>
   </form>

</body>
</html>