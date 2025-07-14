package com.example.controller;

import com.example.model.Book;
import com.example.model.BorrowRequest;
import com.example.repository.BookRepository;
import com.example.repository.BorrowRequestRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private BookRepository bookRepo;

    @Autowired
    private BorrowRequestRepository borrowRequestRepo;

    @GetMapping("/dashboard")
    public String userDashboard() {
        return "userdashboard";
    }

    @GetMapping("/books")
    public String browseAllBooks(Model model) {
        List<Book> allBooks = bookRepo.findAll();
        model.addAttribute("books", allBooks);
        return "booklist"; // Show list of all books
    }

   

    

    @PostMapping("/borrow")
    @Transactional
    public String borrowBook(@RequestParam Long bookId) {
        Book book = bookRepo.findById(bookId).orElse(null);
        if (book != null) {
            BorrowRequest request = new BorrowRequest();
            request.setTitle(book.getTitle());
            request.setAuthor(book.getAuthor());
            request.setCategory(book.getCategory());
            borrowRequestRepo.save(request);
        }
        return "redirect:/user/books"; // or "studentlist" if named so
    }



    @GetMapping("/requested-books")
    public String requestedBooks(Model model) {
        model.addAttribute("requests", borrowRequestRepo.findAll());
        return "requestedbooks";
    }


    @PostMapping("/remove-request")
    public String removeRequest(@RequestParam Long id) {
        borrowRequestRepo.deleteById(id);
        return "redirect:/user/requested-books";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login"; // NOT /signup
    }

    



    }



