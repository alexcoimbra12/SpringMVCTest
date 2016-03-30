package com.accenture.treinamento.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.accenture.treinamento.spring.dao.UsuarioDao;
import com.accenture.treinamento.spring.model.Usuario;

@Controller
public class CadastrarUsuarioController {

	@RequestMapping("/olaMundoSpring")
	public String execute() {
		System.out.println("Executando a logica com Spring MVC");
		return "ok";
	}

	@RequestMapping(value = { "", "/" }, method = RequestMethod.POST)
	public ModelAndView cadastraUsuario(HttpServletRequest req,
			HttpServletResponse resp) {

		try {
			Usuario usuario = new Usuario();

			usuario.setNome(req.getParameter("nome"));
			usuario.setEmail(req.getParameter("email"));
			usuario.setIdade(req.getParameter("idade"));
			usuario.setUserName(req.getParameter("user"));
			usuario.setPassword(req.getParameter("password"));
			usuario.setEstado(req.getParameter("estado"));

			UsuarioDao usuarioDao = new UsuarioDao();
			usuarioDao.persist(usuario);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erro ao salvar no banco" + e);
		}
		ModelAndView mv;

		mv = new ModelAndView("apresentacaoDados");

		mv.addObject("nome", req.getAttribute("nome"));
		mv.addObject("email", req.getAttribute("email"));
		mv.addObject("idade", req.getAttribute("idade"));
		mv.addObject("estado", req.getAttribute("estado"));

		System.out.println(req.getParameter("nome"));

		return mv;

	}

	@RequestMapping(value = { "", "/" }, method = RequestMethod.GET)
	public ModelAndView apresentaFormulario(HttpServletRequest req,
			HttpServletResponse resp) {

		ModelAndView mv = new ModelAndView("apresentacaoFormulario");
		return mv;

	}

	@RequestMapping(value = { "/ListUser" }, method = RequestMethod.GET)
	public List<Usuario> buscarUsuario(HttpServletRequest req,
			HttpServletResponse resp) {

		List<Usuario> list = new ArrayList<Usuario>();

		String usuario = req.getParameter("buscarNome");
		UsuarioDao usuarioDao = new UsuarioDao();

		List<Usuario> listUser = usuarioDao.findByName(usuario);
		
		if (listUser.isEmpty() || listUser.getClass() == null){
			list.isEmpty();
		} else {
			
			for (Usuario listUser1 : listUser) {
				for (int i = 0; i<listUser.size(); i++) {
			
					Usuario usuario1 = new Usuario();
					
					usuario1.setNome(listUser.get(i).getNome());
					usuario1.setEmail(listUser.get(i).getEmail());
					usuario1.setIdade(listUser.get(i).getIdade());
					usuario1.setEstado(listUser.get(i).getEstado());
					usuario1.setUserName(listUser.get(i).getUserName());
					usuario1.setId(listUser.get(i).getId());
					
					list.add(usuario1);
				
					System.out.println(listUser.get(0).getNome());
				}
				return list;
			}
		}	
			return list;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public List<Usuario> deletarUsuario (HttpServletRequest req,
			HttpServletResponse resp) {
			
		System.out.println(req.getParameter("deletar"));
		Integer id = Integer.valueOf(req.getParameter("deletar"));
		
		UsuarioDao usuarioDao = new UsuarioDao();
		
		usuarioDao.removeById(id);
		
		return buscarUsuario(req, resp);
	}
	
	public ModelAndView validarUsuario (HttpServletRequest req,
			HttpServletResponse resp) {
		
		String userName = req.getParameter("userName");
		UsuarioDao usuarioDao = new UsuarioDao();
		
		ModelAndView mv = new ModelAndView();
		
		return mv.addObject("validaUser", usuarioDao.validarUserName(userName));
	}
}
	

