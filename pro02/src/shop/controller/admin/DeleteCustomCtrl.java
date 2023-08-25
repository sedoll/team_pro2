package shop.controller.admin;

import shop.dto.Custom;
import shop.model.CustomDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteCustom.do")
public class DeleteCustomCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        CustomDAO dao = new CustomDAO();
        int cnt = dao.deleteCustom(id);
        if(cnt > 0) {
            System.out.println("회원삭제 완료");
        }
        response.sendRedirect("/pro02/Manage.do");
    }
}
