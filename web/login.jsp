<%-- 
    Document   : login
    Created on : Apr 13, 2026, 1:50:28 AM
    Author     : lttru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng Nhập</title>
        <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
        <style>
            :root {
                --green-dark:  #1a3a2a;
                --green-mid:   #2e6b47;
                --green-light: #4caf75;
                --cream:       #f5f0e8;
                --gold:        #c9a84c;
                --glass-bg:    rgba(245, 240, 232, 0.12);
                --glass-border:rgba(201, 168, 76, 0.25);
            }/*màu sắc dùng chung cho toàn trang*/

            *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

            body {
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: 'Jost', sans-serif;
                overflow: hidden;
                background: var(--green-dark);
            }

            .bg {
                position: fixed;
                inset: 0;
                background-image: url("https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=1920&q=80");
                background-size: cover;
                background-position: center;
                filter: blur(3px) brightness(0.45) saturate(0.8);
                transform: scale(1.06);
                z-index: 0;
            }/*ảnh nền được làm mờ + tối ưu để thẻ đăng nhập nổi bật hơn*/

            .bg::after {
                content: "";
                position: fixed;
                inset: 0;
                background:
                    linear-gradient(to bottom, rgba(26,58,42,0.55) 0%, transparent 30%, transparent 70%, rgba(26,58,42,0.7) 100%),
                    repeating-linear-gradient(90deg,
                        transparent 0px,
                        transparent 119px,
                        rgba(201,168,76,0.07) 120px,
                        transparent 121px
                    );
            }

            .card {
                position: relative;
                z-index: 10;
                width: 420px;
                padding: 52px 48px 44px;
                background: var(--glass-bg);
                border: 1px solid var(--glass-border);
                border-radius: 4px;
                backdrop-filter: blur(22px) saturate(1.4);
                -webkit-backdrop-filter: blur(22px) saturate(1.4);
                box-shadow:
                    0 0 0 1px rgba(255,255,255,0.04) inset,
                    0 32px 64px rgba(0,0,0,0.55),
                    0 0 120px rgba(46,107,71,0.18);
                animation: fadeUp 0.7s cubic-bezier(.22,.68,0,1.2) both;
            }/*thẻ trong suốt + viền vàng*/

            @keyframes fadeUp {
                from { opacity: 0; transform: translateY(28px) scale(0.97); }
                to   { opacity: 1; transform: translateY(0)    scale(1);    }
            } /*Khi tải trang, thẻ trượt từ dưới lên*/

            .card::before, .card::after {
                content: "";
                position: absolute;
                width: 18px; height: 18px;
                border-color: var(--gold);
                border-style: solid;
            }
            .card::before { top: 14px; left: 14px;  border-width: 1px 0 0 1px; }
            .card::after  { bottom: 14px; right: 14px; border-width: 0 1px 1px 0; }

            .logo-wrap {
                text-align: center;
                margin-bottom: 36px;
            }

            .logo-icon {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 52px; height: 52px;
                border-radius: 50%;
                border: 1px solid var(--gold);
                margin-bottom: 16px;
                background: rgba(201,168,76,0.08);
                animation: pulse 3s ease-in-out infinite;
            }

            @keyframes pulse {
                0%,100% { box-shadow: 0 0 0 0 rgba(201,168,76,0.3); }
                50%      { box-shadow: 0 0 0 8px rgba(201,168,76,0); }
            }/*Icon logo có hiệu ứng đập nhẹ như nhịp tim liên tục*/

            .logo-icon svg { width: 24px; height: 24px; stroke: var(--gold); fill: none; stroke-width: 1.5; }

            h2 {
                font-family: 'Cormorant Garamond', serif;
                font-weight: 300;
                font-size: 2rem;
                letter-spacing: 0.12em;
                color: var(--cream);
                text-transform: uppercase;
            }

            .subtitle {
                margin-top: 4px;
                font-size: 0.7rem;
                letter-spacing: 0.22em;
                color: var(--gold);
                text-transform: uppercase;
                font-weight: 300;
            }

            .divider {
                display: flex;
                align-items: center;
                gap: 12px;
                margin-bottom: 28px;
            }
            .divider span { flex: 1; height: 1px; background: rgba(201,168,76,0.25); }
            .divider i { color: var(--gold); font-size: 0.6rem; letter-spacing: 0.15em; font-style: normal; font-weight: 400; }

            .field { margin-bottom: 20px; }

            label {
                display: block;
                font-size: 0.68rem;
                letter-spacing: 0.18em;
                text-transform: uppercase;
                color: rgba(245,240,232,0.55);
                margin-bottom: 8px;
                font-weight: 400;
            }

            .input-wrap { position: relative; }

            .input-wrap svg {
                position: absolute;
                left: 14px;
                top: 50%;
                transform: translateY(-50%);
                width: 16px; height: 16px;
                stroke: rgba(245,240,232,0.3);
                fill: none;
                stroke-width: 1.5;
                pointer-events: none;
                transition: stroke 0.2s;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 13px 14px 13px 42px;
                background: rgba(255,255,255,0.06);
                border: 1px solid rgba(201,168,76,0.2);
                border-radius: 3px;
                color: var(--cream);
                font-family: 'Jost', sans-serif;
                font-size: 0.9rem;
                font-weight: 300;
                letter-spacing: 0.04em;
                outline: none;
                transition: border-color 0.25s, background 0.25s, box-shadow 0.25s;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                border-color: var(--gold);
                background: rgba(201,168,76,0.06);
                box-shadow: 0 0 0 3px rgba(201,168,76,0.08);
            }

            input::placeholder { color: rgba(245,240,232,0.25); }

            .forgot {
                text-align: right;
                margin-top: -8px;
                margin-bottom: 28px;
            }
            .forgot a {
                font-size: 0.7rem;
                color: rgba(201,168,76,0.65);
                text-decoration: none;
                letter-spacing: 0.06em;
                transition: color 0.2s;
            }
            .forgot a:hover { color: var(--gold); }

            input[type="submit"] {
                width: 100%;
                padding: 14px;
                background: linear-gradient(135deg, var(--green-mid) 0%, var(--green-dark) 100%);
                border: 1px solid rgba(201,168,76,0.35);
                border-radius: 3px;
                color: var(--cream);
                font-family: 'Jost', sans-serif;
                font-size: 0.75rem;
                font-weight: 500;
                letter-spacing: 0.22em;
                text-transform: uppercase;
                cursor: pointer;
                position: relative;
                overflow: hidden;
                transition: border-color 0.3s, box-shadow 0.3s, transform 0.15s;
            }

            input[type="submit"]:hover {
                border-color: var(--gold);
                box-shadow: 0 4px 24px rgba(46,107,71,0.45), 0 0 0 1px rgba(201,168,76,0.2) inset;
                transform: translateY(-1px);
            }

            input[type="submit"]:active { transform: translateY(0); }

            .register {
                text-align: center;
                margin-top: 24px;
                font-size: 0.72rem;
                color: rgba(245,240,232,0.35);
                letter-spacing: 0.06em;
            }
            .register a {
                color: var(--gold);
                text-decoration: none;
                margin-left: 4px;
                transition: opacity 0.2s;
            }
            .register a:hover { opacity: 0.75; }

            .error-msg {
                background: rgba(180,50,50,0.18);
                border: 1px solid rgba(220,80,80,0.3);
                border-radius: 3px;
                padding: 10px 14px;
                margin-bottom: 20px;
                font-size: 0.78rem;
                color: #f4a0a0;
                letter-spacing: 0.04em;
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="bg"></div>

        <div class="card">
            <div class="logo-wrap">
                <div class="logo-icon">
                    <svg viewBox="0 0 24 24"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg>
                </div>
                <h2>Đăng Nhập</h2>
                <p class="subtitle">Hệ thống mua bán đèn trang trí</p>
            </div>

            <div class="divider">
                <span></span><i>✦</i><span></span>
            </div>

            <%
                String error = (String) request.getAttribute("mess");
                if (error == null) error = request.getParameter("error");
            %>
            <% if (error != null && !error.isEmpty()) { %>
                <div class="error-msg" style="display:block;"><%= error %></div>
            <% } %>

            <form action="LoginServlet" method="post">
                <div class="field">
                    <label for="email">Email</label>
                    <div class="input-wrap">
                        <input type="text" id="email" name="email" placeholder="you@example.com" autocomplete="email" required>
                        <svg viewBox="0 0 24 24"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="M2 7l10 7 10-7"/></svg>
                    </div>
                </div>

                <div class="field">
                    <label for="password">Mật khẩu</label>
                    <div class="input-wrap">
                        <input type="password" id="password" name="password" placeholder="••••••••" autocomplete="current-password" required>
                        <svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                    </div>
                </div>

                <div class="forgot">
                    <a href="forgotpassword.jsp">Quên mật khẩu?</a>
                </div>

                <input type="submit" value="Đăng nhập">
            </form>

            <p class="register">
                Chưa có tài khoản?<a href="register.jsp">Đăng ký ngay</a>
            </p>
        </div>
    </body>
</html>
