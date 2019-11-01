<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@include file="../includes/header.jsp"%>
<div class="container" id="content">
	<h3>예약 현황</h3>
	<br>
	<table class="table">
		<caption>2019-10-28 ~ 2019-11-01</caption>
		<thead>
			<tr>
				<th scope="col">시간</th>
				<th scope="col">월</th>
				<th scope="col">화</th>
				<th scope="col">수</th>
				<th scope="col">목</th>
				<th scope="col">금</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${status}" var="st">
			<tr>
			<c:choose>
				<c:when test="${st.id == 1}">
					<th scope="row">09:00 ~ 10:00</th>
				</c:when>
				
				<c:when test="${st.id==2}">
					<th scope="row">10:00 ~ 11:00</th>
				</c:when>
				
				<c:when test="${st.id==3}">
					<th scope="row">11:00 ~ 12:00</th>
				</c:when>
				
				<c:when test="${st.id==4}">
					<th scope="row">12:00 ~ 13:00</th>
				</c:when>
				
				<c:when test="${st.id==5}">
					<th scope="row">13:00 ~ 14:00</th>
				</c:when>
				
				<c:when test="${st.id==6}">
					<th scope="row">14:00 ~ 15:00</th>
				</c:when>
				
				<c:when test="${st.id==7}">
					<th scope="row">15:00 ~ 16:00</th>
				</c:when>
				
				<c:when test="${st.id==8}">
					<th scope="row">16:00 ~ 17:00</th>
				</c:when>
				
				<c:when test="${st.id==9}">
					<th scope="row">17:00 ~ 18:00</th>
				</c:when>
			</c:choose> 
			
			
			<c:choose>
				<c:when test="${st.mon == 0}">
					<td>가능</td>
				</c:when>
				<c:otherwise>
					<td><b>불가</b></td>
				</c:otherwise>
			</c:choose>
			
				<c:choose>
				<c:when test="${st.tue == 0}">
					<td>가능</td>
				</c:when>
				<c:otherwise>
				<td><b>불가</b></td>
				</c:otherwise>
			</c:choose>
			
				<c:choose>
				<c:when test="${st.wed == 0}">
					<td>가능</td>
				</c:when>
				<c:otherwise>
					<td><b>불가</b></td>
				</c:otherwise>
			</c:choose>
			
				<c:choose>
				<c:when test="${st.thu == 0}">
					<td>가능</td>
				</c:when>
				<c:otherwise>
					<td><b>불가</b></td>
				</c:otherwise>
			</c:choose>
			
				<c:choose>
				<c:when test="${st.fri == 0}">
					<td>가능</td>
				</c:when>
				<c:otherwise>
					<td><b>불가</b></td>
				</c:otherwise>
			</c:choose>
			</tr>
			</c:forEach>
		</tbody>
	</table>

	<button type="button" class="btn btn-primary btn-lg" id="res_btn">예약하기</button>


	<div class="modal" tabindex="-1" role="dialog" id="addModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">예약하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h6>요일
					<select name="res_day" id="res_day">
						<option value="mon">월요일</option>
						<option value="tue">화요일</option>
						<option value="wed">수요일</option>
						<option value="thu">목요일</option>
						<option value="fri">금요일</option>
					</select>
					</h6>
					<h6>시간대
					<select name="res_time" id="res_time">
						<option value="1">09:00 ~ 10:00</option>
						<option value="2">10:00 ~ 11:00</option>
						<option value="3">11:00 ~ 12:00</option>
						<option value="4">12:00 ~ 13:00</option>
						<option value="5">13:00 ~ 14:00</option>
						<option value="6">14:00 ~ 15:00</option>
						<option value="7">15:00 ~ 16:00</option>
						<option value="8">16:00 ~ 17:00</option>
						<option value="9">17:00 ~ 18:00</option>
					</select>
					</h6>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="res_ok">예약하기</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>




<script>
$('#res_btn').on("click",function(){
	$("#addModal").modal();
});
$('#res_ok').on("click",function(){
	var uid="${login.uid}";
	var udepartment="${login.udepartment}";
	var res_day=$('#res_day option:selected').val();
	var res_time=$('#res_time option:selected').val();
	$.ajax({
		type : 'post',
		url : '/res_add/',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			uid : uid,
			udepartment : udepartment,
			res_time : res_time,
			res_day : res_day
		}),
		success : function(result) {
			console.log("result: " + result);
			if (result == 'SUCCESS') {
				alert("등록 되었습니다.");
				self.location="/reservation/view";
			}
			else
			{
				alert("실패하였습니다.");
				self.location="/reservation/view";
			}
		}
	});
	
	
});

</script>
<%@include file="../includes/footer.jsp"%>