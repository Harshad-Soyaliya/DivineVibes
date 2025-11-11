<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        footer {
            background: linear-gradient(135deg, #BF932A 0%, #a67c00 100%);
            color: #FCFCF7;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding-top: 60px;
            padding-bottom: 30px;
            margin-top: 60px;
            box-shadow: 0 -4px 15px rgba(191, 147, 42, 0.3);
            position: relative;
            overflow: hidden;
        }

        footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="2" fill="rgba(252,252,247,0.1)"/></svg>') repeat;
            opacity: 0.1;
            pointer-events: none;
        }

        footer h4, footer h5 {
            color: #FCFCF7;
            font-weight: 700;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        footer p {
            color: #FCFCF7;
            line-height: 1.7;
            opacity: 0.9;
        }

        footer a {
            text-decoration: none;
            color: #FCFCF7;
            transition: all 0.4s ease;
            position: relative;
        }

        footer a:hover {
            color: #FCFCF7;
            transform: translateX(5px);
        }

        footer a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background-color: #FCFCF7;
            transition: width 0.3s ease;
        }

        footer a:hover::after {
            width: 100%;
        }

        footer ul {
            column-count: 2;
            column-gap: 20px;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        footer ul li {
            margin-bottom: 10px;
            break-inside: avoid;
        }

        .footer-icon {
            width: 45px;
            height: 45px;
            background-color: #FCFCF7;
            color: #BF932A;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            transition: all 0.4s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border: 2px solid transparent;
        }

        .footer-icon:hover {
            background-color: #BF932A;
            color: #FCFCF7;
            transform: scale(1.15) rotate(5deg);
            box-shadow: 0 6px 12px rgba(191, 147, 42, 0.5);
            border-color: #FCFCF7;
        }

        .footer-icon i {
            font-size: 1.3rem;
        }

        hr {
            border: 0;
            height: 1px;
            background: linear-gradient(to right, transparent, #FCFCF7, transparent);
            margin: 40px 0;
        }

        .copyright {
            font-size: 0.9rem;
            text-align: center;
            color: #FCFCF7;
            opacity: 0.8;
        }

        .newsletter input {
            border-radius: 25px;
            border: 1px solid #FCFCF7;
            background: rgba(252, 252, 247, 0.1);
            color: #FCFCF7;
            padding: 10px 15px;
        }

        .newsletter input::placeholder {
            color: rgba(252, 252, 247, 0.7);
        }

        .newsletter button {
            background-color: #FCFCF7;
            color: #BF932A;
            border-radius: 25px;
            border: none;
            padding: 10px 20px;
            transition: all 0.3s ease;
        }

        .newsletter button:hover {
            background-color: #BF932A;
            color: #FCFCF7;
            transform: scale(1.05);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            footer .row {
                flex-direction: column;
            }

            footer .row > div {
                margin-bottom: 30px;
                text-align: center;
                width: 100%;
            }

            footer ul {
                column-count: 1;
            }

            .footer-icon {
                width: 50px;
                height: 50px;
            }

            .d-flex {
                justify-content: center;
            }

            footer a:hover {
                transform: none;
            }
        }
    </style>
</head>

<body>

<footer class="text-white pt-5 pb-3 mt-5">

    <div class="container position-relative">
        <div class="row">

            <!-- Brand & About -->
            <div class="col-md-4 mb-4">
                <h4 class="fw-bold">DivineVibes ✨</h4>
                <p>Your journey toward inner peace starts here. Embrace spirituality with our guided activities, stories, and bhajans.</p>
                <div class="contact-info mt-3">
                    <a href="mailto:contact@divinevibes.com"><i class="fas fa-envelope me-2"></i>contact@divinevibes.com</a>
                    <a href="tel:+1234567890"><i class="fas fa-phone me-2"></i>+1 (234) 567-890</a>
                </div>
            </div>

            <!-- Navigation -->
            <div class="col-md-4 mb-4">
                <h5 class="fw-semibold">Quick Links</h5>
                <ul class="mt-3">
                    <li><a href="dashboard.jsp">Home</a></li>
                    <li><a href="activities.jsp">Activities</a></li>
                    <li><a href="stories.jsp">Stories</a></li>
                    <li><a href="bhajans.jsp">Bhajans</a></li>
                    <li><a href="chatbot.jsp">Chatbot</a></li>
                    <li><a href="privacy.jsp">Privacy Policy</a></li>
                    <li><a href="terms.jsp">Terms of Service</a></li>
                </ul>
            </div>

            <!-- Social & Newsletter -->
            <div class="col-md-4 mb-4">
                <h5 class="fw-semibold">Follow Us</h5>
                <div class="d-flex gap-3 mt-3">
                    <a class="footer-icon" href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                    <a class="footer-icon" href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                    <a class="footer-icon" href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                    <a class="footer-icon" href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                </div>
                <p class="mt-3">Subscribe to our newsletter for daily inspiration.</p>
                <form class="d-flex newsletter">
                    <input type="email" class="form-control me-2" placeholder="Your email">
                    <button class="btn" type="submit">Subscribe</button>
                </form>
            </div>

        </div>

        <hr>

        <p class="copyright m-0">© 2025 DivineVibes | Made with ❤ for Inner Peace</p>
    </div>

</footer>

<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- FONT AWESOME -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/js/all.min.js"></script>

</body>
</html>