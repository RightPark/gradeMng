<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
$(document).ready(function(){

});

//로그인
 function loginMember(){
	
	 	var username = $("#username").val();
		var password = $("#password").val();

		var params = "username="+username+"&password="+password;
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "<%=cp%>/cmd/doMember_login.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000   
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	  	    alert("작업 도중 오류가 발생하였습니다.");
			
	      }
	      , success     : function(data) {
				
	    	   if(data.resultCode == 0) {
                 alert("ID 또는 비밀번호가 틀렸습니다.");
                 return;
             }else {
            	location.href="<%=cp%>/cmd/info.do";	
             }   
	      }
 	});
 }

</script>
<title>메인</title>
</head>
	<body>
		<div data-role="page" style="max-width: 1146px; margin: 0 auto;">
		  <div data-role="main" class="ui-content">
		    <div class="ui-grid-solo">
		     	아이디  <input type="text" value="" id="username">
		     	비밀번호 <input type="password" value="" id="password">
		    </div><!-- /grid-a -->
		    <fieldset class="ui-grid">
		  		<div class="ui-block"><button type="button" data-theme="b" onclick="loginMember();">로그인</button></div>
			</fieldset>
		  </div>

		</div>
	</body>
</html>