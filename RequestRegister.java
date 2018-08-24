package model;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Calendar;
import javax.swing.JOptionPane;

@WebServlet("/requestuser")
public class RequestRegister extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("nam");
		String pwd = request.getParameter("pwd");
		String sid = request.getParameter("sid");
		String eid = request.getParameter("eid");
		String phno = request.getParameter("no");
		String deptid = request.getParameter("did");
		String desig = request.getParameter("desg");
		String role = request.getParameter("role");
		Calendar calendar = Calendar.getInstance();
		java.sql.Date DateObject = new java.sql.Date(calendar.getTime().getTime());

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/matpass", "root", "qwerty");

			PreparedStatement stmt = con.prepareStatement("insert into newuser values(?,?,?,?,?,?,?,?,?)");
			stmt.setString(1, name);
			stmt.setString(2, pwd);
			stmt.setString(3, sid);
			stmt.setString(4, eid);
			stmt.setString(5, phno);
			stmt.setString(6, deptid);
			stmt.setString(7, desig);
			stmt.setDate(8, DateObject);
			stmt.setString(9,role);
			stmt.executeUpdate();

			JOptionPane.showMessageDialog(null,
					"Your request for registration as new user is complete! Contact Admin to activate Login Credentials!");
			RequestDispatcher view = request.getRequestDispatcher("LoginPage.jsp");
			view.forward(request, response);
			con.close();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
			RequestDispatcher view = request.getRequestDispatcher("requestregister.jsp");
			view.forward(request, response);
		}
	}
}
