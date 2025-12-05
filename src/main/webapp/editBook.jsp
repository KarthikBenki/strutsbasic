<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Library - Edit Book</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            max-width: 500px;
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .header {
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
            color: white;
            padding: 40px 40px 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .header p {
            opacity: 0.9;
            font-size: 1rem;
            font-weight: 400;
        }

        .form-container {
            padding: 40px;
        }

        /* Struts form styling */
        .book-form {
            max-width: 100%;
        }

        /* Struts label styling */
        .book-form label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #374151;
            font-size: 0.95rem;
            letter-spacing: 0.025em;
        }

        /* Struts textfield styling */
        .book-form .s2-textfield {
            width: 100%;
            padding: 16px 20px;
            border: 2px solid #e5e7eb;
            border-radius: 12px;
            font-size: 1rem;
            font-family: inherit;
            transition: all 0.3s ease;
            background: #fafbfc;
            margin-bottom: 24px;
        }

        .book-form .s2-textfield:focus {
            outline: none;
            border-color: #f59e0b;
            background: white;
            box-shadow: 0 0 0 3px rgba(245, 158, 11, 0.1);
            transform: translateY(-2px);
        }

        /* Submit button styling */
        .book-form input[type="submit"] {
            width: 100%;
            padding: 18px 32px;
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
            color: white;
            border: none;
            border-radius: 16px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            text-decoration: none;
            box-shadow: 0 10px 30px rgba(245, 158, 11, 0.3);
            font-family: inherit;
        }

        .book-form input[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 20px 40px rgba(245, 158, 11, 0.4);
        }

        .book-form input[type="submit"]:active {
            transform: translateY(-1px);
        }

        /* Back link styling */
        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 14px 24px;
            background: linear-gradient(135deg, #6b7280 0%, #4b5563 100%);
            color: white;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            margin-top: 20px;
            justify-content: center;
            box-shadow: 0 8px 25px rgba(107, 114, 128, 0.3);
        }

        .back-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 35px rgba(107, 114, 128, 0.4);
            color: white;
            text-decoration: none;
        }

        /* Error message styling for Struts */
        .book-form .s2-error-message {
            color: #dc2626;
            font-size: 0.875rem;
            margin-top: 6px;
            display: block;
            background: #fef2f2;
            padding: 8px 12px;
            border-radius: 8px;
            border-left: 4px solid #ef4444;
        }

        .book-form .s2-error {
            border-color: #ef4444 !important;
            background: #fef2f2 !important;
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1) !important;
        }

        @media (max-width: 480px) {
            body {
                padding: 10px;
            }
            
            .container {
                margin: 10px;
                border-radius: 20px;
            }
            
            .header {
                padding: 30px 25px 25px;
            }
            
            .header h1 {
                font-size: 1.8rem;
            }
            
            .form-container {
                padding: 30px 25px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-edit"></i> Edit Book</h1>
            <p>Update the book details and save your changes</p>
        </div>
        
        <div class="form-container">
            <form action="updateBook" method="post" class="book-form">
                <s:hidden name="book.id" />
                
                <s:textfield 
                    name="book.title" 
                    label="%{getText('label.title')}" 
                    size="40"
                    cssClass="s2-textfield title-field" />
                    
                <s:textfield 
                    name="book.author" 
                    label="%{getText('label.author')}"
                    cssClass="s2-textfield author-field" />
                    
                <input type="submit" value="Save Changes" />
            </form>
            
            <a href="bookList" class="back-link">
                <i class="fas fa-arrow-left"></i>
                Back to Book List
            </a>
        </div>
    </div>

    <script>
        // Auto-focus first field
        const firstField = document.querySelector('.s2-textfield');
        firstField?.focus();
        
        // Form submission feedback
        document.querySelector('.book-form')?.addEventListener('submit', function() {
            const submitBtn = this.querySelector('input[type="submit"]');
            const originalValue = submitBtn.value;
            submitBtn.value = 'Saving Changes...';
            submitBtn.disabled = true;
            
            // Re-enable after 3 seconds (timeout fallback)
            setTimeout(() => {
                submitBtn.value = originalValue;
                submitBtn.disabled = false;
            }, 3000);
        });
    </script>
</body>
</html>
