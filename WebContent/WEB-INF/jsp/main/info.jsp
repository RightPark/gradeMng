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


//등록
function insert(){

	var bike_nm = $('#bike_nm').val();
	var price = $('#price').val();
	var password = $('#password').val();
	var addr = $('#addr01').val();
	var longitude = $('#longitude').val();
	var latitude = $('#latitude').val();
	
	var params = "bike_nm="+bike_nm+"&price="+price+"&password="+password+"&addr="+addr+"&longitude="+longitude+"&latitude="+latitude;
    $.ajax({
        type        : "POST" 
      , async       : false
      , url         : "/cmd/insert_bike.do"
      , data        : params
      , dataType    : "json"
      , timeout     : 30000  
      , cache       : false    
      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
               alert( "작업 도중 오류가 발생하였습니다. " );
                
      }
      , success     : function(data) {
    
      		location.href = "/cmd/get_bike_list.do";	
      	
                
      }
	});
	
}

function detail(year, term){
	
	location.href = "/cmd/infoDetail.do?year="+year+"&term="+term;
}

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
  					수강년도
  				</th>
  				<th>
  					학기
  				</th>
  				<th>
  					이수학점
  				</th>
  				<th>
  					상세보기
  				</th>
  				
  			</thead>
  			 <tbody>
  			     <c:forEach var="data" items="${list}">
  			 	<tr>
  			 		<td>${data.year}</td>
  			 		<td>${data.term}</td>
  			 		<td>${data.grade}</td>
  			 		<td  onclick="detail('${data.year}','${data.term}');" style="cursor: pointer;">링크</td>
  			 	</tr>
  			 	</c:forEach>   
  			 </tbody>
  		</table>
     
  </div>
  
   <div data-role="footer" data-position="fixed">
   		
	</div> 

</body>
</html>