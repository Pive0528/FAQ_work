<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="${board.code } LIST"></c:set>
<%@ include file="../common/head.jspf"%>
<hr />

<section class="mt-24 text-xl px-4">
	<div class="mx-auto">

		<%-- 		${articles} --%>

		<div class="mb-4 flex">
			<div>${articlesCount }개</div>
			<div class="flex-grow"></div>
			<!-- 			<form action="../article/list"> -->
			<form action="">
				<input type="hidden" name="boardId" value="${param.boardId }" />
				<div class="flex">
					<select class="select select-sm select-bordered
						max-w-xs" name="searchKeywordTypeCode"
						data-value="${param.searchKeywordTypeCode } ">
						<option value="title">제목</option>
						<option value="body">내용</option>
						<option value="title,body">제목+내용</option>
						<option value="writer">writer</option>
					</select> <label class="ml-3 input input-bordered input-sm flex items-center gap-2"> <input type="text"
						placeholder="Search" name="searchKeyword" value="${param.searchKeyword }" />
						<button type="submit">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4 opacity-70">
    <path fill-rule="evenodd"
									d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z"
									clip-rule="evenodd" />
  </svg>
						</button>
					</label>
				</div>
			</form>
		</div>


		<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
			<thead>
				<tr>
					<th style="text-align: center;">ID</th>
					<th style="text-align: center;">작성 날짜</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">작성자</th>
					<th style="text-align: center;">좋아요</th>
					<th style="text-align: center;">싫어요</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="article" items="${articles}">
					<tr class="hover">
						<td style="text-align: center;">${article.id}</td>
						<td style="text-align: center;">${article.regDate.substring(0,10)}</td>
						<td style="text-align: center;">
							<a class="hover:underline" href="detail?id=${article.id}">${article.title} <c:if
									test="${article.extra__repliesCount > 0 }">
									<span style="color: red;">[${article.extra__repliesCount }]</span>
								</c:if>
							</a>
						</td>
						<td style="text-align: center;">${article.extra__writer}</td>
						<td style="text-align: center;">${article.goodReactionPoint}</td>
						<td style="text-align: center;">${article.badReactionPoint}</td>
					</tr>
				</c:forEach>

				<c:if test="${empty articles}">
					<tr>
						<td colspan="4" style="text-align: center;">게시글이 없습니다</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>



	<!-- 	직관적인 페이징 -->
	<div class="pagination flex justify-center mt-3">
		<div class="btn-group">

			<c:forEach begin="1" end="${pagesCount }" var="i">
				<a class="btn btn-sm ${param.page == i ? 'btn-active':''}" href="${ baseUri}&page=${i }">${i }</a>
			</c:forEach>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>
