<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>List of Students</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', Arial, sans-serif;
      background: linear-gradient(135deg, #74ABE2, #5563DE);
      margin: 0;
      padding: 40px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    h1 {
      color: #fff;
      text-align: center;
      margin-bottom: 20px;
      font-size: 28px;
    }

    .search-box {
      margin-bottom: 20px;
    }

    input[type="text"] {
      width: 300px;
      padding: 10px 12px;
      border-radius: 8px;
      border: none;
      outline: none;
      font-size: 16px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
    }

    .controls {
      display: flex;
      justify-content: center;
      gap: 15px;
      margin-bottom: 20px;
    }

    .controls button {
      padding: 10px 20px;
      border-radius: 8px;
      border: none;
      font-weight: bold;
      cursor: pointer;
      background-color: #fff;
      color: #5563DE;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
      transition: all 0.3s ease;
    }

    .controls button:hover {
      background-color: #e0e7ff;
      transform: scale(1.05);
    }

    table {
      border-collapse: collapse;
      width: 80%;
      max-width: 900px;
      background: #fff;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    }

    th, td {
      padding: 14px 18px;
      text-align: center;
      font-size: 15px;
    }

    th {
      background-color: #5563DE;
      color: white;
      letter-spacing: 0.5px;
    }

    tr:nth-child(even) {
      background-color: #f8f8f8;
    }

    tr:hover {
      background-color: #e0e7ff;
      transform: scale(1.01);
      transition: 0.2s ease-in-out;
    }

    .no-data {
      text-align: center;
      color: #999;
      padding: 20px;
      font-style: italic;
    }

    #pagination {
      margin-top: 20px;
    }

    #pagination button {
      margin: 0 5px;
      padding: 6px 12px;
      border-radius: 6px;
      border: none;
      cursor: pointer;
      background: #fff;
      color: #5563DE;
      font-weight: bold;
      transition: background 0.3s ease;
    }

    #pagination button.active {
      background: #5563DE;
      color: #fff;
    }

    @media (max-width: 600px) {
      table, th, td {
        font-size: 13px;
        padding: 10px;
      }
      input[type="text"] {
        width: 90%;
      }
    }
  </style>
</head>
<body>

  <h1>📋 List of Students</h1>

  <div class="search-box">
    <input type="text" id="searchInput" placeholder="🔍 Search by name or city..." onkeyup="filterTable()">
  </div>

  <table id="studentTable">
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Course</th>
        <th>City</th>
      </tr>
    </thead>
    <tbody id="tableBody">
      <c:choose>
        <c:when test="${not empty list}">
          <c:forEach var="student" items="${list}">
            <tr>
              <td><c:out value="${student.sid}" /></td>
              <td><c:out value="${student.name}" /></td>
              <td><c:out value="${student.course}" /></td>
              <td><c:out value="${student.city}" /></td>
            </tr>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <tr><td colspan="4" class="no-data">No students found.</td></tr>
        </c:otherwise>
      </c:choose>
    </tbody>
  </table>

  <div id="pagination"></div>

  <br><br>
  <div class="controls">
    <button onclick="exportToCSV()">⬇️ Export to CSV</button>
    <button onclick="home">⬅️ Back to Home</button>
  </div>


  <script>
    const rowsPerPage = 5;
    const tableBody = document.getElementById("tableBody");
    const rows = Array.from(tableBody.querySelectorAll("tr"));
    const pagination = document.getElementById("pagination");

    function displayPage(page) {
      tableBody.innerHTML = "";
      const start = (page - 1) * rowsPerPage;
      const end = start + rowsPerPage;
      rows.slice(start, end).forEach(row => tableBody.appendChild(row));
      updatePagination(page);
    }

    function updatePagination(currentPage) {
      const totalPages = Math.ceil(rows.length / rowsPerPage);
      pagination.innerHTML = "";

      for (let i = 1; i <= totalPages; i++) {
        const btn = document.createElement("button");
        btn.textContent = i;
        btn.className = i === currentPage ? "active" : "";
        btn.onclick = () => displayPage(i);
        pagination.appendChild(btn);
      }
    }

    function filterTable() {
      const input = document.getElementById("searchInput").value.toLowerCase();
      const filtered = rows.filter(row => {
        const text = row.textContent.toLowerCase();
        return text.includes(input);
      });

      tableBody.innerHTML = "";
      filtered.forEach(row => tableBody.appendChild(row));
      updatePagination(1);
    }

    function exportToCSV() {
      const table = document.getElementById("studentTable");
      const rows = table.querySelectorAll("tr");
      let csv = [];

      rows.forEach(row => {
        const cols = row.querySelectorAll("th, td");
        const data = Array.from(cols).map(col => `"${col.innerText}"`);
        csv.push(data.join(","));
      });

      const blob = new Blob([csv.join("\n")], { type: "text/csv" });
      const url = URL.createObjectURL(blob);
      const a = document.createElement("a");
      a.href = url;
      a.download = "students.csv";
      a.click();
      URL.revokeObjectURL(url);
    }
    displayPage(1);
  </script>
</body>
</html>