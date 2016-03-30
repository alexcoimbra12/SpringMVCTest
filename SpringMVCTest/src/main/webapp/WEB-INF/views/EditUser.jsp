<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
      		<c:when test="${empty usuarioList}">
	      		<p>Não Encontramos Resultados</p>
      		</c:when>
      	<c:otherwise>
      		<table border="2" style="width: 50%">
      		
      				<tr><td>Nome </td>
      				<td> E-mail </td>
      				<td> Idade </td>
      				<td> Estado </td>
      				<td> Usuario </td>
      				<td>Ação</td></tr>
      			
      				
		      	<c:forEach items="${usuarioList}" var="usuario">
		      	<form method="POST">
		      		   	<tr><td><input type="text" value="${usuario.nome}" id="nome" name="nome"></td>
						<td><input type="text" value="${usuario.email}" id="email" name="email"></td>
						<td><input type="text" value="${usuario.idade}" id="idade" name="idade"></td>
						<td><input type="text" value="${usuario.estado}" id="estado" name="estado"></td>
						<td><input type="text" value="${usuario.userName}" id="user" name="user"></td>
						<td><button type="submit" value="${usuario.id}" id="alterar" name="alterar" formaction="${atualizarUsuario}">Atualizar</button></td><tr>
      			</form>	
		        </c:forEach>
			</table>	
      	</c:otherwise>
      </c:choose>
      </div>
    </div>
    
    
</body>
</html>