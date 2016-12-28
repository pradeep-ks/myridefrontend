<%@ include file="common/header.jsp"%>

<c:url var="userAction" value="login" />
<div class="container-fluid" style="padding-top: 60px;">
	<div class="row" style="padding-top: 30px;">
		<div class="col-sm-offset-3 col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="text-center">Existing User Login</h4>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form"
						action="<c:url value='${ userAction }'/>" method="post">
						<c:if test="${ not empty error }">
							<div class="error" style="text-align: center; color: red;">${ error }</div>
						</c:if>
						<div class="form-group text-right">
							<div class="col-sm-3">
								<label class="label-control">Username</label>
							</div>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="username"
									placeholder="Enter User name">
							</div>
						</div>
						<div class="form-group text-right">
							<div class="col-sm-3">
								<label class="label-control">Password</label>
							</div>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="password"
									placeholder="Enter password">
							</div>
						</div>
						<div class="form-group text-center">
							<div class="col-sm-6">
								<a class="btn btn-link" href="<c:url value='/register' />">New
									User? Sign Up</a>
							</div>
							<div class="col-sm-6">
								<input type="submit" value="Sign In" class="btn btn-primary">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-6"></div>
	</div>
</div>

<%@ include file="common/footer.jsp"%>