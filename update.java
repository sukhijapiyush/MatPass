package model;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Calendar;
import java.util.Random;
import javax.swing.JOptionPane;

@WebServlet("/update")
public class update extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		String strId = request.getParameter("id");
		int id = Integer.parseInt(strId);
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/";
		String db = "matpass";
		String driver = "com.mysql.cj.jdbc.Driver";
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url + db, "root", "qwerty");
			try {
				Statement st = con.createStatement();
				String type = request.getParameter("type");
				String purpose = request.getParameter("purpose");
				String pdesc = request.getParameter("pdesc");
				String bdesc = request.getParameter("bdesc");
				int ret = type.equalsIgnoreCase("returnable") ? 1 : 0;
				int in = st.executeUpdate("UPDATE records SET type='" + type + "'" + ",purpose='" + purpose
						+ "',pdesc='" + pdesc + "'" + ",bdesc='" + bdesc + "',ret='" + ret
						+ "'" + "WHERE id='" + id + "'");
				con.close();
				JOptionPane.showMessageDialog(null, "Record Updated");
				RequestDispatcher view = request.getRequestDispatcher("ListRecords.jsp");
				view.forward(request, response);
			} catch (SQLException ex) {
				System.out.println("SQL statement is not executed!");
				JOptionPane.showMessageDialog(null, "Error while updating");
				RequestDispatcher view = request.getRequestDispatcher("edit.jsp");
				view.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "Error while updating");
			RequestDispatcher view = request.getRequestDispatcher("edit.jsp");
			view.forward(request, response);

		}
	}
}
