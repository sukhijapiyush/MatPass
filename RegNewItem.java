package model;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Calendar;
import java.util.Random;
import javax.swing.JOptionPane;

@WebServlet("/register")
public class RegNewItem extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		String type = request.getParameter("type");
		String pur = request.getParameter("pur");
		String pdesc = request.getParameter("pdesc");
		String bdesc = request.getParameter("bdesc");
		// String validity = request.getParameter("valid");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/matpass", "root", "qwerty");
			PreparedStatement stmt = con.prepareStatement(
					"insert into records(type,purpose,pdesc,bdesc,valid,auth,ret) values(?,?,?,?,?,?,?)");
			stmt.setString(1, type);
			stmt.setString(2, pur);
			stmt.setString(3, pdesc);
			stmt.setString(4, bdesc);
			stmt.setNull(5, java.sql.Types.DATE);
			stmt.setInt(6, 0);
			int x = type.equalsIgnoreCase("Returnable") ? 1 : 0;
			stmt.setInt(7, x);
			stmt.executeUpdate();
			JOptionPane.showMessageDialog(null, "Item Registered!!");
			RequestDispatcher view = request.getRequestDispatcher("LoginSuccessi.jsp");
			view.forward(request, response);
			con.close();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
			RequestDispatcher view = request.getRequestDispatcher("addItem.jsp");
			view.forward(request, response);
		}
	}
}
