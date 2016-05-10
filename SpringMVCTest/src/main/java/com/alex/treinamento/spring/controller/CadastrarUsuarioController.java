package com.alex.treinamento.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alex.treinamento.spring.dao.UsuarioDao;
import com.alex.treinamento.spring.model.Usuario;

@Controller
public class CadastrarUsuarioController {
	
	private static String MSG_USER_NOT_VALID = "Usuário não está disponível, por favor tente outro";

	@RequestMapping(value = { "", "/" }, method = RequestMethod.POST)
	public ModelAndView cadastraUsuario(HttpServletRequest req,
			HttpServletResponse resp) {
				
		ModelAndView mv;	
		String nome = req.getParameter("nome");
		if (nome == null || nome.equals("")) {
			
			boolean userOk;
			mv = new ModelAndView("apresentacaoFormulario");
			String userName = req.getParameter("user");
			UsuarioDao usuarioDao = new UsuarioDao();

			userOk = usuarioDao.validarUserName(userName);

			if (userOk == true) {
				
				String ok = "Ok";
				req.setAttribute("msg", ok);
				req.setAttribute("user", userName);
				
			} else {
				req.setAttribute("msg", MSG_USER_NOT_VALID);
				
			}
			
		} else {
		try {
			Usuario usuario = new Usuario();

			usuario.setNome(req.getParameter("nome"));
			usuario.setEmail(req.getParameter("email"));
			usuario.setIdade(req.getParameter("idade"));
			usuario.setUser(req.getParameter("user"));
			usuario.setPassword(req.getParameter("password"));
			usuario.setEstado(req.getParameter("estado"));

			UsuarioDao usuarioDao = new UsuarioDao();
			usuarioDao.persist(usuario);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erro ao salvar no banco" + e);
		}
		mv = new ModelAndView("apresentacaoDados");
		}
		
		return mv;

	}

	@RequestMapping(value = { "", "/" }, method = RequestMethod.GET)
	public ModelAndView apresentaFormulario(HttpServletRequest req,
			HttpServletResponse resp) {

		ModelAndView mv = new ModelAndView("apresentacaoFormulario");
		req.setAttribute("msg", "");
		return mv;

	}

	@RequestMapping(value = { "/ListUser" }, method = RequestMethod.GET)
	public List<Usuario> buscarUsuario(HttpServletRequest req,
			HttpServletResponse resp) {

		String usuario = req.getParameter("buscarNome");
		UsuarioDao usuarioDao = new UsuarioDao();

		List<Usuario> listUser = usuarioDao.findByName(usuario);

		return listUser;
	}

	@RequestMapping(value = { "/remove" }, method = RequestMethod.POST)
	public List<Usuario> deletarUsuario(HttpServletRequest req,
			HttpServletResponse resp) {

		System.out.println(req.getParameter("deletar"));
		Integer id = Integer.valueOf(req.getParameter("deletar"));

		UsuarioDao usuarioDao = new UsuarioDao();

		usuarioDao.removeById(id);

		return buscarUsuario(req, resp);
	}

	@RequestMapping(value = { "/EditUser" }, method = RequestMethod.GET)
	public Usuario findUsersToEdit(HttpServletRequest req,
			HttpServletResponse resp) {

		UsuarioDao usuarioDao = new UsuarioDao();

		Integer id = Integer.valueOf(req.getParameter("editar"));
		Usuario usuario = usuarioDao.getById(id);
		
		return usuario;
	}

	@RequestMapping(value = { "/EditUser" }, method = RequestMethod.POST)
	public Usuario atualizarUsuario(HttpServletRequest req,
			HttpServletResponse resp) {

		Integer id = Integer.valueOf(req.getParameter("alterar"));

		Usuario usuario = new Usuario();

		UsuarioDao usuarioDao = new UsuarioDao();
		usuario = usuarioDao.getById(id);

		usuario.setNome(req.getParameter("nome"));
		usuario.setEmail(req.getParameter("email"));
		usuario.setIdade(req.getParameter("idade"));
		usuario.setUser(req.getParameter("user"));
		usuario.setPassword(usuario.getPassword());
		usuario.setEstado(req.getParameter("estado"));

		usuarioDao.merge(usuario);

		return findUsersToEdit(req, resp);
	}
	
	@RequestMapping(value = { "/AllUser" }, method = RequestMethod.GET)
	public List<Usuario> findAllUser (HttpServletRequest req,
			HttpServletResponse resp) {
		
		UsuarioDao usuarioDao = new UsuarioDao();
		List<Usuario> listUsers = usuarioDao.findAll();
		
		return listUsers;
	}
}
