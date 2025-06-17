package com.ems.controller;

import com.ems.controller.DBUtil;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ViewProfileServlet")
public class ViewProfileServlet extends HttpServlet {
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
                req.getRequestDispatcher("viewProfile.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
