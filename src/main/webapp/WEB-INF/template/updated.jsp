<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Updated Successfully</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #d4fc79, #96e6a1);
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .card {
      background: white;
      padding: 40px 50px;
      border-radius: 20px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
      text-align: center;
      width: 420px;
      animation: fadeIn 0.6s ease-out;
    }

    h1 {
      font-size: 24px;
      color: #28a745;
      margin-bottom: 20px;
    }

    p {
      font-size: 16px;
      color: #2c3e50;
      margin-bottom: 30px;
    }

    .actions {
      display: flex;
      justify-content: center;
      gap: 15px;
    }

    .actions a {
      padding: 10px 20px;
      background-color: #007bff;
      color: white;
      text-decoration: none;
      border-radius: 8px;
      font-size: 15px;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .actions a:hover {
      background-color: #0056b3;
      transform: scale(1.05);
    }

    .back-link {
      background-color: #6c757d;
    }

    .back-link:hover {
      background-color: #495057;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>
  <div class="card">
    <h1> &#9989;Student Updated Successfully</h1>
    <p>The student's information has been updated.</p>
    <div class="actions">
      <a href="list">&#128203; View Student List</a>
      <a href="home" class="back-link">&#127968; Back to Home</a>
    </div>
  </div>
</body>
</html>