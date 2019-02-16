package DAO;

import entity.Employeer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmployeerDAO extends GenericDAO {
    public EmployeerDAO() {
    }

    public boolean insertData(Employeer employeerObj) throws SQLException {
        String sql = "SELECT * FROM users WHERE userName=?;";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, employeerObj.getEmail());
        ResultSet rs = preStmt.executeQuery();
        if (rs.next()) {
            if (rs.getString("userName").equals(employeerObj.getEmail()))
                return false;
        }
        sql = "INSERT INTO employeer (email,firstName,lastName,password,contact,city,companyName,cnic) " +
                "VALUES (?,?,?,?,?,?,?,?)";
        preStmt = con.prepareStatement(sql);
        preStmt.setString(1, employeerObj.getEmail());
        preStmt.setString(2, employeerObj.getFirstName());
        preStmt.setString(3, employeerObj.getLastName());
        preStmt.setString(4, employeerObj.getPassword());
        preStmt.setString(5, employeerObj.getContact());
        preStmt.setString(6, employeerObj.getCity());
        preStmt.setString(7, employeerObj.getCompanyName());
        preStmt.setString(8, employeerObj.getCnic());
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        sql = "INSERT INTO users (userName, password, role,answer) VALUES (?,?,?,?)";
        preStmt = con.prepareStatement(sql);
        preStmt.setString(1, employeerObj.getEmail());
        preStmt.setString(2, employeerObj.getPassword());
        preStmt.setString(3, "employeer");
        preStmt.setString(4, employeerObj.getAnswer());
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        preStmt.close();
        return true;
    }

    public String getCompanyName(String email) throws SQLException {
        String sql = "SELECT companyName FROM employeer WHERE email=?;";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, email);
        ResultSet rs = preStmt.executeQuery();
        if (rs.next()) {
            return rs.getString("companyName");
        }
        return null;
    }

    public String getEmail(String companyName) throws SQLException {
        String sql = "SELECT email FROM employeer WHERE companyName=?;";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, companyName);
        ResultSet rs = preStmt.executeQuery();
        if (rs.next()) {
            return rs.getString("email");
        }
        return null;
    }

    public Employeer getInfo(String email) throws SQLException {
        String sql = "SELECT * FROM employeer WHERE email=?;";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, email);
        ResultSet rs = preStmt.executeQuery();
        Employeer empObj = new Employeer();
        if (rs.next()) {
            System.out.println(rs.getString(1));
            empObj.setEmail(rs.getString(1));
            empObj.setFirstName(rs.getString(2));
            empObj.setLastName(rs.getString(3));
            empObj.setPassword(rs.getString(4));
            empObj.setContact(rs.getString(5));
            empObj.setCity(rs.getString(6));
            empObj.setCompanyName(rs.getString(7));
            empObj.setCnic(rs.getString(8));
        }
        sql="SELECT answer from users where userName=?";
        preStmt = con.prepareStatement(sql);
        preStmt.setString(1, email);
        rs = preStmt.executeQuery();
        if(rs.next())
        {
            empObj.setAnswer(rs.getString("answer"));
        }
        preStmt.close();
        System.out.println("return");
        return empObj;
    }

    public void updateAccount(Employeer employeerObj) throws SQLException {
        String sql = "UPDATE employeer SET firstName=?,lastName=?,password=?,contact=?,city=?," +
                "companyName=? WHERE email=?";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, employeerObj.getFirstName());
        preStmt.setString(2, employeerObj.getLastName());
        preStmt.setString(3, employeerObj.getPassword());
        preStmt.setString(4, employeerObj.getContact());
        preStmt.setString(5, employeerObj.getCity());
        preStmt.setString(6, employeerObj.getCompanyName());
        preStmt.setString(7, employeerObj.getEmail());
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        sql = "UPDATE users SET password=?,answer=? WHERE userName=?";
        preStmt = con.prepareStatement(sql);
        preStmt.setString(1, employeerObj.getPassword());
        preStmt.setString(2, employeerObj.getAnswer());
        preStmt.setString(3, employeerObj.getEmail());
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        preStmt.close();
    }

    public ArrayList<Employeer> fetchEmployeer() throws SQLException {
        String sql = "Select * from employeer";
        PreparedStatement preStmt=con.prepareStatement(sql);
        ResultSet rs = preStmt.executeQuery();
        ArrayList<Employeer> empArr = new ArrayList<Employeer>();
        Employeer empObj = new Employeer();
        int i = 0;
        while (rs.next()) {
            empObj.setEmail(rs.getString(1));
            empObj.setFirstName(rs.getString(2));
            empObj.setLastName(rs.getString(3));
            empObj.setPassword(rs.getString(4));
            empObj.setContact(rs.getString(5));
            empObj.setCity(rs.getString(6));
            empObj.setCompanyName(rs.getString(7));
            empObj.setCnic(rs.getString(8));
            empArr.add(i, empObj);
            empObj = null;
            empObj = new Employeer();
            System.out.println(i);
            i++;
        }
        preStmt.close();
        return empArr;
    }

    public void DeleteEmployeer(String email) throws SQLException {
        String sql = "DELETE FROM employeer WHERE email=?";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, email);
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        preStmt.close();
    }
}
