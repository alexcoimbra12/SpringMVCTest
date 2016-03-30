<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagina Inicial</title>

<link rel='stylesheet' href='webjars/bootstrap/3.3.6/css/bootstrap.min.css'>
<script type="text/javascript" src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="barra_superior.jspf"/>
 
    <jsp:include page="barra_busca.jspf"/>
    
    
		<div class="jumbotron">
      		<div class="container">
      			<div class="row">
      				<div class="col-md-4">
		        		<h1>Hello, world!</h1>
		        		
		        		<img src="images/fundo.jpg" alt="Teste Img">
		        		<p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
		        		<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
      				</div>
      			</div>
      		</div>
    	</div>
	
</body>
</html>