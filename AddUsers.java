package model;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Calendar;
import javax.swing.JOptionPane;

@WebServlet("/add")
public class AddUsers extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String sid = request.getParameter("sid");
		String role =request.getParameter("role");
		String pwd =request.getParameter("pwd");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/matpass", "root", "qwerty");
			PreparedStatement stmt1 = con.prepareStatement("SELECT pwd,sid FROM newuser WHERE sid=" + sid);
			ResultSet rsResultSet = stmt1.executeQuery();
			rsResultSet.next();
			PreparedStatement stmt = con.prepareStatement("insert into users values(?,?,?)");
			stmt.setString(1, sid);
			stmt.setString(2, pwd);
			stmt.setString(3, role);
			stmt.executeUpdate();
			Statement st = con.createStatement();
			st.executeUpdate("DELETE FROM newuser WHERE sid='" + sid+"'");
			JOptionPane.showMessageDialog(null,
					"User Added!");
			RequestDispatcher view = request.getRequestDispatcher("addUsers.jsp");
			view.forward(request, response);
			con.close();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
			RequestDispatcher view = request.getRequestDispatcher("addUsers.jsp");
			view.forward(request, response);
		}
	}
}
