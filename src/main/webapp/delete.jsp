<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제할 글 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<form class="m-3" action="deleteOK.jsp" method="post">
		<table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
			<tr class="table-primary">
				<th colspan="4" style="font-size: 30px; text-align: center;">삭제할 글 보기</th>
			</tr>
			<tr class="table-dark">
				<th style="width: 100px; text-align: center;">글번호</th>
				<th style="width: 350px; text-align: center;">이름</th>
				<th style="width: 150px; text-align: center;">작성일</th>
				<th style="width: 100px; text-align: center;">조회수</th>
			</tr>
			<tr>
				<td>${vo.idx}</td>
				<td>
					<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"></c:set>
					<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"></c:set>
					${name}
				</td>
				<td>
					<jsp:useBean id="date" class="java.util.Date"/>
					<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
							date.date == vo.writeDate.date}">
						<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm:ss"/>
					</c:if>
					<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month ||
							date.date != vo.writeDate.date}">
						<fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd(E)"/>
					</c:if>
				</td>
				<td align="center">${vo.hit}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
					<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
					${subject}
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"/>
					<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
					<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
					${content}
				</td>
			</tr>
			<tr class="table-secondary">
				<td colspan="4" align="center">
					<div class="row g-3 align-items-center" style="width: 90%; margin-left: auto; margin-right: auto;">
						<div class="col-auto">
							<label for="password" class="col-form-label">비밀번호</label>
						</div>
						<div class="col-auto">
							<input type="password" id="password" class="form-control" name="password" style="font-size: 13px;"/>
						</div>
						<div class="col-auto">
							<input class="btn btn-sm btn-outline-primary" type="submit" value="삭제하기" style="font-size: 13px;"/>
							<input class="btn btn-sm btn-outline-danger" type="reset" value="다시쓰기" style="font-size: 13px;"/>
							<input class="btn btn-sm btn-outline-info" type="reset" value="돌아가기" style="font-size: 13px;"
									onclick="history.back()"/>
							<input class="btn btn-sm btn-outline-success" type="button" value="목록보기" style="font-size: 13px;"
									onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
						</div>
					</div>
				</td>
			</tr>
		</table>
		
		<input type="hidden" name="idx" value="${vo.idx}"/>
		<input type="hidden" name="currentPage" value="${currentPage}"/>
		
	</form>

</body>
</html>





