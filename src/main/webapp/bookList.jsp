<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Library - Book List</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 24px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .header p {
            opacity: 0.9;
            font-size: 1.1rem;
        }

        .content {
            padding: 40px;
        }

        .stats {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
            justify-content: center;
        }

        .stat-card {
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            padding: 20px 30px;
            border-radius: 16px;
            text-align: center;
            flex: 1;
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: #4f46e5;
            display: block;
        }

        .stat-label {
            color: #64748b;
            font-weight: 500;
        }

        .book-table {
            width: 100%;
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-collapse: separate;
            border-spacing: 0;
        }

        .book-table th {
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
            color: white;
            padding: 20px 24px;
            text-align: left;
            font-weight: 600;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
        }

        .book-table td {
            padding: 20px 24px;
            border-bottom: 1px solid #f1f5f9;
            transition: all 0.3s ease;
        }

        .book-table tbody tr:hover {
            background: #f8fafc;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .book-table tbody tr:last-child td {
            border-bottom: none;
        }

        .id-cell {
            font-family: 'SF Mono', monospace;
            font-weight: 600;
            color: #64748b;
            font-size: 0.9rem;
        }

        .title-cell {
            font-weight: 600;
            color: #1e293b;
            font-size: 1.05rem;
        }

        .author-cell {
            color: #475569;
            font-weight: 500;
        }

        .action-cell {
            display: flex;
            gap: 12px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 20px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.9rem;
            text-decoration: none;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn-edit {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            color: white;
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(16, 185, 129, 0.4);
        }

        .btn-delete {
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
            color: white;
        }

        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(239, 68, 68, 0.4);
        }

        .add-btn {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 16px 32px;
            background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);
            color: white;
            text-decoration: none;
            border-radius: 16px;
            font-weight: 600;
            font-size: 1.1rem;
            box-shadow: 0 10px 30px rgba(59, 130, 246, 0.4);
            transition: all 0.3s ease;
            margin-top: 30px;
            justify-content: center;
        }

        .add-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 20px 40px rgba(59, 130, 246, 0.5);
        }

        .empty-state {
            text-align: center;
            padding: 60px 40px;
            color: #64748b;
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        @media (max-width: 768px) {
            .container {
                margin: 10px;
                border-radius: 16px;
            }
            
            .stats {
                flex-direction: column;
            }
            
            .book-table {
                font-size: 0.9rem;
            }
            
            .book-table th,
            .book-table td {
                padding: 16px 12px;
            }
            
            .action-cell {
                flex-direction: column;
                gap: 8px;
            }
            
            .btn {
                justify-content: center;
                padding: 12px 16px;
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .container {
            animation: fadeInUp 0.6s ease-out;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-book-open"></i> Book Library</h1>
            <p>Manage your collection of books with ease</p>
        </div>
        
        <div class="content">
            <div class="stats">
                <div class="stat-card">
                    <span class="stat-number"><c:out value="${bookList != null ? bookList.size() : 0}"/></span>
                    <span class="stat-label">Total Books</span>
                </div>
                <div class="stat-card">
                    <span class="stat-number"><i class="fas fa-eye"></i></span>
                    <span class="stat-label">Live Preview</span>
                </div>
                <div class="stat-card">
                    <span class="stat-number"><i class="fas fa-sync-alt"></i></span>
                    <span class="stat-label">Real-time</span>
                </div>
            </div>

            <c:choose>
                <c:when test="${empty bookList}">
                    <div class="empty-state">
                        <i class="fas fa-books"></i>
                        <h3>No books found</h3>
                        <p>Your library is empty. Add your first book to get started!</p>
                        <a href="addBook" class="add-btn">
                            <i class="fas fa-plus"></i> Add First Book
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="book-table">
                        <thead>
                            <tr>
                                <th><i class="fas fa-hashtag"></i> ID</th>
                                <th><i class="fas fa-book"></i> Title</th>
                                <th><i class="fas fa-user"></i> Author</th>
                                <th><i class="fas fa-cogs"></i> Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${bookList}" var="book">
                                <tr>
                                    <td class="id-cell">#${book.id}</td>
                                    <td class="title-cell">${book.title}</td>
                                    <td class="author-cell">${book.author}</td>
                                    <td class="action-cell">
                                        <a href="editBook?bookId=${book.id}" class="btn btn-edit">
                                            <i class="fas fa-edit"></i> Edit
                                        </a>
                                        <a href="deleteBook?bookId=${book.id}" class="btn btn-delete" 
                                           onclick="return confirm('Are you sure you want to delete this book?')">
                                            <i class="fas fa-trash"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <a href="addBook" class="add-btn">
                        <i class="fas fa-plus-circle"></i> Add New Book
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script>
        // Add smooth scroll behavior
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>
