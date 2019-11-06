<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<div class="container" id="content">
	<h3>예약 현황</h3>
	<br>
	<table class="table">
		<caption></caption>
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
	<button type="button" class="btn btn-primary btn-lg" id="res_status">예약확인</button>
	<c:if test="${login.ulevel==5}">
		<button type="button" class="btn btn-warning btn-lg" id="res_manage">관리자
			페이지</button>
	</c:if>
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
					<h6>
						요일 <select name="res_day" id="res_day">
							<option value="mon">월요일</option>
							<option value="tue">화요일</option>
							<option value="wed">수요일</option>
							<option value="thu">목요일</option>
							<option value="fri">금요일</option>
						</select>
					</h6>
					<h6>
						시간대 <select name="res_time" id="res_time">
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

	<div class="modal" tabindex="-1" role="dialog" id="statusModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">예약확인.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h6>${login.uid}님의예약 현황</h6>
					<table class="table" id="statusResBody"></table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	

</div>




<script>
	$('#res_btn').on("click", function() {
		$("#addModal").modal();
	});
	$('#res_ok').on("click", function() {
		var uid = "${login.uid}";
		var ulevel="${login.ulevel}";
		var udepartment = "${login.udepartment}";
		var res_day = $('#res_day option:selected').val();
		var res_time = $('#res_time option:selected').val();
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
				ulevel : ulevel ,
				res_day : res_day
			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					location.reload();
				} else {
					alert("실패하였습니다.");
					location.reload();
				}
			}
		});

	});

	$('#res_status')
			.on(
					"click",
					function() {
						$("#statusModal").modal();
						var user_id = "${login.uid}";
						var str = "";
						$
								.getJSON(
										"/res_add/all/" + user_id,
										function(data) {
											$(data)
													.each(
															function() {
																var day = "";
																var time = "";

																if (this.res_day == 'mon') {
																	day = '월요일';
																} else if (this.res_day == 'tue') {
																	day = '화요일';
																} else if (this.res_day == 'wed') {
																	day = '수요일';
																} else if (this.res_day == 'thu') {
																	day = '목요일';
																} else if (this.res_day == 'fri') {
																	day = '금요일';
																}

																switch (this.res_time) {
																case 1:
																	time = '09:00 ~ 10:00'
																	break;
																case 2:
																	time = '10:00 ~ 11:00'
																	break;
																case 3:
																	time = '11:00 ~ 12:00'
																	break;
																case 4:
																	time = '12:00 ~ 13:00'
																	break;
																case 5:
																	time = '13:00 ~ 14:00'
																	break;
																case 6:
																	time = '14:00 ~ 15:00'
																	break;
																case 7:
																	time = '15:00 ~ 16:00'
																	break;
																case 8:
																	time = '16:00 ~ 17:00'
																	break;
																case 9:
																	time = '17:00 ~ 18:00'
																	break;

																}

																str += "<tr><th>"
																		+ day
																		+ "</th><th>"
																		+ time
																		+ "</th><th>"
																		+ " <a href=javascript:resDelete('"
																		+ this.uid
																		+ "','"
																		+ this.udepartment
																		+ "',"
																		+ this.res_time
																		+ ",'"
																		+ this.res_day
																		+ "'); id='deleteReplyBtn'>삭제</a></th><tr>";
																$(
																		"#statusResBody")
																		.html(
																				str);
															});

										});
						console.log(str);

					});
	$('#res_manage').on("click", function() {
		self.location="/reservation/manage"
	});
	function resDelete(uid, udepartment, res_time, res_day) {
		var ulevel="${login.ulevel}";
		console.log("예약 삭제");
		$.ajax({
			type : 'delete',
			url : '/res_add/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			data : JSON.stringify({
				uid : uid,
				ulevel : ulevel,
				udepartment : udepartment,
				res_time : res_time,
				res_day : res_day
			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					location.reload();
				} else {
					alert("실패하였습니다");
					location.reload();
				}
			}
		});

	}
</script>
<%@include file="../includes/footer.jsp"%>