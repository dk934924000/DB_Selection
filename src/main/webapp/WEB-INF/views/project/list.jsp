<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<h2>重难点</h2>
${request}
老师可以在这里发布困难的地方，同学们遇到自己不会的内容也可以在这里提交问题。大家可以一起来解决这些问题。
<div class="col-sm-12">
	<c:if test="${not empty errorMessage}">
		<div class="alert alert-error">${f:h(errorMessage)}</div>
	</c:if>

	<div class="well">

		<form:form action="${pageContext.request.contextPath}/project/search"
			method="get" modelAttribute="projectSearchForm"
			class="form-inline my-inline">
			<form:input path="name" class="form-control" placeholder="请输入问题关键词"/>
			<input type="submit" value="搜索" class="btn btn-default"/>
		</form:form>

		<br>
		搜索不到？你可以选择
		<a href="${pageContext.request.contextPath}/project/create?form"
		   class="btn btn-primary">向老师提问</a><br> <br>
	</div>

	<table class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>问题编号</th>
				<th>问题内容</th>
				<th>同意人数</th>
				<th>解决情况</th>
				<th>创建时间</th>
				<th>可做操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="project" items="${page.content}">
				<tr>
					<td># ${f:h(project.pid)}</td>
					<td>${f:h(project.name)}</td>
					<td>${f:h(project.chosennum)}</td>
					<td>${f:h(project.description)!=0}</td>
					<td>${f:h(project.createdAt)}</td>
					<td><form:form
						action="${pageContext.request.contextPath}/project"
						class="form-inline">
						<input type="hidden" name="pid" value="${f:h(project.pid)}" />
						<input type="submit" class="btn btn-default"
								name="add" value="我也有问题" />
						<input type="submit" class="btn btn-default" value = "我来解答"/>
						<input type="submit" class="btn btn-default" name="show" value = "查看详情"/>

						<%--<input type="submit" class="btn btn-danger"--%>
								<%--name="redirectToDelete" value="Delete" />--%>

					</form:form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<util:pagination page="${page}" query="name=${f:h(param.name)}" />
</div>
