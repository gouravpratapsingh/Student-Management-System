package student.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import student.model.Student;

import java.util.List;

@Repository
public class StudentRepo{

    private final Session session;
    private final Transaction transaction;

    @Autowired
    public StudentRepo(SessionFactory factory){
        session= factory.openSession();
        transaction = session.getTransaction();
        System.out.println("Student repo invoked");
    }

    public void save(Student student) {
        transaction.begin();
        session.persist(student);
        transaction.commit();
    }

    public List<Student> getlist() {
        Query<Student> query = session.createQuery("from Student",Student.class);
        List<Student> studentList = query.list();
        return studentList;
    }

    public Student getstudent(int sid) {
        return session.get(Student.class,sid);
    }

    public void update(Student curstudent, Student oldStudent) {
        transaction.begin();
        oldStudent.setName(curstudent.getName());
        oldStudent.setCourse(curstudent.getCourse());
        oldStudent.setCity(curstudent.getCity());
        transaction.commit();
    }

    public void delete(Student student) {
        transaction.begin();
        session.delete(student);
        transaction.commit();
    }
}
