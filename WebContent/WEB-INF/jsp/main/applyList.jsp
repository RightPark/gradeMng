<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Map" %>
<%@page import="cmd.vo.CmdVO"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Map sessionData = null;
	  
    boolean isSession = true;
    CmdVO vo = null;
    String username="";
    String userNo ="";
  
    if (session.getAttribute("sessionData") != null) {
    	
    	 sessionData = (Map)session.getAttribute("sessionData");
    	 username = sessionData.get("username").toString();	
    	 userNo = sessionData.get("userNo").toString();	
		
       
    } else {
        isSession = false;
        session.removeAttribute("sessionData");
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<script type="text/javascript">

$(document).ready(function(){


	
});


</script>
 
<body>

<div data-role="page">


	<div data-role="header">
	   
	    <div data-role="navbar">
	      <ul>
	           <li><a href="<%=cp%>/cmd/info.do" rel="external">학기별 이수학점 조회</a></li>
	        <li><a href="<%=cp%>/cmd/apply.do" rel="external">수강 신청하기</a></li>
           <li><a href="<%=cp%>/cmd/applyList.do" rel="external">수강 신청조회</a></li>
	        <li><a href="<%=cp%>/cmd/logout.do" rel="external">로그아웃</a></li>
	      </ul>
	    </div>
	  </div>
  <div data-role="main" class="ui-content">
 
  		<table  data-role="table" class="ui-responsive ui-shadow">
  			<thead>
  				<th>
  					신청한 교과목명
  				</th>
  		
  			</thead>
  			 <tbody>
  			     <c:forEach var="data" items="${list}">
  			 	<tr>
  			 		<td>${data.name}</td>
  			 	
  			 		
  			 	</tr>
  			 	</c:forEach>   
  			 </tbody>
  		</table>
     
  </div>
  
   <div data-role="footer" data-position="fixed">
   		
	</div> 

</body>
</html>