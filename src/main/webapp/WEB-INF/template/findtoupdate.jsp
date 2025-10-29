<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Find Student</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #FFDEE9, #B5FFFC);
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .container {
      background: rgba(255, 255, 255, 0.7);
      backdrop-filter: blur(10px);
      padding: 40px 50px;
      border-radius: 20px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
      width: 420px;
      text-align: center;
      transition: transform 0.3s ease;
    }

    .container:hover {
      transform: scale(1.02);
    }

    h2 {
      margin-bottom: 25px;
      color: #2c3e50;
      font-size: 24px;
    }

    input[type="number"] {
      width: 100%;
      padding: 12px;
      margin-bottom: 25px;
      border: 1px solid #ccc;
      border-radius: 10px;
      font-size: 16px;
      transition: all 0.3s ease;
      box-shadow: inset 0 0 5px rgba(0, 191, 255, 0.2);
    }

    input[type="number"]:focus {
      border-color: #00BFFF;
      box-shadow: 0 0 10px #00BFFF;
      outline: none;
    }

    button {
      background: linear-gradient(135deg, #00BFFF, #009ACD);
      color: white;
      padding: 12px 24px;
      border: none;
      border-radius: 10px;
      font-size: 16px;
      cursor: pointer;
      transition: background 0.3s ease, transform 0.2s ease;
    }

    button:hover {
      background: linear-gradient(135deg, #009ACD, #0077B6);
      transform: scale(1.05);
    }

    .back-link {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #f0f0f0;
      border-radius: 8px;
      text-decoration: none;
      color: #2c3e50;
      font-size: 15px;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .back-link:hover {
      background-color: #e0e0e0;
      transform: scale(1.05);
      color: #00BFFF;
    }

    .card {
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(10px);
      padding: 30px 40px;
      border-radius: 20px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
      text-align: left;
      animation: pop 0.8s ease-in-out;
      margin-top: 30px;
    }

    .card h3 {
      color: #2ecc71;
      font-size: 22px;
      margin-bottom: 20px;
      text-align: center;
    }

    .detail {
      font-size: 16px;
      margin: 14px 0;
      color: #34495e;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 10px;
      padding: 10px 12px;
      background-color: #f9f9f9;
      border-radius: 12px;
      box-shadow: inset 0 0 4px rgba(0, 0, 0, 0.05);
      transition: background-color 0.3s ease;
    }

    .detail:hover {
      background-color: #eef6ff;
    }

    .detail input[type="text"] {
      flex: 1;
      padding: 8px 12px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 15px;
      background-color: #fff;
      box-shadow: 0 2px 6px rgba(0, 191, 255, 0.1);
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .detail input[type="text"] {
      flex: 1;
      width: 100%; /* Ensures full width inside flex container */
      padding: 8px 12px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 15px;
      background-color: #fff;
      box-shadow: 0 2px 6px rgba(0, 191, 255, 0.1);
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .detail-icon {
      font-size: 18px;
      margin-right: 10px;
      color: #3498db;
    }

    strong {
      color: #2c3e50;
      margin-right: 5px;
    }

    .error {
      color: red;
      margin-top: 20px;
      font-weight: bold;
    }

    @keyframes pop {
      0% { transform: scale(0.9); opacity: 0; }
      100% { transform: scale(1); opacity: 1; }
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>&#128269; Find Student by ID</h2>
    <form action="showToUpdate" method="post">
      <input type="number" name="sid" placeholder="Enter Student ID" required />
      <button type="submit">Search</button>
    </form>

    <!-- Show student details if found -->
    <c:if test="${not empty student}">
      <div class="card">
        <h3>&#127891; Student Details</h3>
        <form action="confirmupdate" method="post">
          <input type="hidden" name="sid" value="${student.sid}" />
          <div class="detail"><span class="detail-icon">&#127381;</span><strong>ID:</strong>
            <input type="text" name="sidDisplay" value="${student.sid}" disabled />
          </div>
          <div class="detail"><span class="detail-icon">&#128100;</span><strong>Name:</strong>
            <input type="text" name="name" value="${student.name}" />
          </div>
          <div class="detail"><span class="detail-icon">&#128216;</span><strong>Course:</strong>
            <input type="text" name="course" value="${student.course}" />
          </div>
          <div class="detail"><span class="detail-icon">&#128205;</span><strong>City:</strong>
            <input type="text" name="city" value="${student.city}" />
          </div>
          <div style="margin-top: 20px; display: flex; justify-content: center; gap: 12px;">
            <button type="submit">✏️ Update</button>
        </form>
        <form action="delete" method="post">
          <input type="hidden" name="sid" value="${student.sid}" />
          <button type="submit"">🗑️ Delete</button>
        </form>
          </div>
      </div>
    </c:if>

    <!-- Show error if student not found -->
    <c:if test="${not empty notfound}">
      <p class="error">&#9888; ${notfound} <br> Please enter the valid Student ID</p>
    </c:if>

    <a href="/Student-Mgmt/" class="back-link">&#127968; &#8592; Back to Home</a>
  </div>
</body>
</html>