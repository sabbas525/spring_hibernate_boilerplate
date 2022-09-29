<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Secure Coding - SIT 218 - Q and A app</title>
<!-- Inline CSS -->
<style type="text/css">
.error {
	color: red
}

body {
	align-items: center;
	background-color: rgba(0,0,0,0.4);
	display: flex;
	justify-content: center;
	height: 100vh;
}

.form {
	background-color: #15172b;
	border-radius: 20px;
	box-sizing: border-box;
	height: 500px;
	padding: 20px;
}

.title {
	color: #eee;
	font-family: sans-serif;
	font-size: 36px;
	font-weight: 600;
	margin-top: 30px;
}

.subtitle {
	color: #eee;
	font-family: sans-serif;
	font-size: 16px;
	font-weight: 600;
	margin-top: 10px;
}

.input-container {
	height: 50px;
	position: relative;
	width: 100%;
}

.ic1 {
	margin-top: 40px;
}

.ic2 {
	margin-top: 30px;
}

.input {
	background-color: #303245;
	border-radius: 12px;
	border: 0;
	box-sizing: border-box;
	color: #eee;
	font-size: 18px;
	height: 100%;
	outline: 0;
	padding: 4px 20px 0;
	width: 100%;
}

.cut {
	background-color: #15172b;
	border-radius: 10px;
	height: 20px;
	left: 20px;
	position: absolute;
	top: -20px;
	transform: translateY(0);
	transition: transform 200ms;
	width: 76px;
}

.cut-short {
	width: 50px;
}

.input:focus ~ .cut, .input:not(:placeholder-shown) ~ .cut {
	transform: translateY(8px);
}

.placeholder {
	color: #65657b;
	font-family: sans-serif;
	left: 20px;
	line-height: 14px;
	pointer-events: none;
	position: absolute;
	transform-origin: 0 50%;
	transition: transform 200ms, color 200ms;
	top: 20px;
}

.input:focus ~ .placeholder, .input:not(:placeholder-shown) ~
	.placeholder {
	transform: translateY(-30px) translateX(10px) scale(0.75);
}

.input:not(:placeholder-shown) ~ .placeholder {
	color: #808097;
}

.input:focus ~ .placeholder {
	color: #dc2f55;
}

.submit {
	background-color: #08d;
	border-radius: 12px;
	border: 0;
	box-sizing: border-box;
	color: #eee;
	cursor: pointer;
	font-size: 18px;
	height: 50px;
	margin-top: 38px; //
	outline: 0;
	text-align: center;
	width: 100%;
}

.submit:active {
	background-color: #06b;
}
</style>
</head>
<body>

	<form:form
		action="${pageContext.request.contextPath}/question-answer/process-qanda"
		modelAttribute="qanda">

		<div class="form">
			<div class="title" style="text-align: center;">Question and Answer Builder</div>
			<div class="subtitle">Please use the following form to create
				Question and Answer to be added to the repository</div>
			<div class="input-container ic1">
				<br>
				<form:input path="question" class="input" size="50" />
				<form:errors path="question" cssClass="error"></form:errors>
				<label for="lastname" class="placeholder">Question:</label>

			</div>
			<div class="input-container ic2">
				<br>
				<form:input class="input" path="answer" />
				<form:errors path="answer" cssClass="error"></form:errors>
				<label for="lastname" class="placeholder">Answer:</label>
			</div>
			<div class="input-container ic2">
				<br>
				<form:select class="input" path="knowledgeareas">
					<form:option value="SIT218" label="SIT218 Secure coding" />
					<form:option value="SIT282" label="SIT282 Digital Forensics" />
					<form:option value="SIT382" label="SIT382 Ethical Hacking" />
				</form:select>

				<label for="email" class="placeholder">Knowledge Area:</label>
			</div>
			<input type="submit" class="submit" value="Add to database" />
		</div>

	</form:form>


</body>
</html>