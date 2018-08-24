package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

@WebServlet("/ValidateLogin")
public class ValidateLogin extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String n = request.getParameter("sid");
		String p = request.getParameter("pass");
		HttpSession session = request.getSession(true);
		Connection conn = null;
		response.setContentType("text/html");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matpass", "root", "qwerty");
			PreparedStatement st = conn
					.prepareStatement("SELECT staffid,role FROM users WHERE pwd='" + p + "' AND staffid='" + n + "'");
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				System.out.println("Success");
				session.setAttribute("session_user", n);
				if (rs.getString("role").equalsIgnoreCase("admin")) {
					RequestDispatcher view = request.getRequestDispatcher("LoginSuccessAdmin.jsp");
					view.forward(request, response);
				} else if (rs.getString("role").equalsIgnoreCase("issuer")) {
					RequestDispatcher view = request.getRequestDispatcher("LoginSuccessi.jsp");
					view.forward(request, response);
				} else if (rs.getString("role").equalsIgnoreCase("authorizer")) {
					RequestDispatcher view = request.getRequestDispatcher("LoginSuccessa.jsp");
					view.forward(request, response);
				} else if (rs.getString("role").equalsIgnoreCase("security")) {
					RequestDispatcher view = request.getRequestDispatcher("LoginSuccesssec.jsp");
					view.forward(request, response);
				}

			} else {
				System.out.println("Unsuccessful");
				JOptionPane.showMessageDialog(null, "Incorrect Username or Password.");
				RequestDispatcher view = request.getRequestDispatcher("LoginPage.jsp");
				view.forward(request, response);
			}
			rs.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
