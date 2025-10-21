<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Student Management System</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #e3f2fd, #fce4ec);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background-image: url('https://mintbook.com/assets/images/slider/slide1.jpg');
      background-size: cover;
      background-position: center;
    }

    h1 {
      color: #2e3c6d;
      font-size: 3rem;
      margin-bottom: 10px;
      text-shadow: 1px 1px 2px #ccc;
    }

    p {
      font-size: 1.2rem;
      color: #555;
      margin-bottom: 30px;
    }

    .card-container {
      display: flex;
      gap: 30px;
      flex-wrap: wrap;
      justify-content: center;
    }

    .card {
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.1);
      padding: 20px 30px;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      width: 200px;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 12px 24px rgba(0,0,0,0.2);
    }

    .card a {
      display: inline-block;
      margin-top: 10px;
      text-decoration: none;
      background-color: #6a1b9a;
      color: white;
      padding: 10px 20px;
      border-radius: 6px;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    .card a:hover {
      background-color: #4a148c;
    }

    @media (max-width: 600px) {
      h1 {
        font-size: 2rem;
      }

      .card-container {
        flex-direction: column;
        align-items: center;
      }
    }
  </style>
</head>
<body>
  <h1>Welcome to the Student Management System</h1>
  <p>Please choose an option:</p>
  <div class="card-container">
    <div class="card">
      <h2>&#x2795; Add New Student</h2>
      <a href="add">Go</a>
    </div>
    <div class="card">
      <h2>&#128203; View Students</h2>
      <a href="list">Go</a>
    </div>
    <div class="card">
      <h2>&#128269; Find Student</h2>
      <a href="find">Search</a>
    </div>
    <div class="card">
      <h2>&#9998; Update Student</h2>
      <a href="update">Update</a>
  </div>
</body>
</html>