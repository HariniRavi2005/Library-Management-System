package com.example.service.impl;

import com.example.model.Issue;
import com.example.model.User;
import com.example.repository.IssueRepository;
import com.example.service.IssueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class IssueServiceImpl implements IssueService {

    @Autowired
    private IssueRepository issueRepo;

    @Override
    public void issueBook(Issue issue) {
        issue.setIssueDate(LocalDate.now());
        issue.setDueDate(LocalDate.now().plusDays(14)); // 2 weeks
        issueRepo.save(issue);
    }

    @Override
    public void returnBook(Long issueId) {
        Issue issue = issueRepo.findById(issueId).orElse(null);
        if (issue != null) {
            issue.setReturnDate(LocalDate.now());
            long lateDays = java.time.temporal.ChronoUnit.DAYS.between(issue.getDueDate(), issue.getReturnDate());
            issue.setFine(Math.max(0, lateDays * 5)); // ₹5/day fine
            issueRepo.save(issue);
        }
    }

    @Override
    public List<Issue> getUserIssues(User user) {
        return issueRepo.findByUser(user);
    }
}
