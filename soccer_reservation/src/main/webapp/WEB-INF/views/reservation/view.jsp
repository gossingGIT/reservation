<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/calendar/css/dncalendar-skin.min.css">
<script src="/resources/calendar/js/dncalendar.min.js?ver=1"></script>
<div class="container" id="content">
	<h3>예약 현황</h3>
	<br>
		<div id="dncalendar-container"></div>
	

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

	<div class="modal" tabindex="-1" role="dialog" id="calendarStatusModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">예약확인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h6 id='calendarRes_date'></h6>
					<table class="table" id="statusResBody">
						<thead><tr><th>시간대</th><th>가능여부</th></tr></thead>
						<tbody>
						<tr><th>09:00 ~ 10:00</th><th id='t1'><a href='#'>가능</a></th></tr>
						<tr><th>10:00 ~ 11:00</th><th id='t2'><a href='#'>가능</a></th></tr>
						<tr><th>11:00 ~ 12:00</th><th id='t3'><a href='#'>가능</a></th></tr>
						<tr><th>12:00 ~ 13:00</th><th id='t4'><a href='#'>가능</a></th></tr>
						<tr><th>13:00 ~ 14:00</th><th id='t5'><a href='#'>가능</a></th></tr>
						<tr><th>14:00 ~ 15:00</th><th id='t6'><a href='#'>가능</a></th></tr>
						<tr><th>15:00 ~ 16:00</th><th id='t7'><a href='#'>가능</a></th></tr>
						<tr><th>16:00 ~ 17:00</th><th id='t8'><a href='#'>가능</a></th></tr>
						<tr><th>17:00 ~ 18:00</th><th id='t9'><a href='#'>가능</a></th></tr>
					</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
		<div class="modal" tabindex="-1" role="dialog" id="myStatusModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">예약확인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<h6>${login.uid}님의 예약 현황</h6>
					<table class="table" id="statusMyResBody"></table>
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



function add(res_time,res_day)
{
	console.log("add");
	var uid = "${login.uid}";
	var ulevel="${login.ulevel}";
	var udepartment = "${login.udepartment}";
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
	
	
}






$("#dncalendar-container").dnCalendar().build();



$("#dncalendar-container").dnCalendar({
	dayClick: function(date, view) {
		
		var year=date.getFullYear();
		var mon=date.getMonth()+1;
		var day=date.getDate();
		
		var dateStr=year+"-"+mon+"-"+day;
		$("#calendarRes_date").html(dateStr);
    	$("#calendarStatusModal").modal();
		//alert(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
		
	
		$.getJSON("/res_add/all1/"+dateStr,function(data){
			var str="";
			var count=1;
			var t1=0;
			var t2=0;
			var t3=0;
			var t4=0;
			var t5=0;
			var t6=0;
			var t7=0;
			var t8=0;
			var t9=0;
			console.log(data);
			$(data).each(function(){
				switch (this.res_time)
				{
				case 1:
					t1=1;
					break;
				case 2:
					t2=1;
					break;
				case 3:
					t3=1;
					break;
				case 4:
					t4=1;
					break;
				case 5:
					t5=1;
					break;
				case 6:
					t6=1;
					break;
				case 7:
					t7=1;
					break;
				case 8:
					t8=1;
					break;
				case 9:
					t9=1;
					break;
				}
			});
		
			for (var i=0;i<9;i++)
				{
					if (t1<1&&i==0)
						{
						
							str+="<tr><th>09:00 ~ 10:00</th><th><a href=javascript:add("+(i+1)+",'"+dateStr+"');>가능</a></th></tr>";
						}
					else if (t2<1&&i==1)
					{
						str+="<tr><th>10:00 ~ 11:00</th><th><a href=javascript:add("+(i+1)+",'"+dateStr+"');>가능</a></th></tr>";
					}
					else if (t3<1&&i==2)
					{
						str+="<tr><th>11:00 ~ 12:00</th><th><a href=javascript:add("+(i+1)+",'"+dateStr+"');>가능</a></th></tr>";
					}
					else if (t4<1&&i==3)
					{
						str+="<tr><th>12:00 ~ 13:00</th><th><a href=javascript:add("+(i+1)+",'"+dateStr+"');>가능</a></th></tr>";
					}
					else if (t5<1&&i==4)
					{
						str+="<tr><th>13:00 ~ 14:00</th><th><a href=javascript:add("+(i+1)+",'"+dateStr+"');>가능</a></th></tr>";
					}
					else if (t6<1&&i==5)
					{
						str+="<tr><th>14:00 ~ 15:00</th><th><a href=javascript:add("+(i+1)+",'"+dateStr+"');>가능</a></th></tr>";
					}
					else if (t7<1&&i==6)
					{
						str+="<tr><th>15:00 ~ 16:00</th><th><a href=javascript:add("+(i+1)+",'"+dateStr+"');>가능</a></th></tr>";
					}
					else if (t8<1&&i==7)
					{
						str+="<tr><th>16:00 ~ 17:00</th><th><a href=javascript:add("+(i+1)+",'"+dateStr+"');>가능</a></th></tr>";
					}
					else if (t9<1&&i==8)
					{
						str+="<tr><th>17:00 ~ 18:00</th><th><a href=javascript:add("+(i+1)+",'"+dateStr+"');>가능</a></th></tr>";
					}
				}
			$("#statusResBody").html(str);
			
		});
		
    }
}).build();


	$('#res_status')
			.on(
					"click",
					function() {
						$("#myStatusModal").modal();
						var user_id = "${login.uid}";
						var str = "";
						$
								.getJSON(
										"/res_add/all/" + user_id,
										function(data) {
											$(data)
													.each(
															function() {
																
																var time = "";

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
																console.log(this.res_day);
																str += "<tr><th>"
																		+ time
																		+ "</th><th>"+this.res_day+"</th><th>"
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
																		"#statusMyResBody")
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