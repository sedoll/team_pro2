package shop.controller.custom;

import shop.dto.Custom;
import shop.model.CustomDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/MypageIndex.do")
public class MypageIndexCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        RequestDispatcher view = request.getRequestDispatcher("/custom/mypageIndex.jsp");
        view.forward(request, response);
    }
}
