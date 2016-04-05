package com.alex.treinamento.spring.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.alex.treinamento.spring.model.Usuario;


public class UsuarioDao {
	
	private static UsuarioDao instance;
	protected EntityManager entityManager;
	
	public static UsuarioDao getInstance(){
		if (instance == null) {
			instance = new UsuarioDao();
		}
		return instance;
	}
	
	public UsuarioDao() {
		entityManager = getEntityManager();
	}

	private EntityManager getEntityManager() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("crudHibernatePU");
		if (entityManager == null) {
			entityManager = factory.createEntityManager();
		}
		return entityManager;
	}
	
	public Usuario getById (final int id) {
		return entityManager.find(Usuario.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Usuario> findAll(){
		return entityManager.createQuery("FROM " + Usuario.class.getName()).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Usuario> findByName(String nome){
		if (nome == null || nome.equals("")) {
			List<Usuario> usuario = new ArrayList<Usuario>();
			usuario.isEmpty();
			return usuario;
		} else {
		return entityManager.createQuery("SELECT c FROM Usuario c WHERE c.nome LIKE :nome").setParameter("nome", "%"+nome+"%").getResultList();
		}
	

	}
	@SuppressWarnings({ "unchecked" })
	public boolean validarUserName(String userName) {
		
		List<Usuario> usuario = new ArrayList<Usuario>();
		try {
			System.out.println(userName);
			usuario = entityManager.createQuery("SELECT c.user from Usuario c WHERE c.user = :user").setParameter("user", userName).getResultList();
		} catch (Exception e) {
			System.out.println("Entrou no Catch");
			e.printStackTrace();
			return false;
		}
				
		if(usuario.isEmpty()) {
			return true;
		} else {
			return false;
		}
	}	
	public void persist (Usuario usuario) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(usuario);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			entityManager.getTransaction().rollback();
		}
	}
	
	public void merge (Usuario usuario) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(usuario);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			entityManager.getTransaction().rollback();
		}
	}
	
	public void remove (Usuario usuario) {
		try {
			entityManager.getTransaction().begin();
			entityManager.remove(usuario);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			entityManager.getTransaction().rollback();
		}
	}
	
	public void removeById (final int id) {
		try {
			Usuario usuario = getById(id);
			remove(usuario);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
