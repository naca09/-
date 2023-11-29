package com.sikiedu.servelt;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.sikiedu.model.Order;
import com.sikiedu.model.User;
import com.sikiedu.service.OrderService;

/**
 * Servlet implementation class OrderConfirmServlet
 */
@WebServlet("/order_confirm")
public class OrderConfirmServlet extends HttpServlet {
	
	private OrderService oService = new OrderService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Order o = (Order) request.getSession().getAttribute("order");
        try {
            BeanUtils.copyProperties(o, request.getParameterMap());
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        o.setStatus(2); // Assuming status 2 means order is confirmed
        o.setUser((User) request.getSession().getAttribute("user"));
        System.out.println(o.getAddress());
        oService.addOrder(o);
        request.getSession().removeAttribute("order");
        
        request.setAttribute("msg", "Successful！"); // Order payment successful!
        request.getRequestDispatcher("/order_success.jsp").forward(request, response);
	}

}
