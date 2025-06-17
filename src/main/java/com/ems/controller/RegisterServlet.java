package com.ems.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Get form data
        String empId = req.getParameter("empId");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Basic validation (optional: can add stronger validation)
        if (empId == null || name == null || email == null || password == null ||
                empId.isEmpty() || name.isEmpty() || email.isEmpty() || password.isEmpty()) {
            req.setAttribute("error", "All fields are required.");
            req.getRequestDispatcher("register.jsp").forward(req, res);
            return;
        }

        try (Connection con = DBUtil.getConnection()) {
            // Insert new employee into database
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO employees (emp_id, name, email, password) VALUES (?, ?, ?, ?)");
            ps.setString(1, empId);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, password);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                // Registration success, redirect to login
                req.setAttribute("success", "Registration successful! Please login.");
                req.getRequestDispatcher("login.jsp").forward(req, res);
            } else {
                // Should not happen, but fallback
                req.setAttribute("error", "Registration failed. Please try again.");
                req.getRequestDispatcher("register.jsp").forward(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Handle SQL constraint errors, like duplicate emp_id
            req.setAttribute("error", "Employee ID already exists or internal error occurred.");
            req.getRequestDispatcher("register.jsp").forward(req, res);
        }
    }
}
