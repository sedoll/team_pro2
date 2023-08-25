package shop.controller.product;

import shop.dto.Product;
import shop.dto.Review;
import shop.model.ProductDAO;
import shop.model.ReviewDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ProList.do")
public class ProListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        List<Product> proList = new ArrayList<>();

        String cate = request.getParameter("cate");
        System.out.println(cate);
        if(cate == null) {
            proList = dao.getProductList();
            System.out.println(proList.toString());
            request.setAttribute("proList",proList);
        } else if(cate.equals("초등")) {
            proList = dao.getCateProductList("초등");
            System.out.println(proList.toString());
            request.setAttribute("proList",proList);
        } else if(cate.equals("중등")) {
            proList = dao.getCateProductList("중등");
            System.out.println(proList.toString());
            request.setAttribute("proList",proList);
        } else if(cate.equals("고등")) {
            proList = dao.getCateProductList("고등");
            System.out.println(proList.toString());
            request.setAttribute("proList",proList);
        }

        System.out.println("상품목록 조회" + cate);
        RequestDispatcher view = request.getRequestDispatcher("/product/proList.jsp");
        view.forward(request, response);
    }
}
