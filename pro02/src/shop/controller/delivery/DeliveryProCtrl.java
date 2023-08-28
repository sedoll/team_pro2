package shop.controller.delivery;

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
@WebServlet("/DeliveryPro.do")
public class DeliveryProCtrl extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "배송 시작 하기";

        List<Delivery> deliveryList = new ArrayList<>();
        DeliveryDAO dao = new DeliveryDAO();
        String pcode = request.getParameter("pstate");
        System.out.println(pcode);
        int dno = Integer.parseInt(request.getParameter("dno"));

        request.setAttribute("deliveryList", deliveryList);
        request.setAttribute("msg", msg);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/DeliveryList.jsp");
        view.forward(request, response);
    }
}
