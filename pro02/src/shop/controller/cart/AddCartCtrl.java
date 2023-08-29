package shop.controller.cart;

import shop.dto.Cart;
import shop.model.CartDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddCart.do")
public class AddCartCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pno = Integer.parseInt(request.getParameter("pno"));
        String cate = request.getParameter("cate");
        HttpSession session = request.getSession();
        String cid = (String) session.getAttribute("sid");

        Cart cart = new Cart();
        cart.setPno(pno);
        cart.setCid(cid);
        cart.setAmount(1);

        PrintWriter out = response.getWriter();

        CartDAO dao = new CartDAO();
        boolean check = dao.getCart(cart);
        int cnt = 0;
        if(check) { // 장바구니에 없는 경우
            cnt = dao.addCart(cart);
            if(cnt>0){
                response.setContentType("text/html; charset=UTF-8");
                out.println("<script>alert('add cart success');</script>");
                out.println("<script> location.href= '/pro02/ProList.do?cate="+cate+"'; </script>");
                out.flush();
            } else {
                response.setContentType("text/html; charset=UTF-8");
                out.println("<script>alert('add cart fail');</script>");
                out.println("<script> location.href= '/pro02/ProList.do?cate="+cate+"'; </script>");
                out.flush();
            }
        } else { // 이미 장바구니에 들어 있는 경우
            response.setContentType("text/html; charset=UTF-8");
            out.println("<script>alert('add cart fail');</script>");
            out.println("<script> location.href= '/pro02/ProList.do?cate="+cate+"'; </script>");
            out.flush();
        }
    }
}
