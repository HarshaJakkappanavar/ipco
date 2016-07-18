<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Mangage Tutorial</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/metro-bootstrap/3.1.1.2/css/metro-bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style type="text/css">
<%@include file="../css/header.css" %>
<%@include file="../css/manageTutorial.css" %>
</style>
<script type="text/javascript">
<%@include file="../js/manageTutorial.js" %>
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="jumbotron title">
		<div class="container text-center">
			<h1>Manage Tutorial</h1>
			<p>Add-Remove-Edit Topics, Modules and Activities, all at one place.</p>
		</div>
	</div>

	<div class="container-fluid text-left">
		<div class="row">
		<div class="col-sm-12">
		<div class="jumbotron topic_holder">
		<div class="row">
			<div class="col-sm-4">
			<a class="btn btn-info btn-block" data-toggle="modal"
				data-target="#addNewTopic" role="button">Add Topic</a>
			</div>
		</div>
		<c:if test="${not (fn:length(allTopics)>0)}">
		<br>
		<div class="row">
			<div class="col-sm-12">
			<span class="h2">No topics available. You might want to add the first one.</span>
			</div>
		</div>
		</c:if>
		</div>
		<c:if test="${fn:length(allTopics)>0}">
		<c:forEach items="${allTopics}" var="topic" varStatus="topicNo">
			<div class="jumbotron topic_holder">
			<div class="row">
				<div class="col-sm-8">
				<span class="container_name h2 collapsed span-topic-${topic.topicId}" 
					data-toggle="collapse" data-target="#modules_for-${topic.topicId}" id="topic_name_${topic.topicId}">${topic.topicName} ${topic.topicType.typeId == 1?'(Basic)':''}</span>
				</div>
				<div class="col-sm-2">
				<button class="btn btn-success btn-block" id="${topic.topicId}" name="${topic.topicName}" onclick="renameTopic(this)">Rename</button>
				</div>
				<div class="col-sm-2">
				<a class="btn btn-danger btn-block" id="deleteId_${topic.topicId}" role="button" onclick="deleteTopic(this)">Delete</a>
				</div>
				<input type="hidden" id="topicNotEmpty_${topic.topicId}" value="${fn:length(topic.modules)>0}" />
			</div>
			
			<div class="panel-collapse collapse ${topicNo.index+1 == 1?'in':''}" id="modules_for-${topic.topicId}">
			
			<div class="jumbotron module_holder">
			<div class="row">
				<div class="col-sm-4">
				<a class="btn btn-info btn-block" data-toggle="modal"
					data-target="#addNewModule" role="button">Add Module</a>
				</div>
			</div>
			<c:if test="${not (fn:length(topic.modules)>0)}">
			<br>
			<div class="row">
				<div class="col-sm-12">
				<span class="h2">No modules available. You might want to add the first one.</span>
				</div>
			</div>
			</c:if>
			</div>
			
			<c:if test="${fn:length(topic.modules)>0}">
			<c:forEach items="${topic.modules}" var="module" varStatus="moduleNo">
				<div class="container-fluid text-left">
				<div class="row">
				<div class="col-sm-12">
					<div class="container module_holder">
					<div class="row">
						<div class="col-sm-8">
						<span class="container_name h3 collapsed span-module-${module.moduleId}" 
							data-toggle="collapse" data-target="#activities_for-${module.moduleId}" id="moduleName_${module.moduleId}">${module.moduleName}</span>
						</div>
						<div class="col-sm-2">
						<button class="btn btn-success btn-block" id="${module.moduleId}" name="${module.moduleName}" onclick="renameModule(this)">Rename</button>
						</div>
						<div class="col-sm-2">
						<a class="btn btn-danger btn-block" id="deleteId_${module.moduleId}" role="button" onclick="deleteModule(this)">Delete</a>
						</div>
						<input type="hidden" id="moduleNotEmpty_${module.moduleId}" value="${fn:length(module.activityOptions)>0}" />
					</div>
			
					<div class="panel-collapse collapse" id="activities_for-${module.moduleId}">
					
					<div class="jumbotron activity_holder">
					<div class="row">
						<div class="col-sm-4">
						<a class="btn btn-info btn-block" data-toggle="modal"
							data-target="#addNewActivity" role="button">Add Activity</a>
						</div>
					</div>
					<c:if test="${not (fn:length(module.activityOptions)>0)}">
					<br>
					<div class="row">
						<div class="col-sm-12">
						<span class="h2">No activities available. You might want to add the first one.</span>
						</div>
					</div>
					</c:if>
					</div>
					<c:if test="${fn:length(module.activityOptions)>0}">
					<c:forEach items="${module.activityOptions}" var="activityOption" varStatus="activityOptionNo">
						<div class="container-fluid text-left">
							<div class="row">
							<div class="col-sm-12">
								<div class="container activity_holder">
								<div class="row">
									<div class="col-sm-8">
									<span class="h4" id="activityName_${activityOption.activityOptionId}">${activityOption.activity.activityText}</span>
									</div>
									<div class="col-sm-2">
						<!-- 								<a id="activityId_activityTemplateId"></a> -->
									<a class="btn btn-success btn-block" role="button" 
										id="${activityOption.activity.activityId}_${activityOption.activity.activityTemplate.activityTemplateId}" onclick="editActivity(this)">Edit</a>
									</div>
									<div class="col-sm-2">
									<a class="btn btn-danger btn-block" data-toggle="modal" data-target="#confirmationDialog" id="deleteId_${activityOption.activityOptionId}" role="button" onclick="deleteActivity(this)">Delete</a>
									</div>
								</div>
								</div>
							</div>
							</div>
						</div>
					</c:forEach>
					</c:if>
					</div>
					</div>
				</div>
				</div>
				</div>
			</c:forEach>
			</c:if>
			</div>
			</div>
		</c:forEach>
		</c:if>
		</div>
		</div>
	</div>
	<jsp:include page="manageTutorialModal.jsp"></jsp:include>
</body>
</html>