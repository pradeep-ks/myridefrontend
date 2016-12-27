<%@ include file="common/header.jsp"%>

<c:url var="userAction" value="/user/add" />

<div class="container-fluid" style="padding-top: 60px;">
	<div class="row centered-form">
		<div
			class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
			<div class="panel panel-default">
				<div class="panel-heading" style="text-align: center;">
					<h3 class="panel-title">New User Registration Page</h3>
				</div>
				<div class="panel-body">
					<form role="form" role="form" action="${ userAction }" modelAttribute="user" method="post">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									<input type="text" name="username" id="username"
										class="form-control input-sm" placeholder="User Name">
								</div>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									<input type="text" name="fullName" id="fullName"
										class="form-control input-sm" placeholder="Full Name">
								</div>
							</div>
						</div>

						<div class="form-group">
							<input type="email" name="email" id="email"
								class="form-control input-sm" placeholder="Email Address">
						</div>

						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									<input type="password" name="password" id="password"
										class="form-control input-sm" placeholder="Password">
								</div>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									<input type="password" name="password_confirmation"
										id="password_confirmation" class="form-control input-sm"
										placeholder="Confirm Password">
								</div>
							</div>
						</div>

						<input type="submit" value="Register"
							class="btn btn-info btn-block">

					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="common/footer.jsp"%>