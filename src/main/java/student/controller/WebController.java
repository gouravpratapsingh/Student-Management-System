package student.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import student.model.Student;
import student.service.StudentService;

import java.util.List;

@Controller
public class WebController {
    private final StudentService service;

    @Autowired
    public WebController(StudentService service){
        this.service=service;
    }

    @GetMapping("/add")
    public String addStudent(){
        return "add-Student";
    }

    @PostMapping("/save-Student")
    public String saveStudent(Student student){
        service.setStudent(student);
        return "added-successfully";
    }

    @GetMapping
    public String home(){
        return "home";
    }

    @PostMapping("/show")
    public String show(@RequestParam("sid") int sid, Model model){
        Student student = service.getStudent(sid);
        if (student!=null) {
            model.addAttribute("student",student);
        }
        else{
            String str = "No student found with Id : "+sid;
            model.addAttribute("notfound",str);
        }
        return "findStudent";
    }

    @GetMapping("/find")
    public String find(){
        return "findStudent";
    }

    @GetMapping("update")
    public String update(){
        return "findtoupdate";
    }

    @PostMapping("/showToUpdate")
    public String showforupdate(@RequestParam("sid") int sid, Model model){
        Student student = service.getStudent(sid);
        if (student!=null) {
            model.addAttribute("student",student);
        }
        else{
            String str = "No student found with Id : "+sid;
            model.addAttribute("notfound",str);
        }
        return "findtoupdate";
    }

    @PostMapping("confirmupdate")
    public String confirmupdate(Student student,Model model){
        model.addAttribute("student",student);
        return "confirmupdate";
    }

    @PostMapping("updated")
    public String updateSuccessfully(Student student){
        service.updateStudent(student);
        return "updated";
    }

    @PostMapping("delete")
    public String deleteStudent(@RequestParam("sid") int sid,Model model){
        model.addAttribute("student",service.getStudent(sid));
        return "confirmdelete";
    }

    @PostMapping("deleted")
    public String deletedSuccessfully(@RequestParam("sid") int sid){
        service.deleteStudent(sid);
        return "deleted-successfully";
    }

    @GetMapping("/list")
    public ModelAndView showlist(){
        List<Student> list = service.getstudentlist();
        ModelAndView model=new ModelAndView("showlist");
        model.addObject("list",list);
        return model;
    }
}
