<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Confirm Edit</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #fdfbfb, #ebedee);
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .card {
      background: white;
      padding: 40px 50px;
      border-radius: 20px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
      width: 440px;
      text-align: center;
      animation: fadeIn 0.6s ease-out;
    }

    h2 {
      background: linear-gradient(135deg, #00BFFF, #009ACD);
      color: white;
      padding: 15px;
      border-radius: 12px;
      margin-bottom: 25px;
      font-size: 22px;
    }

    p {
      color: #2c3e50;
      margin-bottom: 20px;
    }

    .detail {
      background-color: #f9f9f9;
      padding: 12px 16px;
      margin: 12px 0;
      border-radius: 10px;
      box-shadow: inset 0 0 4px rgba(0, 0, 0, 0.05);
      text-align: left;
      font-size: 16px;
      color: #34495e;
    }

    .detail strong {
      color: #2c3e50;
      display: inline-block;
      width: 80px;
    }

    .actions {
      margin-top: 30px;
      display: flex;
      justify-content: center;
      gap: 20px;
    }

    .actions button {
      padding: 10px 22px;
      font-size: 15px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: transform 0.2s ease, background-color 0.3s ease;
    }

    .actions button:hover {
      transform: scale(1.05);
    }

    .confirm-btn {
      background-color: #28a745;
      color: white;
    }

    .cancel-btn {
      background-color: #dc3545;
      color: white;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>
  <div class="card">
    <h2>&#128221; Confirm Edit</h2>
    <p>Please review the updated details before submitting:</p>

    <div class="detail"><strong>ID:</strong> ${student.sid}</div>
    <div class="detail"><strong>Name:</strong> ${student.name}</div>
    <div class="detail"><strong>Course:</strong> ${student.course}</div>
    <div class="detail"><strong>City:</strong> ${student.city}</div>

    <form action="updated" method="post">
      <input type="hidden" name="sid" value="${student.sid}" />
      <input type="hidden" name="name" value="${student.name}" />
      <input type="hidden" name="course" value="${student.course}" />
      <input type="hidden" name="city" value="${student.city}" />
      <div class="actions">
        <button type="submit" class="confirm-btn">&#9989; Confirm</button>
        <button type="button" class="cancel-btn" onclick="history.back()">&#10060; Cancel</button>
      </div>
    </form>
  </div>
</body>
</html>