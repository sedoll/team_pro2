package shop.controller.admin;

import shop.dto.Delivery;
import shop.model.DeliveryDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

// 배송 시작
@WebServlet("/AdminDeliveryList.do")
public class DeliveryListCtrl extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "배송 시작 하기";

        List<Delivery> deliveryList = new ArrayList<>();
        DeliveryDAO dao = new DeliveryDAO();
        int pstate = 0;
        deliveryList = dao.getDeliveryList(pstate);

        request.setAttribute("deliveryList", deliveryList);
        request.setAttribute("msg", msg);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/DeliveryList.jsp");
        view.forward(request, response);
    }
}
