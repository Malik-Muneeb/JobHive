package DAO;

import entity.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmployeeDAO extends GenericDAO {

    public EmployeeDAO() {
    }

    public boolean insertData(Employee employeeObj) throws SQLException {
        String sql = "SELECT * FROM users WHERE userName=?;";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, employeeObj.getFirstName());
        ResultSet rs = preStmt.executeQuery();
        if (rs.next()) {
            if (rs.getString("userName").equals(employeeObj.getFirstName()))
                return false;
        }
        sql = "INSERT INTO employee (email,firstName,lastName,password,dob,contact,nationality,gender) " +
                "VALUES (?,?,?,?,?,?,?,?)";
        preStmt = con.prepareStatement(sql);
        preStmt.setString(1, employeeObj.getEmail());
        preStmt.setString(2, employeeObj.getFirstName());
        preStmt.setString(3, employeeObj.getLastName());
        preStmt.setString(4, employeeObj.getPassword());
        preStmt.setString(5, employeeObj.getDob());
        preStmt.setString(6, employeeObj.getContact());
        preStmt.setString(7, employeeObj.getNationality());
        preStmt.setString(8, employeeObj.getGender());
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        sql = "INSERT INTO users (userName, password, role,answer) VALUES (?,?,?,?)";
        preStmt = con.prepareStatement(sql);
        preStmt.setString(1, employeeObj.getFirstName());
        preStmt.setString(2, employeeObj.getPassword());
        preStmt.setString(3, "employee");
        preStmt.setString(4, employeeObj.getAnswer());
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        preStmt.close();
        return true;
    }

    public Employee getInfo(String userId) throws SQLException {
        String sql = "SELECT * FROM employee WHERE firstName=?;";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, userId);
        ResultSet rs = preStmt.executeQuery();
        Employee empObj = new Employee();
        if (rs.next()) {
            System.out.println(rs.getString(1));
            empObj.setEmail(rs.getString(1));
            empObj.setFirstName(rs.getString(2));
            empObj.setLastName(rs.getString(3));
            empObj.setPassword(rs.getString(4));
            empObj.setDob(rs.getString(5));
            empObj.setContact(rs.getString(6));
            empObj.setNationality(rs.getString(7));
            empObj.setGender(rs.getString(8));
        }
        sql = "SELECT answer FROM users WHERE userName=?";
        preStmt = con.prepareStatement(sql);
        preStmt.setString(1, userId);
        rs = preStmt.executeQuery();
        if (rs.next()) {
            empObj.setAnswer(rs.getString("answer"));
        }
        preStmt.close();
        System.out.println("return");
        return empObj;
    }

    public void updateAccount(Employee employeeObj) throws SQLException {
        String sql = "UPDATE employee SET lastName=?,password=?,contact=?,nationality=? WHERE firstName=?";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, employeeObj.getLastName());
        preStmt.setString(2, employeeObj.getPassword());
        preStmt.setString(3, employeeObj.getContact());
        preStmt.setString(4, employeeObj.getNationality());
        preStmt.setString(5, employeeObj.getFirstName());
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        sql = "UPDATE users SET password=?,answer=? WHERE userName=?";
        preStmt = con.prepareStatement(sql);
        preStmt.setString(1, employeeObj.getPassword());
        preStmt.setString(2, employeeObj.getAnswer());
        preStmt.setString(3, employeeObj.getFirstName());
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        preStmt.close();
    }

    public ArrayList<Employee> fetchEmployee() throws SQLException {
        String sql = "Select * from employee";
        PreparedStatement preStmt=con.prepareStatement(sql);
        ResultSet rs = preStmt.executeQuery();
        ArrayList<Employee> empArr = new ArrayList<Employee>();
        Employee empObj = new Employee();
        int i = 0;
        while (rs.next()) {
            empObj.setEmail(rs.getString(1));
            empObj.setFirstName(rs.getString(2));
            empObj.setLastName(rs.getString(3));
            empObj.setPassword(rs.getString(4));
            empObj.setDob(rs.getString(5));
            empObj.setContact(rs.getString(6));
            empObj.setNationality(rs.getString(7));
            empObj.setGender(rs.getString(8));
            empArr.add(i, empObj);
            empObj = null;
            empObj = new Employee();
            System.out.println(i);
            i++;
        }
        preStmt.close();
        return empArr;
    }

    public void DeleteEmployee(String name) throws SQLException {
        String sql = "DELETE FROM employee WHERE firstName=?";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, name);
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        preStmt.close();
    }
}