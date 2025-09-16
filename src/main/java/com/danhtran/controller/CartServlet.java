package com.danhtran.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
        	 String product = request.getParameter("product");
        	    if (product != null) {
        	        String[] parts = product.split(":");
        	        String name = parts[0];
        	        double price = Double.parseDouble(parts[1]);

        	        boolean exists = false;
        	        for (Map<String, Object> item : cart) {
        	            if (item.get("name").equals(name)) {
        	                int quantity = (int) item.get("quantity") + 1;
        	                item.put("quantity", quantity);
        	                exists = true;
        	                break;
        	            }
        	        }
        	        if (!exists) {
        	            Map<String, Object> newItem = new HashMap<>();
        	            newItem.put("name", name);
        	            newItem.put("price", price);
        	            newItem.put("quantity", 1);
        	            cart.add(newItem);
        	        }
        	    }
            response.sendRedirect(request.getContextPath() + "/cart.jsp");
        }

        else if ("update".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            int qty = Integer.parseInt(request.getParameter("quantity"));
            if (qty > 0) {
                cart.get(index).put("quantity", qty);
            }
            response.sendRedirect(request.getContextPath() + "/cart.jsp");
        }

        else if ("remove".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            cart.remove(index);
            response.sendRedirect(request.getContextPath() + "/cart.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}

