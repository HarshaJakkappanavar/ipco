<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Topics</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/metro-bootstrap/3.1.1.2/css/metro-bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style type="text/css">
<%@include file="../css/header.css" %>
<%@include file="../css/userTopic.css" %>
</style>
<script type="text/javascript">
<%@include file="../js/userTopic.js" %>
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="jumbotron">
	<div class="container-fluid">
		<c:forEach items="${instance.instanceTopicList}" var="instanceTopic">
		<div class="row topic-row <c:choose><c:when test="${instanceTopic.status.statusId eq 1}">bg-info</c:when><c:when test="${instanceTopic.status.statusId eq 2}">bg-danger</c:when><c:otherwise>bg-success</c:otherwise></c:choose>">
			<div class="col-lg-12 col-sm-12 col-md-12">
				<h2>${instanceTopic.topic.topicName}</h2>
				<div class="progress" style="width:100%">
					<div class="progress-bar <c:choose><c:when test="${instanceTopic.status.statusId eq 1}">progress-bar-info</c:when><c:when test="${instanceTopic.status.statusId eq 2}">progress-bar-danger active</c:when><c:otherwise>progress-bar-success</c:otherwise></c:choose> progress-bar-striped" 
					 	 role="progressbar" style="width:${instanceTopic.progress}%; min-width:2.5em;">${instanceTopic.progress}% </div>
				</div>
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-10">
						<div class="row">
							<c:forEach items="${instanceTopic.instanceModuleList}" var="instanceModule">
							<div class="col-md-2">
								<button class="instanceModule btn <c:choose><c:when test="${instanceModule.status.statusId eq 1}">btn-info</c:when><c:when test="${instanceModule.status.statusId eq 2}">btn-danger</c:when><c:otherwise>btn-success</c:otherwise></c:choose> button-wrapper btn-block"
									    <c:if test="${instanceModule.status.statusId eq 1 and instanceModule.module.orderNo ne 1 or fn:length(instanceModule.activityAnswers)<=0}">disabled</c:if>
									    id="moduleId_${instanceModule.instanceModuleId}">${instanceModule.module.moduleName}</button>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>	
			</div>
		</div>
		<br>
		</c:forEach>	
	</div>
</div>
<form action="#" id="customForm" method="post">
	<input type="hidden" name="id" id="id"/>
</form>
</body>
</html>