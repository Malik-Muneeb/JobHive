package entity;

public class Job {
    int id;
    private String title;
    private String description;
    private String skills;
    private String careerLevel;
    private String seats;
    private String location;
    private String qualification;
    private String minExperience;
    private String maxExperience;
    private String minSalary;
    private String maxSalary;
    private String salVisibility;
    private String genderPrefer;
    private String email;
    private String Date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Job() {
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getCareerLevel() {
        return careerLevel;
    }

    public void setCareerLevel(String careerLevel) {
        this.careerLevel = careerLevel;
    }

    public String getSeats() {
        return seats;
    }

    public void setSeats(String seats) {
        this.seats = seats;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getMinExperience() {
        return minExperience;
    }

    public void setMinExperience(String minExperience) {
        this.minExperience = minExperience;
    }

    public String getMaxExperience() {
        return maxExperience;
    }

    public void setMaxExperience(String maxExperience) {
        this.maxExperience = maxExperience;
    }

    public String getMinSalary() {
        return minSalary;
    }

    public void setMinSalary(String minSalary) {
        this.minSalary = minSalary;
    }

    public String getMaxSalary() {
        return maxSalary;
    }

    public void setMaxSalary(String maxSalary) {
        this.maxSalary = maxSalary;
    }

    public String getSalVisibility() {
        return salVisibility;
    }

    public void setSalVisibility(String salVisibility) {
        this.salVisibility = salVisibility;
    }

    public String getGenderPrefer() {
        return genderPrefer;
    }

    public void setGenderPrefer(String genderPrefer) {
        this.genderPrefer = genderPrefer;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
