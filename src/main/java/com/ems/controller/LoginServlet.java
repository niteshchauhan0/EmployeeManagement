package com.ems.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String empId = req.getParameter("empId");
        String password = req.getParameter("password");

        try (Connection con = DBUtil.getConnection()) {
            // Check credentials in database
            PreparedStatement ps = con.prepareStatement("SELECT * FROM employees WHERE emp_id=? AND password=?");
            ps.setString(1, empId);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // If credentials are valid
                HttpSession session = req.getSession();
                session.setAttribute("empId", empId);
                session.setAttribute("empName", rs.getString("name"));

                // Set toast message for success
                session.setAttribute("toastMessage", "Login Successful!");

                // Redirect to dashboard
                res.sendRedirect("dashboard.jsp");
            } else {
                // If credentials are invalid
                req.setAttribute("error", "Invalid ID or Password");
                req.getRequestDispatcher("login.jsp").forward(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Something went wrong. Please try again later.");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }
}
