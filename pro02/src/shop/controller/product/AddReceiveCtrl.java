package shop.controller.product;

import shop.dto.Product;
import shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AddReceive.do")
public class AddReceiveCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "관리자의 상품 입고 폼이 로딩되었습니다.";

        request.setAttribute("msg", msg);

        ProductDAO dao = new ProductDAO();
        List<Product> proList = dao.getProductList();

        request.setAttribute("proList", proList);
        RequestDispatcher view = request.getRequestDispatcher("/product/addReceive.jsp");
        view.forward(request, response);
    }
}