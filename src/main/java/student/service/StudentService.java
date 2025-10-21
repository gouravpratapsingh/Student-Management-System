package student.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import student.model.Student;
import student.repository.StudentRepo;

import java.util.List;

@Service
public class StudentService{

    private final StudentRepo repository;

    @Autowired
    public StudentService(StudentRepo repository){
        this.repository=repository;
        System.out.println("Student service invoked");
    }

    public void setStudent(Student student) {
        repository.save(student);
    }

    public List<Student> getstudentlist() {
        return repository.getlist();
    }

    public Student getStudent(int sid) {
        return repository.getstudent(sid);
    }

    public void updateStudent(Student curstudent) {
        Student oldStudent= repository.getstudent(curstudent.getSid());
        repository.update(curstudent,oldStudent);
    }

    public void deleteStudent(int sid) {
        Student student = repository.getstudent(sid);
        repository.delete(student);
    }
}
