package DAO;

import com.sun.deploy.net.HttpRequest;
import entity.Employee;
import entity.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO extends GenericDAO {
    public UserDAO() {
    }

    public String validateLogin(User userObj) throws SQLException {
        String sql = "SELECT * FROM users WHERE userName=? AND password=?;";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, userObj.getUserName());
        preStmt.setString(2, userObj.getPassword());
        ResultSet rs = preStmt.executeQuery();
        if (rs.next()) {
            if (rs.getString("userName").equals(userObj.getUserName()))
                return rs.getString(3);
        }
        return "empty";
    }

    public boolean checkAnswer(String userName,String ans) throws SQLException {
        String sql = "SELECT answer FROM users WHERE userName=?;";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, userName);
        ResultSet rs = preStmt.executeQuery();
        if (rs.next()) {
            if (rs.getString("answer").equals(ans))
            {
                System.out.println(1);
                return true;
            }

        }
        return false;
    }

    public void updatePassword(String userName,String pass) throws SQLException
    {
        String sql = "UPDATE users SET password=? where userName=?";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, pass);
        preStmt.setString(2, userName);
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        System.out.println(2);
        return;
    }

    public String getAdminPass()throws SQLException
    {
        String sql = "SELECT * from users WHERE userName=?";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, "admin");
        ResultSet rs=preStmt.executeQuery();
        rs.next();
        String pass=rs.getString("password");
        return pass;
    }

    public void updateAdminPass(String pass)throws SQLException
    {
        String sql = "UPDATE users SET password=? where userName=?";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, pass);
        preStmt.setString(2, "admin");
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        return;
    }
}
