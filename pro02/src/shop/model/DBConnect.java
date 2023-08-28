package shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface DBConnect {
    // region notice
    final static String NOTICE_SELECT_ALL = "select * from notice";
    final static String NOTICE_SELECT_ONE = "select * from notice where no=?";
    final static String NOTICE_INSERT = "insert into notice values (default,?,?,default,default)";
    final static String NOTICE_UPDATE = "update notice set title=?, content=? where no=?";
    final static String NOTICE_UPDATE_CNT = "update notice set visited=visited+1 where no=?";
    final static String NOTICE_DELETE = "delete from notice where no=?";
    // endregion

    // region customer
    final static String CUSTOM_SELECT_ALL = "select * from custom order by regdate desc";
    final static String CUSTOM_SELECT_ONE = "select * from custom where id=?";
    final static String CUSTOM_INSERT = "insert into custom values(?, ?, ?, default, default, ?, ?, ?, default, ?)";
    final static String CUSTOM_UPDATE = "update custom set title=?, content=? where id=?";
    final static String CUSTOM_DELETE = "delete from custom where id=?";
    final static String CUSTOM_SELECT_LOG = "select * from custom where id=?";
    // endregion
    
    // region file
    final static String FILE_SELECT_ALL = "select * from file";
    final static String FILE_INSERT = "insert into file values (?,?,?,?)";
    final static String FILE_DELETE = "DELETE FROM file where fname = ?";
    // endregion

    // region shop

    // product
    final static String PRODUCT_UPDATE_prono = "UPDATE product SET cateno = CONCAT(cate, NO) WHERE NO=?";
    final static String PRODUCT_UPDATE = ""; // 상품정보수정
    final static String PRODUCT_SELECT_ALL = "SELECT * FROM product ORDER BY NO"; // 상품 조회
    final static String PRODUCT_SELECT_CATE = "SELECT * FROM product where cate=? ORDER BY NO";
    final static String PRODUCT_SELECT_ONE = "SELECT * FROM product where no=?"; // 상품 상세 조회
    final static String PRODUCT_SELECT_RECENT = "SELECT * FROM product ORDER BY NO DESC LIMIT 5"; // 최근 상품 조회
    final static String PRODUCT_SELECT_BEST = "SELECT * from product where pno IN (SELECT pno FROM payment GROUP BY pno ORDER BY SUM(amount) DESC LIMIT 5)"; // 제일 잘나가는 상품 조회
    final static String PRODUCT_DELETE = "delete from product where no=?";
    final static String PRODUCT_INSERT = "INSERT INTO product VALUES(DEFAULT, ?, '', ?, ?, ?, ?, ?, ?, '', DEFAULT)";

    final static String PRODUCT_INSERT_UPDATE = "update product set cateno = concat(cate, no) where no in (select no from product order by resdate desc limit 1)";

    final static String PRODUCT_SELECT_CATE_SCHOOL = "SELECT p.*, c.cname FROM product p JOIN category c ON p.cate = c.cno  WHERE cate IN (?,?,?,?) ORDER BY no";
    final static String PRODUCT_INSERT_CATENO = "update product set cateno = concat(cate, no) where no in (select no from product order by resdate desc)";


    // qna
    final static String QNA_SELECT_ALL = "select * from qna where lev=0 order by resdate desc";
    final static String QNA_SELECT_BOARD = "select * from qna where par=? and lev=0";
    final static String QNA_SELECT_COMMENTS = "select * from qna where par=? and lev=1 order by resdate desc";
    final static String QNA_SELECT_COMMENT = "select * from qna where qno=? and lev=1";
    final static String QNA_INSERT_BOARD = "INSERT INTO qna(title, content, cid, par) VALUES(?, ?, ?, ?)";
    final static String QNA_INSERT_COMMENT = "INSERT INTO qna(title, content, cid, lev, par) VALUES(?, ?, ?, ?, ?)";
    final static String QNA_UPDATE_PAR = "update qna set par=qno where par=0 and lev=0";
    final static String QNA_UPDATE_CNT = "update qna set cnt=cnt+1 where qno=?";
    final static String QNA_UPDATE = "update qna set title=?, content=? where qno=?";
    final static String QNA_DELETE = "delete from qna where qno=?";

    //review
    final static String REVIEW_SELECT = "select * from review where par=?";
    final static String REVIEW_INSERT = "insert into review values(default, ?, ?, default, ?)";
    
    
    //입고처리패턴
    final static String PRODUCT_RECEIVE = "insert into receive values (default, ?, ?, ?, default)";
    final static String CATEGORY_LOAD = "SELECT * FROM CATEGORY";


    //출고 처리 패턴
    final static String SERVE_PAYMENT = "insert into payment values (default, ?, ?, ?, ?, ?, ?, ?, '')";
    final static String SERVE_INSERT = "insert into serve values(default, ?, ?, ?, default)";
    final static String DELIVERY_INSERT = "insert into delivery values (default, ?, ?, ?, ?, '','',default,default,'','')";
    final static String CART_DELETE = "delete from cart where cartno=?";
    final static String GET_SNO = "select sno from payment order by sno desc limit 1";

    //반품 처리 패턴
    final static String RETURN_PAYMENT = "delete from payment where sno=?";
    final static String RETURN_RECEIVE = "insert into receive values (default, ?, ?, ?, default)";
    final static String RETURN_SERVE = "delete from serve where sno=?";
    final static String RETURN_CART = "insert into cart values (default, ?, ?, ?)";
    final static String RETURN_DELEVERY = "delete from delivery where sno=?";

    //배송 등록 처리
    final static String DELIVERY_PRO = "update delivery set pcom=?, ptel=?, pstate=1, sdate=current_timestamp, rdate=?, bcode=? where dno=?";

    //배송 완료 처리
    final static String DELIVERY_COMPLETE = "update delivery set pstate=2 where dno=?";

    final static String DELIVERY_SELECT_ONE = "select * from delivery where dno=?";
    final static String DELIVERY_SELECT_SNO = "select * from delivery where sno=?";

    //재고 조회
    final static String INVENTORY_SELECT_ALL = "select * from inventory order by pno desc";
    final static String INVENTORY_SELECT_ONE = "select * from inventory where pno=?";

    //입고 처리
    final static String RECEIVE_INSERT = "insert into receive values (default, ?, ?, ?, default)";

    //장바구니 기능
    final static String CART_INSERT = "insert into cart values (default,?,?,?)";
    final static String CART_SELECT_CID = "select * from cart where cid=?";

    //결제 정보
    final static String PAYMENT_SELECT_LIST ="select * from payment order by sno desc";
    final static String PAYMENT_SELECT_ONE ="select * from payment where sno=?";
    final static String PAYMENT_SELECT_CID ="select * from payment where cid=?";
    final static String PAYMENT_SELECT_CID_PNO ="select * from payment where cid=? and pno=?";

    // 판매 수익 정보
    final static String SALES_SELECT_ALL = "select * from sales";

    public Connection connect();
    public void close(PreparedStatement pstmt, Connection conn);
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn);
}
