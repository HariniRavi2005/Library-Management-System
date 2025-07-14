<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background-color: #e0f2fe;
        }

        header {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            background: #dbeafe;
            padding: 16px 5%;
        }

        .logo h1 {
            font-weight: 700;
            font-size: 24px;
            margin: 0;
            color: #000000;
        }

        nav {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
            margin: 10px 0;
        }

        nav a {
            text-decoration: none;
            color: #1e40af;
            font-weight: 500;
        }

        .cta {
            border: 2px solid #2563eb;
            padding: 8px 16px;
            border-radius: 6px;
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        .hero {
            text-align: center;
            padding: 60px 5%;
        }

        .hero h1 {
            font-size: 2.5rem;
            color: #111827;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 1.1rem;
            color: #374151;
            margin-bottom: 40px;
        }

        .buttons {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 40px;
        }

        .action-box {
            text-align: center;
        }

        .action-box a {
            padding: 14px 28px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            background-color: #ea580c;
            color: white;
            transition: background-color 0.3s ease;
        }

        .action-box a:hover {
            background-color: #c2410c;
        }

        .features {
            background-color: #f3f4f6;
            padding: 40px 5%;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }

        .feature {
            max-width: 280px;
            text-align: center;
        }

        .feature h3 {
            color: #1d4ed8;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .feature p {
            color: #4b5563;
            font-size: 15px;
        }

        @media (max-width: 600px) {
            .hero h1 {
                font-size: 1.8rem;
            }

            .hero p {
                font-size: 1rem;
            }

            .action-box a {
                font-size: 14px;
                padding: 10px 20px;
            }

            nav {
                flex-direction: column;
                align-items: center;
                gap: 10px;
            }
        }
    </style>
</head>
<body>

<header>
    <div class="logo"><h1>Library System</h1></div>
    <nav>
        <a href="#">Catalog</a>
        <a href="#">Contact</a>
        <a href="#">Help</a>
    </nav>
    <a href="/login" class="cta">Get Started</a>
</header>

<section class="hero">
    <h1>Manage Your Library Smartly</h1>
    <p>Organize books, track users, and streamline lending – all in one place.</p>
    <div class="buttons">
        <div class="action-box">
            <a href="/login">Already a user? Login</a>
        </div>
        <div class="action-box">
            <a href="/signup">Don't have an account? Signup</a>
        </div>
    </div>
</section>

<section class="features">
    <div class="feature">
        <h3>Book Catalog</h3>
        <p>Search, manage, and track all your books efficiently.</p>
    </div>
    <div class="feature">
        <h3>Role-Based Access</h3>
        <p>Admins and users get dedicated dashboards and controls.</p>
    </div>
    <div class="feature">
        <h3>Lending System</h3>
        <p>Issue, return, and manage due dates with reminders.</p>
    </div>
</section>

</body>
</html>
