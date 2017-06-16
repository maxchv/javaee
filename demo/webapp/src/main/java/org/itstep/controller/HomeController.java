package org.itstep.controller;


import org.slf4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class HomeController extends HttpServlet {

    public static final Logger LOG = org.slf4j.LoggerFactory.getLogger(HttpServlet.class);

    @Override
    public void init(ServletConfig config) throws ServletException {
        String name = config.getServletName();
        LOG.info("Start servlet " + name);
        String database = config.getInitParameter("database");
        LOG.info("Database: " + database);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LOG.info("Do get");
        req.setAttribute("title", "Home page");

        try (
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
        ) {
            Statement stmt = conn.createStatement();
        } catch (SQLException e) {
            LOG.error(e.getMessage());
        }

        RequestDispatcher d = req.getRequestDispatcher("/WEB-INF/jsp/index.jsp");

        d.forward(req, resp);
    }
}
