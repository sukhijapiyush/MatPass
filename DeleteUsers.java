package model;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Calendar;
import javax.swing.JOptionPane;

@WebServlet("/del")
public class DeleteUsers extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String sid = request.getParameter("sid");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/matpass", "root", "qwerty");
			Statement st = con.createStatement();
			st.executeUpdate("DELETE FROM users WHERE staffid='" + sid + "'");
			JOptionPane.showMessageDialog(null, "User Deleted!");
			RequestDispatcher view = request.getRequestDispatcher("manage.jsp");
			view.forward(request, response);
			con.close();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
			RequestDispatcher view = request.getRequestDispatcher("manage.jsp");
			view.forward(request, response);
		}
	}
}
