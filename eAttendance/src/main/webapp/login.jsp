<!DOCTYPE html>
<html lang="en">
<head>
<title>eAttendance - Login</title>

<jsp:include page="components/head-imports.jsp" />

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
						
									
									<form class="user" method="post">
										<div class="form-group">
											<input
												type="email"
												class="form-control form-control-user" id="username"
												name="username" aria-describedby="emailHelp"
												placeholder="Enter Email Address..." required
											>
										</div>
										<div class="form-group">
											<input type="password" name="password" id="password"
												class="form-control form-control-user"
												id="exampleInputPassword" placeholder="Password" required
											>
										</div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<div class="mt-2 mb-2">
											<%
											if (request.getParameter("error") != null) {
												out.print("<p class='text-danger'>Invalid Username Or Password! Try Again</p>");
											}
											%>
										</div>
										<button type="submit"
											class="btn btn-primary btn-user btn-block">Login</button>
										<hr>
									</form>
									<div class="text-center">
										<a class="small" href="forgot-password.jsp">Forgot
											Password?</a>
									</div>
									<!-- <div class="text-center">
                                        <a class="small" href="register.jsp">Create an Account!</a>
                                    </div> -->
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<jsp:include page="components/js-imports.jsp" />

</body>

</html>