package com.example.service;

import com.example.model.Book;

import java.util.List;

public interface BookService {
    List<Book> getAllBooks();
    Book getBookById(Long id);
    void saveBook(Book book);
    void deleteBook(Long id);
    List<Book> searchBooks(String keyword);
}
