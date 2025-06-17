package com.ems.controller;

import com.ems.controller.DBUtil;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("empId") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        String empId = (String) session.getAttribute("empId");

        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM employees WHERE emp_id=?");
            ps.setString(1, empId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                req.setAttribute("emp_id", rs.getString("emp_id"));
                req.setAttribute("name", rs.getString("name"));
                req.setAttribute("email", rs.getString("email"));
                req.getRequestDispatcher("updateProfile.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String empId = req.getParameter("empId");
        String name = req.getParameter("name");
        String email = req.getParameter("email");

        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement("UPDATE employees SET name=?, email=? WHERE emp_id=?");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, empId);
            ps.executeUpdate();

            // Set toast message
            HttpSession session = req.getSession();
            session.setAttribute("toastMessage", "Profile updated successfully!");

            // Redirect to view profile
            res.sendRedirect("ViewProfileServlet");

        } catch (Exception e) {
            e.printStackTrace();

            // Optional: set error message
            req.setAttribute("error", "Update failed. Please try again.");
            req.getRequestDispatcher("updateProfile.jsp").forward(req, res);
        }
    }
}
