<%--
  Created by IntelliJ IDEA.
  User: Muneeb
  Date: 05-Feb-18
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="entity.*, DAO.*" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <link rel="icon" href="images/logo.png">
    <title>Title</title>
</head>
<body>

<%
    String action = request.getParameter("action");
    if (action.equals("postJob")) {
        Job jobObj = new Job();
        jobObj.setTitle(request.getParameter("jobTitle"));
        jobObj.setDescription(request.getParameter("description"));
        jobObj.setSkills(request.getParameter("skills"));
        jobObj.setCareerLevel(request.getParameter("careerLevel"));
        jobObj.setSeats(request.getParameter("seats"));
        jobObj.setLocation(request.getParameter("job-loc"));
        jobObj.setQualification(request.getParameter("qualification"));
        jobObj.setMinExperience(request.getParameter("min-exp"));
        jobObj.setMaxExperience(request.getParameter("max-exp"));
        jobObj.setMinSalary(request.getParameter("min-salary"));
        jobObj.setMaxSalary(request.getParameter("max-salary"));
        jobObj.setSalVisibility(request.getParameter("optradio"));
        jobObj.setGenderPrefer(request.getParameter("genderPrefer"));
        if (session.getAttribute("userName") == null) {
            session.setAttribute("job", jobObj);
            response.sendRedirect("signup-company.jsp");
        } else {
            String companyName = (String) session.getAttribute("userName");
            jobObj.setEmail(new EmployeerDAO().getEmail(companyName));
            JobDAO jobDao = new JobDAO();
            jobDao.insertJob(jobObj);
            response.sendRedirect("employer-dashboard.jsp");
        }
    } else if (action.equals("searchJob")) {
        String title = request.getParameter("jobTitle");
        String city = request.getParameter("search-city");
        String minSalary = request.getParameter("search-min-salary");
        session.setAttribute("title", title);
        session.setAttribute("city", city);
        session.setAttribute("minSal", minSalary);
        JobDAO jobDao = new JobDAO();
        ArrayList<Job> jobArr = new ArrayList<Job>();
        System.out.println("else");
        try {
            jobArr = jobDao.searchJob(title, city, minSalary);
            System.out.println("try");
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("catch");
        }
        session.setAttribute("jobArr", jobArr);
        response.sendRedirect("job-search-results.jsp");
    } else if (action.equals("forgot")) {
        String userName = request.getParameter("email");
        String ans = request.getParameter("sec-ans");
        String pass = request.getParameter("new-pass");
        String newPass = request.getParameter("con-new-pass");
        UserDAO userDao = new UserDAO();
        try {
            if (userDao.checkAnswer(userName, ans)) {
                if (pass.equals(newPass)) {
                    userDao.updatePassword(userName, pass);
                    response.sendRedirect("home.jsp");
                } else {
%>
<script>
    alert("Passwords do not match!!!");</script>
<meta http-equiv="Refresh" content="0;url=forgot-password.jsp">
<%
    }
} else {
%>
<script>
    alert("User Name or Answer does not match!!!");</script>
<meta http-equiv="Refresh" content="0;url=forgot-password.jsp">
<%

        }

    } catch (Exception e) {
        System.out.println(e);
    }
} else if (action.equals("viewJob")) {
    //int jobId=Integer.parseInt(request.getParameter("jobId"));
    //session.setAttribute("jobId",jobId);
    String id = request.getParameter("id");
    response.sendRedirect("open-job.jsp?id=" + id);
    // request.getRequestDispatcher("open-job.jsp").include(request,response);
    System.out.println(15645);

} else if (action.equals("logout")) {
    session.invalidate();
    response.sendRedirect("home.jsp");
} else if (action.equals("postedJobs")) {
    JobDAO jobDao = new JobDAO();
    ArrayList<Job> jobArr = new ArrayList<Job>();
    EmployeerDAO empDao = new EmployeerDAO();
    String email = empDao.getEmail((String) session.getAttribute("userName"));
    jobArr = jobDao.fetchJob(email);
    session.setAttribute("jobArr", jobArr);
    response.sendRedirect("view-jobs.jsp");
} else if (action.equals("editJob")) {
    String id = request.getParameter("id");
    response.sendRedirect("view-update-job.jsp?id=" + id);
} else if (action.equals("updateJob")) {
    Job jobObj = new Job();
    jobObj.setTitle(request.getParameter("jobTitle"));
    jobObj.setDescription(request.getParameter("description"));
    jobObj.setSkills(request.getParameter("skills"));
    jobObj.setCareerLevel(request.getParameter("careerLevel"));
    jobObj.setSeats(request.getParameter("seats"));
    jobObj.setLocation(request.getParameter("job-loc"));
    jobObj.setQualification(request.getParameter("qualification"));
    jobObj.setMinExperience(request.getParameter("min-exp"));
    jobObj.setMaxExperience(request.getParameter("max-exp"));
    jobObj.setMinSalary(request.getParameter("min-salary"));
    out.print(request.getParameter("jobTitle"));
    jobObj.setMaxSalary(request.getParameter("max-salary"));
    jobObj.setSalVisibility(request.getParameter("optradio"));
    jobObj.setGenderPrefer(request.getParameter("genderPrefer"));
    jobObj.setId(Integer.parseInt(request.getParameter("id")));
    JobDAO jobDao = new JobDAO();
    jobDao.updateJob(jobObj);
    response.sendRedirect("employer-dashboard.jsp");
} else if (action.equals("changeAccountComp")) {
    String companyName = (String) session.getAttribute("userName");
    System.out.println(companyName);
    EmployeerDAO empDao = new EmployeerDAO();

    String email = empDao.getEmail(companyName);
    System.out.println(email);
    response.sendRedirect("change-acc-set-employer.jsp?emailId=" + email);
} else if (action.equals("updateAccSetComp")) {
    Employeer emp = new Employeer();
    emp.setEmail(request.getParameter("emailId"));
    emp.setFirstName(request.getParameter("fname"));
    emp.setLastName(request.getParameter("lname"));
    emp.setPassword(request.getParameter("pass"));
    emp.setContact(request.getParameter("phone"));
    emp.setCity(request.getParameter("city"));
    emp.setCompanyName(request.getParameter("cname"));
    emp.setCnic(request.getParameter("cnic"));
    emp.setAnswer(request.getParameter("sec-ques"));
    EmployeerDAO empDao = new EmployeerDAO();
    empDao.updateAccount(emp);
    session.setAttribute("userName", emp.getCompanyName());
    response.sendRedirect("employer-dashboard.jsp");
} else if (action.equals("changeAccountEmp")) {
    String userName = (String) session.getAttribute("userName");
    EmployeeDAO empDao = new EmployeeDAO();
    response.sendRedirect("change-acc-set-employee.jsp?userId=" + userName);
} else if (action.equals("updateAccSetEmp")) {
    System.out.println(1);
    Employee emp = new Employee();
    emp.setEmail(request.getParameter("email"));
    emp.setFirstName((String) session.getAttribute("userName"));
    System.out.println(request.getParameter("userId"));
    emp.setLastName(request.getParameter("lname"));
    emp.setPassword(request.getParameter("pass"));
    emp.setDob(request.getParameter("dob"));
    System.out.println(request.getParameter("dob"));
    emp.setContact(request.getParameter("phone"));
    emp.setNationality(request.getParameter("nationality"));
    emp.setGender(request.getParameter("gender"));
    emp.setAnswer(request.getParameter("sec-ques"));
    EmployeeDAO empDao = new EmployeeDAO();
    empDao.updateAccount(emp);
    response.sendRedirect("employee-dashboard.jsp");
} else if (action.equals("DeleteJob")) {
    String id = request.getParameter("id");
    System.out.println(id);
    new JobDAO().DeleteJob(Integer.parseInt(id));
    response.sendRedirect("employer-dashboard.jsp");
} else if (action.equals("deleteEmployee")) {
    String name = request.getParameter("name");
    System.out.println(name);
    new EmployeeDAO().DeleteEmployee(name);
    response.sendRedirect("admin-dashboard.jsp");
} else if (action.equals("deleteEmployeer")) {
    String name = request.getParameter("name");
    System.out.println(name);
    new EmployeerDAO().DeleteEmployeer(name);
    response.sendRedirect("admin-dashboard.jsp");
} else if (action.equalsIgnoreCase("viewEmployee")) {
    response.sendRedirect("view-employee.jsp?name=" + request.getParameter("name"));
} else if (action.equalsIgnoreCase("viewEmployeer")) {
    response.sendRedirect("view-employeer.jsp?email=" + request.getParameter("name"));
} else if (action.equals("changeAdminPass")) {
    String oldPass = request.getParameter("old-pass");
    String newPass = request.getParameter("new-pass");
    String conNewPass = request.getParameter("con-new-pass");
    String getOldPass = new UserDAO().getAdminPass();
    if (oldPass.equals(getOldPass)) {
        if (newPass.equals(conNewPass)) {
            new UserDAO().updateAdminPass(newPass);
            response.sendRedirect("admin-dashboard.jsp");
        } else {

%>
<script>
    alert("New Passwords do not match!!!");</script>
<meta http-equiv="Refresh" content="0;url=change-pass-admin.jsp">

<%
    }
} else {
%>
<script>
    alert("Old Password does not match!!!");</script>
<meta http-equiv="Refresh" content="0;url=change-pass-admin.jsp">

<%

        }
    }
%>
</body>
</html>
