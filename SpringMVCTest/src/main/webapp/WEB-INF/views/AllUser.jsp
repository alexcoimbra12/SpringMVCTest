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
<script type="text/javascript" src="WebContent/js/bootstrap-confirmation.min.js"></script>

</head>
<body>
	<jsp:include page="barra_superior.jspf"/>
 
    <jsp:include page="barra_busca.jspf"/>
 
   <div class="jumbotron">
      <div class="container">
      <c:choose>
      		<c:when test="${empty usuarioList}">
	      		<p>Não existem usuários cadastrados.</p>
      		</c:when>
      	<c:otherwise>
      		<form method="POST">
      			<table class="table table-hover">
      			<caption>Usuários Encontrados</caption>
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
		      	<c:forEach items="${usuarioList}" var="usuario">
		        	<tr><td>${usuario.nome}</td>
					<td>${usuario.email}</td>
					<td>${usuario.idade}</td>
					<td>${usuario.estado}</td>
					<td>${usuario.user}</td>
					<td><button class='btn btn-danger btn-xs' type="submit" formaction="/SpringMVCTest/remove" data-toggle="confirmation" data-btn-ok-label="Continuar" data-btn-ok-class="btn-success" data-btn-cancel-label="Cancelar" data-btn-cancel-class="btn-danger" name="deletar" id="deletar" value="${usuario.id}">Deletar</button>
					<button type="submit" class="btn btn-primary btn-xs" value="${usuario.id}" id="editar" name="editar" formaction="/SpringMVCTest/EditUser" formmethod="get">Editar</button></td><tr>
		        </c:forEach>
      			</table>
      		</form>	
      	</c:otherwise>
      </c:choose>
      </div>
    </div>
<script>
  $('[data-toggle=confirmation]').confirmation();
  $('[data-toggle=confirmation-singleton]').confirmation({ singleton:true });
  $('[data-toggle=confirmation-popout]').confirmation({ popout: true });
</script> 
</body>
</html>