package shop.controller.product;

import shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ProductDel.do")
public class ProductDelCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int no = Integer.parseInt(request.getParameter("no"));
        System.out.println(no);
        ProductDAO dao = new ProductDAO();
        int cnt = dao.delProduct(no);
        if(cnt > 0) {
            System.out.println("product 삭제 성공, no="+no);
        }
        RequestDispatcher view = request.getRequestDispatcher("/pro02/ProList.do");
        view.forward(request, response);
    }
}
