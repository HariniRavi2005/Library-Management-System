package com.example.service;

import com.example.model.Issue;
import com.example.model.User;

import java.util.List;

public interface IssueService {
    void issueBook(Issue issue);
    void returnBook(Long issueId);
    List<Issue> getUserIssues(User user);
}
