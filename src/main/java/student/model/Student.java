package student.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Students_Data")
public class Student{
    @Id
    private int sid;
    private String name;
    private String course;
    private String city;

    public Student() {
    }

    public Student(int sid, String name, String course, String city) {
        this.sid = sid;
        this.name = name;
        this.course = course;
        this.city = city;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sid=" + sid +
                ", name='" + name + '\'' +
                ", course='" + course + '\'' +
                ", city='" + city + '\'' +
                '}';
    }
}
