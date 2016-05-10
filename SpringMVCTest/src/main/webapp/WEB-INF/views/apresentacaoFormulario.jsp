<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE HTML>
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Cadastro Usuario</title>

<link rel='stylesheet' href='webjars/bootstrap/3.3.6/css/bootstrap.min.css'>
<script src="webjars/jquery/1.11.1/jquery.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="webjars/bootstrap/3.3.6/js/bootstrap.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="WebContent/js/form-validation.js" charset="UTF-8"></script>

<script type="text/javascript">
	window.onload = function(){
	
	var msg = "${requestScope.msg}";
	
	if (msg == 'Ok') {
		formEnable();
	} else {
		formDisable();
	}

}
</script>
</head>
<body>


	<jsp:include page="barra_superior.jspf"/>
 
   <jsp:include page="barra_busca.jspf"/>
   
	<h2>Por favor, insira os seus dados abaixo</h2>
	<h3>Dados do Usuário</h3>
	<div class="jumbotron">
      <div class="container">
			
			<form method="POST" id="form"  onsubmit="return verificaForm(this)">
				<div id="div">
					<label>Usuário:</label> <br>
					<c:choose>
						<c:when test="${requestScope.msg == 'Ok'}">
							<input type="text" name="user" id="user" value="${requestScope.user}" onchange="trocaUser()"> &nbsp
							<button type="submit" class="btn btn-primary btn-xs" id="verificaUser" style="display: none" name="verificaUser"  formmethod="post" onclick="return verificaCampoUser(this)">
								Verificar Usuário
							</button><br>
							<span id="userDisp" style="display: inline; color: blue">Usuário Dísponivel</span>
						</c:when>
						<c:otherwise>
							<input type="text" name="user" id="user"> &nbsp 
							<button type="submit" class="btn btn-primary btn-xs" id="verificaUser" name="verificaUser" formmethod="post" onclick="return verificaCampoUser(this)">
								Verificar Usuário
							</button><br>
							<span style="color: red">${requestScope.msg}</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div id="div1" style="display: none">
					
					<label>Nome:</label> <br> 
					<input type="text" name="nome" id="nome"> <br>
					<label>E-mail:</label> <br> 
					<input type="text" name="email" id="email"> <br> 
					<label>Idade:</label> <br>
					<input type="text" name="idade" id="idade" onchange="validaNumber();" maxlength="2"> <br>
					<label>Senha:</label> <br>
					<input type="password" name="password" id="password"> <br>
					<label>Confirmar Senha:</label> <br>
					<input type="password" name="password1" id="password1">
					<br>
					<label>Selecione um Estado:</label> <br>
					<select name="estado" id="estado">
					 	<option value="estado">Selecione o Estado</option> 
						<option value="ac">Acre</option> 
						<option value="al">Alagoas</option> 
						<option value="am">Amazonas</option> 
						<option value="ap">Amapá</option> 
						<option value="ba">Bahia</option> 
						<option value="ce">Ceará</option> 
						<option value="df">Distrito Federal</option> 
						<option value="es">Espírito Santo</option> 
						<option value="go">Goiás</option> 
						<option value="ma">Maranhão</option> 
						<option value="mt">Mato Grosso</option> 
						<option value="ms">Mato Grosso do Sul</option> 
						<option value="mg">Minas Gerais</option> 
						<option value="pa">Pará</option> 
						<option value="pb">Paraíba</option> 
						<option value="pr">Paraná</option> 
						<option value="pe">Pernambuco</option> 
						<option value="pi">Piauí</option> 
						<option value="rj">Rio de Janeiro</option> 
						<option value="rn">Rio Grande do Norte</option> 
						<option value="ro">Rondônia</option> 
						<option value="rs">Rio Grande do Sul</option> 
						<option value="rr">Roraima</option> 
						<option value="sc">Santa Catarina</option> 
						<option value="se">Sergipe</option> 
						<option value="sp">São Paulo</option> 
						<option value="to">Tocantins</option> 
					 </select>
					 <br> <br>
					 <input type="checkbox" id="confCadastro" name="confCadastro"> Aceito os termos de Cadastro.
					 <br>
				
			
				<button class="btn btn-primary" type="submit" formaction="${cadastraUsuario}">Cadastrar</button>
				</div>
				</form>
	</div>			
		</div>
		
</body>
</html>