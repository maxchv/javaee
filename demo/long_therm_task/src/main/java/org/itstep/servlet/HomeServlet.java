package org.itstep.servlet;


import org.itstep.task.Task;
import org.itstep.task.TaskList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.HttpCookie;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = "/")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TaskList list = TaskList.getInstance();
        List<String> result = list.taskKeys().stream()
                .filter(name -> !list.isCompleted(name))
                .collect(Collectors.toList());
        int count = list.taskKeys().size();
        if(result.size() > 0) {
            resp.setHeader("Refresh", "5"); // обновлять каждые 5 сек
        }
        req.setAttribute("result", result);
        req.setAttribute("summary", String.format("All tasks: %d, Completed: %d", count, count - result.size()));
        req.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String task = req.getParameter("task");
        if (task.equals("run")) {
            Cookie cookie = new Cookie(LocalDateTime.now().toString(), "");
            TaskList.getInstance().addAndStart(cookie.getName(), new Task());
            resp.addCookie(cookie);
        }
        resp.sendRedirect("/");
    }
}
