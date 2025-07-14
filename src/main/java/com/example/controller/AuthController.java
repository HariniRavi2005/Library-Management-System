package com.example.controller;

import com.example.model.User;
import com.example.service.AuthService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    @Autowired
    private AuthService authService;

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/signup")
    public String showSignupForm(Model model) {
        model.addAttribute("user", new User());
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute User user, HttpSession session, Model model) {
        if (authService.userExists(user.getUsername())) {
            model.addAttribute("usernameExists", true); // ✅ this line is required
            return "signup"; // Go back to signup.jsp with flag
        }

        User registeredUser = authService.registerUser(user);
        session.setAttribute("user", registeredUser);

        if ("ADMIN".equalsIgnoreCase(registeredUser.getRole())) {
            return "redirect:/admin/dashboard";
        } else {
            return "redirect:/user/dashboard";
        }
    }





    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute User user, HttpSession session, Model model) {
        User loggedInUser = authService.authenticate(
            user.getUsername(),
            user.getPassword(),
            user.getEmail(),
            user.getRole()
        );

        if (loggedInUser != null) {
            session.setAttribute("user", loggedInUser);

            // Return JSP name directly
            return loggedInUser.getRole().equalsIgnoreCase("ADMIN")
                    ? "admindashboard"
                    : "userdashboard";
        } else {
            model.addAttribute("error", "Invalid credentials!");
            return "login";
        }
    }



    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
