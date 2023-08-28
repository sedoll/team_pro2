package shop.model;

import shop.dto.Delivery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    String sql = "";

    //배송 등록(DeliveryDAO.addDelivery(del))
    public int addDelivery(Delivery del){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_INSERT);
            pstmt.setInt(1, del.getSno());
            pstmt.setString(2, del.getCid());
            pstmt.setString(3, del.getDaddr());
            pstmt.setString(4, del.getCustel());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    //결제번호를 통한 배송정보 조회
    public Delivery getBySnoDelivery(int sno){
        Delivery del = new Delivery();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_SELECT_SNO);
            pstmt.setInt(1, sno);
            rs = pstmt.executeQuery();
            if(rs.next()){
                del.setDno(rs.getInt("dno"));
                del.setSno(rs.getInt("sno"));
                del.setCid(rs.getString("cid"));
                del.setDaddr(rs.getString("daddr"));
                del.setCustel(rs.getString("custel"));
                del.setPcom(rs.getString("pcom"));
                del.setPtel(rs.getString("ptel"));
                del.setPstate(rs.getInt("pstate"));
                del.setSdate(rs.getString("sdate"));
                del.setRdate(rs.getString("rdate"));
                del.setBcode(rs.getString("bcode"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return del;
    }

    //배송 정보 조회
    public Delivery getDelivery(int dno){
        Delivery del = new Delivery();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_SELECT_ONE);
            pstmt.setInt(1, dno);
            rs = pstmt.executeQuery();
            if(rs.next()){
                del.setDno(rs.getInt("dno"));
                del.setSno(rs.getInt("sno"));
                del.setCid(rs.getString("cid"));
                del.setDaddr(rs.getString("daddr"));
                del.setCustel(rs.getString("custel"));
                del.setPcom(rs.getString("pcom"));
                del.setPtel(rs.getString("ptel"));
                del.setPstate(rs.getInt("pstate"));
                del.setSdate(rs.getString("sdate"));
                del.setRdate(rs.getString("rdate"));
                del.setBcode(rs.getString("bcode"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return del;
    }

    //배송 완료 처리
    public int deliveryComplete(int dno){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_COMPLETE);
            pstmt.setInt(1, 2);
            pstmt.setInt(2, dno);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public List<Delivery> getDeliveryList(int pstate){
        List<Delivery> deliveryList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_SELECT_ALL);
            pstmt.setInt(1, pstate);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Delivery del = new Delivery();
                del.setDno(rs.getInt("dno"));
                del.setSno(rs.getInt("sno"));
                del.setCid(rs.getString("cid"));
                del.setDaddr(rs.getString("daddr"));
                del.setCustel(rs.getString("custel"));
                del.setPcom(rs.getString("pcom"));
                del.setPtel(rs.getString("ptel"));
                del.setPstate(rs.getInt("pstate"));
                del.setSdate(rs.getString("sdate"));
                del.setRdate(rs.getString("rdate"));
                del.setBcode(rs.getString("bcode"));
                deliveryList.add(del);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return deliveryList;
    }

    //배송 송장 등록 및 배송시작
    public int deliveryPro(Delivery del){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_PRO);
            pstmt.setString(1, del.getPcom());
            pstmt.setString(2, del.getPtel());
            pstmt.setString(3, del.getRdate());
            pstmt.setString(4, del.getBcode());
            pstmt.setInt(5, del.getDno());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }
}
