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
<script type="text/javascript" src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body>
	<jsp:include page="barra_superior.jspf"/>
 
    <jsp:include page="barra_busca.jspf"/>
 
   <div class="jumbotron">
      <div class="container">
      <c:choose>
      		<c:when test="${empty usuario}">
	      		<p>Não Encontramos Resultados</p>
      		</c:when>
      	<c:otherwise>
      		<form method="POST">
      		<table class="table table-hover">
      		
      				<tr>
      					<td>
      						<label>Nome</label>
      					</td>
      					<td> 
      						<label>E-mail</label>
      					</td>
      					<td> 
      						<label>Idade</label>
      					</td>
      					<td> 
      						<label>Estado</label>
      					</td>
      					<td>
      						<label>Usuario</label>
      					</td>
      					<td>
      						<label>Ação</label>
      					</td>
      				</tr>
      			      				
		      	
		      		   	<tr><td><input type="text" value="${usuario.nome}" id="nome" name="nome"></td>
						<td><input type="text" value="${usuario.email}" id="email" name="email"></td>
						<td><input type="text" value="${usuario.idade}" id="idade" name="idade"></td>
						<td><input type="text" value="${usuario.estado}" id="estado" name="estado"></td>
						<td><input type="text" value="${usuario.user}" id="user" name="user"></td>
						<td><button type="submit" class="btn btn-primary" value="${usuario.id}" id="alterar" name="alterar" formaction="${atualizarUsuario}">Atualizar</button></td></tr>
      				
			</table>
			</form>	
      	</c:otherwise>
      </c:choose>
      </div>
    </div>
</body>
</html>