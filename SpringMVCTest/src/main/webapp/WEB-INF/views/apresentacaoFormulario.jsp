<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE HTML>
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel='stylesheet' href='webjars/bootstrap/3.3.6/css/bootstrap.min.css'>
<script type="text/javascript" src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>

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
			
			<form id="form1">
					Usuário: <br>
					<c:choose>
						<c:when test="${requestScope.msg == 'Ok'}">
							<input type="text" name="user" id="user" value="${requestScope.user}" onchange="trocaUser()"> &nbsp
							<button type="submit" id="verificaUser" style="display: none" name="verificaUser" formaction="${validarUsuario}" formmethod="post">Verificar Usuário</button><br>
							<span id="userDisp" style="display: inline; color: blue">Usuário Dísponivel</span>
						</c:when>
						<c:otherwise>
							<input type="text" name="user" id="user"> &nbsp 
							<button type="submit" id="verificaUser" name="verificaUser" formaction="${validarUsuario}" formmethod="post">Verificar Usuário</button><br>
							<span style="color: red">${requestScope.msg}</span>
						</c:otherwise>
					</c:choose>
			</form>
			
			<form method="POST" id="form" onsubmit="return verificaForm(this)">
				<div id="div1">
					
					Nome: <br> 
					<input type="text" name="nome" id="nome"> <br>
					E-mail: <br> 
					<input type="text" name="email" id="email"> <br> 
					Idade: <br>
					<input type="text" name="idade" id="idade"> <br>
					Senha: <br>
					<input type="password" name="password" id="password"> <br>
					Confirmar Senha: <br>
					<input type="password" name="password1" id="password1">
					<br>
					Selecione um Estado: <br>
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
				</div>
			
				<button class="btn btn-primary btn-lg" type="submit" formaction="${cadastraUsuario}">Cadastrar</button>
				</form>
	</div>			
		</div>
			    	
    	<script type="text/javascript">

    		function verificaForm (form) {
    			if (form.nome.value == "") {
    				alert("É obrigatório inserir um nome");
    				document.getElementById("nome").focus();
    				return false; 
    				
    			}if (form.email.value == "") {
    				alert("É obrigatório inseir um email");
    				document.getElementById("email").focus();
    				return false;
    			
    			}if (form.idade.value == "") {
    				alert("É obrigatório inserir a idade");
    				document.getElementById("idade").focus();
    				return false;
    				
    			}if (form.user.value == "") {
    				alert("É obrigatório inserir um usuário");
    				document.getElementById("user").focus();
    				return false;
    				
    			}if (form.password.value == "") {
    				alert("É obrigatório inserir uma senha");
    				document.getElementById("password").focus();
    				return false;	
    				
    			}if (verificaSenha() == false) {
    				return false;
    			 
    			}if (form.estado.selectedIndex == "") {
    				alert("É obrigatório selecionar um estado");
    				document.getElementById("estado").focus();
    				return false;
    				
    			
    			}if (form.confCadastro.checked == false) {
    				alert("É obrigatório aceitar os termos antes de continuar");
    				document.getElementById("confCadastro").focus();
    				return false;
    			
    			}
    			
    		return true
    			
    		}
    		
    		function verificaSenha () {
    			if (document.getElementById("password").value != document.getElementById("password1").value) {
    				alert("Senhas não são iguais");
    				document.getElementById("password1").focus();
    				return false;
    			}
    			else {
    				return true;
    			}
    		}
			
    		function formDisable () {
    			var form = document.getElementById("form");
    			for(i = 0;i<form.length;i++){
    			    form[i].disabled=true;
    			 }

    		}
    		
    		function formEnable () {
    			var form = document.getElementById("form");
    			for(i = 0;i<form.length;i++){
    			    form[i].disabled=false;
    			 }

    		}
    		
    		function trocaUser () {
     			document.getElementById("verificaUser").style.display = 'inline';
     			document.getElementById("userDisp").style.display = 'none';
     			formDisable();
    		}

    	</script>
		
</body>
</html>