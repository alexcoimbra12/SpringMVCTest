function verificaForm(form) {
	var disp = document.getElementById("userDisp");
	if (form.user.value != ""
			&& document.getElementById("userDisp").style.display == "none") {
		return true;
	} else {

		if (form.nome.value == "") {
			alert("� obrigat�rio inserir um nome");
			document.getElementById("nome").focus();
			return false;

		}
		if (form.email.value == "") {
			alert("� obrigat�rio inseir um email");
			document.getElementById("email").focus();
			return false;

		}
		if (form.idade.value == "") {
			alert("� obrigat�rio inserir a idade");
			document.getElementById("idade").focus();
			return false;

		}
		if (form.password.value == "") {
			alert("� obrigat�rio inserir uma senha");
			document.getElementById("password").focus();
			return false;

		}
		if (verificaSenha() == false) {
			return false;

		}
		if (form.estado.selectedIndex == "") {
			alert("� obrigat�rio selecionar um estado");
			document.getElementById("estado").focus();
			return false;

		}
		if (form.confCadastro.checked == false) {
			alert("� obrigat�rio aceitar os termos antes de continuar");
			document.getElementById("confCadastro").focus();
			return false;

		}

		return true;
	}
}

function verificaSenha() {
	if (document.getElementById("password").value != document
			.getElementById("password1").value) {
		alert("Senhas n�o s�o iguais");
		document.getElementById("password1").focus();
		return false;
	} else {
		return true;
	}
}

function formDisable() {
	document.getElementById("div1").style.display = 'none';
}

function formEnable() {
	document.getElementById("div1").style.display = 'inline';
}

function trocaUser() {
	document.getElementById("verificaUser").style.display = 'inline';
	document.getElementById("userDisp").style.display = 'none';
	formDisable();
}

function verificaCampoUser(button) {

	if (document.getElementById("user").value == "") {
		alert("� obrigat�rio inserir um usu�rio");
		document.getElementById("user").focus();
		formDisable();
		return false;
	}
}
function validaNumber() {
	if (isNaN(document.getElementById("idade").value)) {
		alert("Digite apenas n�meros!");
		document.getElementById("idade").value = "";
		document.getElementById("idade").select();
		return false;
	} else {
		return false;
	}
}
