//package com.example.controller;
//
//import com.example.model.Book;
//import com.example.model.User;
//import com.example.repository.BookRepository;
//import com.example.repository.UserRepository;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//import java.util.stream.Collectors;
//
//@Controller
//@RequestMapping("/admin")
//public class AdminController {
//
//    @Autowired
//    private BookRepository bookRepo;
//
//    @Autowired
//    private UserRepository userRepo;
//
//
//    // Show form to add a new book
//    @GetMapping("/add-book")
//    public String showAddBookForm(Model model) {
//        model.addAttribute("book", new Book());
//        return "addbook"; // JSP form to add book
//    }
//
//    // Handle book submission
//    @PostMapping("/add-book")
//    public String addBook(@RequestParam String title,
//                          @RequestParam String author,
//                          @RequestParam String category,
//                          @RequestParam boolean available) {
//
//        Book book = new Book();
//        book.setTitle(title);
//        book.setAuthor(author);
//        book.setCategory(category);
//        book.setAvailable(available);
//
//        bookRepo.save(book); // ✅ Save to DB
//
//        return "redirect:/admin/dashboard"; // after adding, go to dashboard
//    }
//
//    // View all users
//    
// // Remove a user
//    @PostMapping("/remove-user")
//    public String removeUser(@RequestParam("id") Long id) {
//        userRepo.deleteById(id);
//        return "redirect:/admin/users";
//    }
//    @GetMapping("/books")
//    public String viewAllBooks(Model model) {
//        List<Book> books = bookRepo.findAll();
//        model.addAttribute("books", books);
//        return "adminlistbook"; // ✅ NOT "adminbooklist"
//    }
//    @GetMapping("/users")
//    public String viewAllUsers(Model model) {
//        List<User> users = userRepo.findAll()
//            .stream()
//            .filter(user -> "USER".equalsIgnoreCase(
//                user.getRole() != null ? user.getRole() : ""))
//            .collect(Collectors.toList());
//
//        model.addAttribute("users", users);
//        return "membermanagement"; // your JSP name
//    }
// // AdminController.java
//    @GetMapping("/dashboard")
//    public String adminDashboard() {
//        return "admindashboard"; // JSP name
//    }
//
//    // UserController.java
//    @GetMapping("/user/dashboard")
//    public String userDashboard() {
//        return "userdashboard"; // JSP name
//    }
//
//
//
//
//}
//package com.example.controller;
//
//import com.example.model.Book;
//import com.example.model.User;
//import com.example.repository.BookRepository;
//import com.example.repository.UserRepository;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//import java.util.stream.Collectors;
//
//@Controller
//@RequestMapping("/admin")
//public class AdminController {
//
//    @Autowired
//    private BookRepository bookRepo;
//
//    @Autowired
//    private UserRepository userRepo;
//
//    // ✅ Admin dashboard
//    @GetMapping("/dashboard")
//    public String adminDashboard() {
//        return "admindashboard"; // JSP name
//    }
//
//    // ✅ Show form to add a new book
//    @GetMapping("/add-book")
//    public String showAddBookForm(Model model) {
//        model.addAttribute("book", new Book());
//        return "addbook"; // JSP form to add book
//    }
//
//    // ✅ Handle new book submission
//    @PostMapping("/add-book")
//    public String addBook(@RequestParam String title,
//                          @RequestParam String author,
//                          @RequestParam String category,
//                          @RequestParam boolean available) {
//
//        Book book = new Book();
//        book.setTitle(title);
//        book.setAuthor(author);
//        book.setCategory(category);
//        book.setAvailable(available);
//
//        bookRepo.save(book); // Save to DB
//        return "redirect:/admin/dashboard";
//    }
//
//    // ✅ View all books
//    @GetMapping("/books")
//    public String viewAllBooks(Model model) {
//        List<Book> books = bookRepo.findAll();
//        model.addAttribute("books", books);
//        return "adminlistbook"; // JSP to display book list (without available/status)
//    }
//
//    // ✅ View only normal users (not admins)
//    @GetMapping("/users")
//    public String viewAllUsers(Model model) {
//        List<User> users = userRepo.findAll().stream()
//                .filter(user -> "USER".equalsIgnoreCase(user.getRole() != null ? user.getRole() : ""))
//                .collect(Collectors.toList());
//
//        model.addAttribute("users", users);
//        return "membermanagement"; // JSP for user listing with remove button
//    }
//
//    // ✅ Remove a user by ID
//    @PostMapping("/remove-user")
//    public String removeUser(@RequestParam("id") Long id) {
//        userRepo.deleteById(id);
//        return "redirect:/admin/users";
//    }
//   
//
//}
package com.example.controller;

import com.example.model.Book;
import com.example.model.User;
import com.example.repository.BookRepository;
import com.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private BookRepository bookRepo;

    @Autowired
    private UserRepository userRepo;

    @GetMapping("/dashboard")
    public String adminDashboard() {
        return "admindashboard"; // JSP
    }

    @GetMapping("/add-book")
    public String showAddBookForm(Model model) {
        model.addAttribute("book", new Book());
        return "addbook";
    }

    @PostMapping("/add-book")
  public String addBook(@RequestParam String title,
                       @RequestParam String author,
                       @RequestParam String category,
                        @RequestParam boolean available) {

      Book book = new Book();
      book.setTitle(title);
      book.setAuthor(author);
      book.setCategory(category);
      book.setAvailable(available);

      bookRepo.save(book); // Save to DB
      return "redirect:/admin/dashboard";
  }

    @GetMapping("/books")
    public String viewAllBooks(Model model) {
        model.addAttribute("books", bookRepo.findAll());
        return "adminlistbook";
    }

    @GetMapping("/users")
    public String viewAllUsers(Model model) {
        List<User> users = userRepo.findAll().stream()
                .filter(user -> "USER".equalsIgnoreCase(user.getRole()))
                .collect(Collectors.toList());
        model.addAttribute("users", users);
        return "membermanagement";
    }

    @PostMapping("/remove-user")
    public String removeUser(@RequestParam Long id) {
        userRepo.deleteById(id);
        return "redirect:/admin/users";
    }
}

