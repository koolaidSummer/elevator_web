<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link href="style.css" rel="stylesheet">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		ajaxNow();
		ajaxDes();
		
		setInterval("ajaxNow()", 1000);
		setInterval("ajaxDes()", 1000);
		
});

function ajaxNow(){
	$.ajax({
		dataType : "json",
		url : "/JsonNowFloor.jsp",
		success : function(data){
			resultNowHtml(data);	
		},
		error : function(){ alert("로딩실패!"); }
	});
}

function resultNowHtml(data){
	var html = "";
	html += "<strong>";
	html += data["nowFloor"];
	html += "</strong>";

	
	$("#disp_nowFloor").empty();
	$("#disp_nowFloor").append(html);
}

function ajaxDes(){
	$.ajax({
		dataType : "json",
		url : "/JsonDesFloor.jsp",
		success : function(data){ resultDesHtml(data);},
		error : function(){ alert("로딩실패!"); }
	});
}

function resultDesHtml(data){
	var html = "";
	
	$.each(data, function(key, value){
		html += value.desFloor;
		html += " / ";
	});
	
	$("#disp_desFloor").empty();
	$("#disp_desFloor").append(html);
}
</script>
<!-- ---------------------------------------------------------------------------------- -->
<title>Document</title>


</head>

<body class="d-flex h-100 text-center text-white bg-dark">

	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<header class="mb-auto">
			<div>
				<h3 class="float-md-start mb-0">AI elevator</h3>
				<nav class="nav nav-masthead justify-content-center float-md-end">
					<a class="nav-link" href="index.html">FaceID</a>
					<a class="nav-link active" aria-current="page" href="floor_info.jsp">HOME</a>
				</nav>
			</div>
		</header>

		<main class="px-3">
			<div class="present_floor">
				<div class="present_floor_destination">
					<div class="container">
						<div class="col">
							<div class="destination_label">Destination</div>
								<div id="disp_desFloor">
								</div>
						</div>
					</div>
				</div>
				<div class="present_floor_nowfloor">
					<h1 class="present_floor_nowfloor_nowfloor">
						<div id="disp_nowFloor">
						</div>
					</h1>
				</div>
			</div>
			
			<form action="floor_ctl" method="post" class="form-floating">
				<div class="form-input-video">
					<div>
						<label for="floatingInput " style="color: white;">Select
							destination Floor</label> <select class="form-select mb-4"
							name="floor_ctl" aria-label="Default select example" required>
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

					<div class="btn-to-next">
						<input type="submit"
							class="btn btn-lg btn-secondary fw-bold border-white bg-white"
							value="Submit" />
					</div>
				</div>
			</form>
		</main>

		<footer class="mt-auto text-white-50">
			<p>2021 Capstone Design by Team@내나이</p>
		</footer>
	</div>



</body>

</html>