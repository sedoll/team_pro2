package shop.controller.admin;

import shop.dto.Delivery;
import shop.model.DeliveryDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

// 배송 시작
@WebServlet("/AddDeliveryPost.do")
public class AddDeliveryPostCtrl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "배송 시작 하기";

        List<Delivery> deliveryList = new ArrayList<>();
        DeliveryDAO dao = new DeliveryDAO();
        int dno = Integer.parseInt(request.getParameter("dno"));

        int pstate = 0;

        request.setAttribute("deliveryList", deliveryList);
        request.setAttribute("msg", msg);
        RequestDispatcher view = request.getRequestDispatcher("/pro02");
        view.forward(request, response);
    }
}
