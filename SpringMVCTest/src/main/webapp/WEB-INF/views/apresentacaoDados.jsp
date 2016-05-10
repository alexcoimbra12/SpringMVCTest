<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Cadastro de Usuario</title>

<link rel='stylesheet' href='webjars/bootstrap/3.3.6/css/bootstrap.min.css'>


<script type="text/javascript" src="webjars/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="barra_superior.jspf"/>
 
    <jsp:include page="barra_busca.jspf"/>
 
   <div class="jumbotron">
      <div class="container">
      <h1>Usuário Cadastrado com Sucesso!</h1>
      	<table class="table table-striped">
      		<caption>Dados do Usuário</caption>
	  		<tr>
	  			<td><label>Nome</label></td>
	  		    <td><label>E-mail</label></td>
	  		    <td><label>Idade</label></td>
	  		    <td><label>Estado</label></td>
	        </tr>
	        <tr>
	        	<td>${param.nome}</td>
				<td>${param.email}</td>
				<td>${param.idade}</td>
				<td>${param.estado}</td>
			</tr> 
      	</table>
      </div>
    </div>
</body>
</html>