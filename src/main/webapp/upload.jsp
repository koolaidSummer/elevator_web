<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" class="h-100">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link href="style.css" rel="stylesheet">

<title>Document</title>


</head>

<body class="d-flex h-100 text-center text-white bg-dark">

	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<header class="mb-auto">
			<div>
				<h3 class="float-md-start mb-0">AI elevator</h3>
				<nav class="nav nav-masthead justify-content-center float-md-end">
					<a class="nav-link active" aria-current="page" href="index.html">FaceID</a>
					<a class="nav-link" href="floor_info.jsp">HOME</a>
				</nav>
			</div>
		</header>

		<main class="px-3">


			<form action="sign_up" method="post" enctype="multipart/form-data"
				class="form-floating">
				<div class="form-input-video">
					<div class="form-floating mb-4">
						<input type="input" class="form-control" id="floatingInput"	name="uname" autocomplete="off" placeholder=" " required> 
                            <label for="floatingInput" style="color: black;">ID</label>
					</div>
					<div class="form-floating mb-4">
						<input type="password" class="form-control" id="floatingPassword" name="pwd" autocomplete="off" placeholder=" " required> 
                        <label for="floatingPassword" style="color: black;">Password</label>
					</div>
                    <div>
                    <label for="floatingInput " style="color: white;">Select your Floor</label>
					<select class="form-select mb-4" name="floor"  aria-label="Default select example" required>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
                        <option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
                        <option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
                        <option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
                        <option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
					</select>
                    </div>
					<div class="form-input-video-data">
						<label for="camcorder" class="form-input-label">Video</label> 
                        <input type="file" id="camcorder" name="file" capture="camcorder" accept="video/*" required />
					</div>
					<div class="btn-to-next">
						<input type="submit"
							class="btn btn-lg btn-secondary fw-bold border-white bg-white"
							value="Submit!" />
					</div>
				</div>
			</form>


			</p>
		</main>

		<footer class="mt-auto text-white-50">
			<p>2021 Capstone Design by Team@내나이</p>
		</footer>
	</div>



</body>
</html>