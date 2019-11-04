<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<div class="container" id="content">
	<h3 class="text-center">공지사항</h3>
	<br>
	<style>
.pagination {
	justify-content: center;
}
</style>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">글 번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="boardVO">
				<tr>
					<th scope="row">${boardVO.bno}</th>
					<td><strong><a
							href="read${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}">${boardVO.title}</a></strong>[
						${boardVO.replycnt} ]</td>
					<td>${boardVO.writer}</td>
					<td><fmt:formatDate value="${boardVO.regdate}"
							pattern="yyyy-MM-dd" /></td>
					<td>${boardVO.viewcnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${login.ulevel==5}">
	<div class="writeBoard">
		<button type="button" class="btn btn-primary">글 작성</button>
	</div>
	</c:if>
	<br> <br>

	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li class="page-item"><a class="page-link"
				href="view${pageMaker.makeSearch(pageMaker.startPage-1) }"
				tabindex="-1" aria-disabled="true">이전</a></li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			var="idx">
			<li
				class="page-item
				<c:out value="${pageMaker.cri.page == idx?' active':''}"/>">
				<a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage>0}">
			<a class="page-link"
				href="list${pageMaker.makeSearch(pageMaker.endPage+1)}">다음</a>
		</c:if>

	</ul>

	<div class='box-body' style="text-align: center;">

		<select name="searchType">
			<option value="n"
				<c:out value="${pageMaker.cri.searchType==null?'selected' : '' }"/>>---</option>
			<option value="t"
				<c:out value="${pageMaker.cri.searchType eq 't' ?'selected' : '' }"/>>제목</option>
			<option value="w"
				<c:out value="${pageMaker.cri.searchType eq 'w' ?'selected' : '' }"/>>글쓴이</option>
			<option value="c"
				<c:out value="${pageMaker.cri.searchType eq 'c' ?'selected' : '' }"/>>내용</option>
		</select> <input type="text" name='keyword' id="keywordInput"
			value='${pageMaker.cri.keyword}'>
		<button id='searchBtn'>검색</button>
	</div>
</div>

<script>
		$(document).ready(function() {

			$(".btn-primary").on("click", function() {
				self.location = "/notice/add";
			});
			
			
			
			$('#searchBtn').on("click",function(){
				self.location = "view" 
				+ '${pageMaker.makeQuery(1)}'
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword=" + $('#keywordInput').val();
				
			});
			
		});
</script>
<%@include file="../includes/footer.jsp"%>