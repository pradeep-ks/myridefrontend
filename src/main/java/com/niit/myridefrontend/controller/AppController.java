package com.niit.myridefrontend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.myridebackend.dao.ProductDao;
import com.niit.myridebackend.model.Product;

@Controller
public class AppController {

	@Autowired
	ProductDao productDao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView view = new ModelAndView("index");
		return view;
	}
	
	@RequestMapping("/register")
	public ModelAndView register() {
		ModelAndView view = new ModelAndView("register");
		return view;
	}
	
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView view = new ModelAndView("login");
		return view;
	}
	
	@RequestMapping("/products/{category}")
	public ModelAndView products(@PathVariable("category") String category) {
		List<Product> products = productDao.getByCategory(category);
		String jsonData = new Gson().toJson(products);
		ModelAndView view = new ModelAndView("products");
		view.addObject("productData", jsonData);
		
		return view;
	}
	
	@RequestMapping("/productDetails/{id}")
	public ModelAndView productDetails(@PathVariable("productId") int productId) {
		Product product = productDao.getById(productId);
		String jsonData = new Gson().toJson(product);
		ModelAndView model = new ModelAndView("productDetails");
		model.addObject("product", jsonData);
		
		return model;
	}
}
