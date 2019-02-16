package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Job;

public class JobDAO extends GenericDAO {
    public JobDAO() {

    }

    public void insertJob(Job jobObj) throws SQLException {
        String sql = "INSERT INTO job (title, description, skills, careerLevel, seats, location, qualification, " +
                "minExperience, maxExperience, minSalary, maxSalary, salVisibility, genderPrefer,email,date)" +
                " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate()) ";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, jobObj.getTitle());
        preStmt.setString(2, jobObj.getDescription());
        preStmt.setString(3, jobObj.getSkills());
        preStmt.setString(4, jobObj.getCareerLevel());
        preStmt.setString(5, jobObj.getSeats());
        preStmt.setString(6, jobObj.getLocation());
        preStmt.setString(7, jobObj.getQualification());
        preStmt.setString(8, jobObj.getMinExperience());
        preStmt.setString(9, jobObj.getMaxExperience());
        preStmt.setString(10, jobObj.getMinSalary());
        preStmt.setString(11, jobObj.getMaxSalary());
        preStmt.setString(12, jobObj.getSalVisibility());
        preStmt.setString(13, jobObj.getGenderPrefer());
        preStmt.setString(14, jobObj.getEmail());
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        preStmt.close();
    }

    public ArrayList<Job> searchJob(String title, String city, String minSal) throws SQLException {
        String sql = "";
        PreparedStatement preStmt;
        if (city.equals("City") && minSal.equals("Minimum Salary")) {
            sql = "SELECT * FROM job WHERE job.title LIKE ? OR job.skills LIKE ?" +
                    " OR email IN (SELECT email FROM employeer WHERE companyName LIKE ?);";
            preStmt = con.prepareStatement(sql);
            preStmt.setString(1, "%" + title + "%");
            preStmt.setString(2, "%" + title + "%");
            preStmt.setString(3, "%" + title + "%");

        } else if (minSal.equals("Minimum Salary")) {
            sql = "SELECT * FROM job WHERE (job.title LIKE ? OR job.skills LIKE ?" +
                    " OR email IN (SELECT email FROM employeer WHERE companyName LIKE ?)) AND location=?;";
            preStmt = con.prepareStatement(sql);
            preStmt.setString(1, "%" + title + "%");
            preStmt.setString(2, "%" + title + "%");
            preStmt.setString(3, "%" + title + "%");
            preStmt.setString(4, city);

        } else if (city.equals("City")) {
            sql = "SELECT * FROM job WHERE (job.title LIKE ? OR job.skills LIKE ?" +
                    " OR email IN (SELECT email FROM employeer WHERE companyName LIKE ?)) AND minSalary=?;";
            preStmt = con.prepareStatement(sql);
            preStmt.setString(1, "%" + title + "%");
            preStmt.setString(2, "%" + title + "%");
            preStmt.setString(3, "%" + title + "%");
            preStmt.setString(4, minSal);
        } else {
            sql = "SELECT * FROM job WHERE (job.title LIKE ? OR job.skills LIKE ?" +
                    " OR email IN (SELECT email FROM employeer WHERE companyName LIKE ?))" +
                    " AND location=? AND minSalary=?;";
            preStmt = con.prepareStatement(sql);
            preStmt.setString(1, "%" + title + "%");
            preStmt.setString(2, "%" + title + "%");
            preStmt.setString(3, "%" + title + "%");
            preStmt.setString(4, city);
            preStmt.setString(5, minSal);
        }
        ResultSet rs = preStmt.executeQuery();
        ArrayList<Job> jobArr = new ArrayList<Job>();
        Job jobObj = new Job();
        int i = 0;
        while (rs.next()) {
            System.out.println(rs.getString(1));
            jobObj.setId(rs.getInt(1));
            System.out.println(rs.getString(7));
            jobObj.setTitle(rs.getString(2));
            jobObj.setDescription((rs.getString(3)));
            jobObj.setSkills(rs.getString(4));
            jobObj.setCareerLevel(rs.getString(5));
            jobObj.setSeats(rs.getString(6));
            jobObj.setLocation(rs.getString(7));
            jobObj.setQualification(rs.getString(8));
            jobObj.setMinExperience(rs.getString(9));
            jobObj.setMaxExperience(rs.getString(10));
            jobObj.setMinSalary(rs.getString(11));
            jobObj.setMaxSalary(rs.getString(12));
            jobObj.setSalVisibility(rs.getString(13));
            jobObj.setGenderPrefer(rs.getString(14));
            jobObj.setEmail(rs.getString(15));
            jobObj.setDate(rs.getString(16));
            jobArr.add(i, jobObj);
            jobObj = null;
            jobObj = new Job();
            System.out.println(i);
            i++;
        }
        preStmt.close();
        System.out.println("return");
        return jobArr;
    }

    public ArrayList<Job> fetchJob(String email) throws SQLException {
        String sql = "Select * from job where email=?";
        PreparedStatement preStmt=con.prepareStatement(sql);
        preStmt.setString(1,email);
        ResultSet rs = preStmt.executeQuery();
        ArrayList<Job> jobArr = new ArrayList<Job>();
        Job jobObj = new Job();
        int i = 0;
        while (rs.next()) {
            jobObj.setId(rs.getInt(1));
            jobObj.setTitle(rs.getString(2));
            jobObj.setDescription((rs.getString(3)));
            jobObj.setSkills(rs.getString(4));
            jobObj.setCareerLevel(rs.getString(5));
            jobObj.setSeats(rs.getString(6));
            jobObj.setLocation(rs.getString(7));
            jobObj.setQualification(rs.getString(8));
            jobObj.setMinExperience(rs.getString(9));
            jobObj.setMaxExperience(rs.getString(10));
            jobObj.setMinSalary(rs.getString(11));
            jobObj.setMaxSalary(rs.getString(12));
            jobObj.setSalVisibility(rs.getString(13));
            jobObj.setGenderPrefer(rs.getString(14));
            jobObj.setEmail(rs.getString(15));
            jobObj.setDate(rs.getString(16));
            jobArr.add(i, jobObj);
            jobObj = null;
            jobObj = new Job();
            System.out.println(i);
            i++;
        }
        preStmt.close();
        return jobArr;
    }

    public void updateJob(Job jobObj) throws SQLException {
        String sql = "UPDATE job SET title=?,description=?,skills=?,careerLevel=?,seats=?,location=?" +
                ",qualification=?,minExperience=?,maxExperience=?,minSalary=?,maxSalary=?,salVisibility=?" +
                ",genderPrefer=?,date=SYSDATE() where id=? ";
        System.out.println(jobObj.getId());
        System.out.println(jobObj.getTitle());
        System.out.println(jobObj.getLocation());
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setString(1, jobObj.getTitle());
        preStmt.setString(2, jobObj.getDescription());
        preStmt.setString(3, jobObj.getSkills());
        preStmt.setString(4, jobObj.getCareerLevel());
        preStmt.setString(5, jobObj.getSeats());
        preStmt.setString(6, jobObj.getLocation());
        preStmt.setString(7, jobObj.getQualification());
        preStmt.setString(8, jobObj.getMinExperience());
        preStmt.setString(9, jobObj.getMaxExperience());
        preStmt.setString(10, jobObj.getMinSalary());
        preStmt.setString(11, jobObj.getMaxSalary());
        preStmt.setString(12, jobObj.getSalVisibility());
        preStmt.setString(13, jobObj.getGenderPrefer());
        preStmt.setInt(14,jobObj.getId());
        System.out.println(jobObj.getTitle());
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        System.out.println("c");
        preStmt.close();
    }

    public void DeleteJob(int id) throws SQLException {
        String sql = "DELETE FROM job WHERE id=?";
        PreparedStatement preStmt = con.prepareStatement(sql);
        preStmt.setInt(1, id);
        System.out.println(preStmt.executeUpdate() + " row(s) update.");
        preStmt.close();
    }
}
