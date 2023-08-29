package shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LikeDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    //좋아요 유무 확인 메서드
    public boolean checkLiked ( String userId, String productId)  {
        DBConnect con = new MariaDBCon();
        conn = con.connect();

        String sql = "SELECT * FROM likes WHERE userid = ? AND productid = ?";
       try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userId);
            pstmt.setString(2,productId);
            rs = pstmt.executeQuery();
            return rs.next();
       } catch (SQLException e) {
           throw new RuntimeException(e);
       } finally {
           con.close(rs,pstmt, conn);
       }
    }

    //좋아요 추가
    public void addLike(String userId, String productId) {
        DBConnect con = new MariaDBCon();
        conn = con.connect();

        String sql = "INSERT INTO likes(userid, productid) VALUES(?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, productId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
    }

    //좋아요 취소
    public void removeLike(String userId, String productId) {
        DBConnect con = new MariaDBCon();
        conn = con.connect();

        String sql = "DELETE FROM likes WHERE userid = ? AND productid = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, productId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
    }

    //좋아요 누른 상품의 id목록을 반환
    public List<Integer> getLikedProductsByUser(String sid) {
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        //값 저장할 리스트 생성
        List<Integer> likedProductIds = new ArrayList<>();

        // 사용자 아이디에 해당하는 좋아요 누른 상품의 ID(product테이블의 no)를 선택
        String sql = "SELECT productid FROM likes WHERE userid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                //현재 행의 productid 값을 가져와 likedProductIds 리스트에 추가
                likedProductIds.add(rs.getInt("productid"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return likedProductIds;
    }

}
