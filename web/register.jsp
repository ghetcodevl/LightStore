<%-- 
    Document   : register
    Created on : Apr 13, 2026, 1:50:35 AM
    Author     : lttru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng Ký</title>
        <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
        <style>
            :root {
                --green-dark:   #1a3a2a;
                --green-mid:    #2e6b47;
                --cream:        #f5f0e8;
                --gold:         #c9a84c;
                --glass-bg:     rgba(245, 240, 232, 0.12);
                --glass-border: rgba(201, 168, 76, 0.25);
                --error-color:  #f4a0a0;
            }

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

            /* ── Background ── */
            .bg {
                position: fixed;
                inset: 0;
                background-image: url("https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=1920&q=80");
                background-size: cover;
                background-position: center;
                filter: blur(3px) brightness(0.45) saturate(0.8);
                transform: scale(1.06);
                z-index: 0;
            }
            .bg::after {
                content: "";
                position: fixed;
                inset: 0;
                background:
                    linear-gradient(to bottom, rgba(26,58,42,0.55) 0%, transparent 30%, transparent 70%, rgba(26,58,42,0.7) 100%),
                    repeating-linear-gradient(90deg, transparent 0px, transparent 119px, rgba(201,168,76,0.07) 120px, transparent 121px);
            }

            /* ── Card ── */
            .card {
                position: relative;
                z-index: 10;
                width: 460px;
                padding: 48px 48px 40px;
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
            }

            @keyframes fadeUp {
                from { opacity: 0; transform: translateY(28px) scale(0.97); }
                to   { opacity: 1; transform: translateY(0) scale(1); }
            }

            /* Corner ornaments */
            .card::before, .card::after {
                content: "";
                position: absolute;
                width: 18px; height: 18px;
                border-color: var(--gold);
                border-style: solid;
            }
            .card::before { top: 14px; left: 14px;  border-width: 1px 0 0 1px; }
            .card::after  { bottom: 14px; right: 14px; border-width: 0 1px 1px 0; }

            /* ── Header ── */
            .logo-wrap { text-align: center; margin-bottom: 32px; }

            .logo-icon {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 52px; height: 52px;
                border-radius: 50%;
                border: 1px solid var(--gold);
                margin-bottom: 14px;
                background: rgba(201,168,76,0.08);
                animation: pulse 3s ease-in-out infinite;
            }
            @keyframes pulse {
                0%,100% { box-shadow: 0 0 0 0   rgba(201,168,76,0.3); }
                50%      { box-shadow: 0 0 0 8px rgba(201,168,76,0);   }
            }
            .logo-icon svg { width: 24px; height: 24px; stroke: var(--gold); fill: none; stroke-width: 1.5; }

            h2 {
                font-family: 'Cormorant Garamond', serif;
                font-weight: 300;
                font-size: 1.9rem;
                letter-spacing: 0.12em;
                color: var(--cream);
                text-transform: uppercase;
            }
            .subtitle {
                margin-top: 4px;
                font-size: 0.68rem;
                letter-spacing: 0.22em;
                color: var(--gold);
                text-transform: uppercase;
            }

            /* ── Divider ── */
            .divider { display:flex; align-items:center; gap:12px; margin-bottom:24px; }
            .divider span { flex:1; height:1px; background:rgba(201,168,76,0.25); }
            .divider i { color:var(--gold); font-size:0.6rem; font-style:normal; }

            /* ── Two-column grid ── */
            .grid-2 { display: grid; grid-template-columns: 1fr 1fr; gap: 0 16px; }
            .field-full { grid-column: 1 / -1; }

            /* ── Field ── */
            .field { margin-bottom: 18px; }

            label {
                display: block;
                font-size: 0.67rem;
                letter-spacing: 0.18em;
                text-transform: uppercase;
                color: rgba(245,240,232,0.55);
                margin-bottom: 7px;
            }

            .input-wrap { position: relative; }
            .input-wrap svg {
                position: absolute;
                left: 13px; top: 50%;
                transform: translateY(-50%);
                width: 15px; height: 15px;
                stroke: rgba(245,240,232,0.28);
                fill: none; stroke-width: 1.5;
                pointer-events: none;
                transition: stroke 0.2s;
            }

            input[type="text"],
            input[type="email"],
            input[type="password"] {
                width: 100%;
                padding: 12px 12px 12px 40px;
                background: rgba(255,255,255,0.06);
                border: 1px solid rgba(201,168,76,0.2);
                border-radius: 3px;
                color: var(--cream);
                font-family: 'Jost', sans-serif;
                font-size: 0.88rem;
                font-weight: 300;
                outline: none;
                transition: border-color 0.25s, background 0.25s, box-shadow 0.25s;
            }
            input:focus {
                border-color: var(--gold);
                background: rgba(201,168,76,0.06);
                box-shadow: 0 0 0 3px rgba(201,168,76,0.08);
            }
            input::placeholder { color: rgba(245,240,232,0.22); }

            /* password strength bar */
            .strength-bar {
                display: flex; gap: 4px; margin-top: 6px;
            }
            .strength-bar span {
                flex: 1; height: 2px; border-radius: 2px;
                background: rgba(255,255,255,0.1);
                transition: background 0.3s;
            }
            .strength-bar.weak   span:nth-child(1)                { background: #e57373; }
            .strength-bar.medium span:nth-child(1),
            .strength-bar.medium span:nth-child(2)                { background: var(--gold); }
            .strength-bar.strong span                              { background: #4caf75; }

            /* inline validation icon */
            .valid-icon {
                position: absolute;
                right: 12px; top: 50%;
                transform: translateY(-50%);
                font-size: 0.75rem;
                opacity: 0;
                transition: opacity 0.2s;
            }
            .valid-icon.show { opacity: 1; }

            /* ── Error ── */
            .error-msg {
                background: rgba(180,50,50,0.18);
                border: 1px solid rgba(220,80,80,0.3);
                border-radius: 3px;
                padding: 10px 14px;
                margin-bottom: 18px;
                font-size: 0.78rem;
                color: var(--error-color);
                letter-spacing: 0.04em;
                display: none;
            }

            /* ── Submit ── */
            .btn-submit {
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
                margin-top: 6px;
                transition: border-color 0.3s, box-shadow 0.3s, transform 0.15s;
            }
            .btn-submit:hover {
                border-color: var(--gold);
                box-shadow: 0 4px 24px rgba(46,107,71,0.45);
                transform: translateY(-1px);
            }
            .btn-submit:active { transform: translateY(0); }

            /* ── Login link ── */
            .login-link {
                text-align: center;
                margin-top: 22px;
                font-size: 0.72rem;
                color: rgba(245,240,232,0.35);
                letter-spacing: 0.06em;
            }
            .login-link a {
                color: var(--gold);
                text-decoration: none;
                margin-left: 4px;
            }
            .login-link a:hover { opacity: 0.75; }
        </style>
    </head>
    <body>
        <div class="bg"></div>

        <div class="card">
            <!-- Header -->
            <div class="logo-wrap">
                <div class="logo-icon">
                    <svg viewBox="0 0 24 24"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M19 8v6M22 11h-6"/></svg>
                </div>
                <h2>Đăng Ký</h2>
                <p class="subtitle">Tạo tài khoản mới</p>
            </div>

            <div class="divider"><span></span><i>✦</i><span></span></div>

            <%-- Error from RegisterServlet --%>
            <%
                String errorMsg = (String) request.getAttribute("errorMsg");
                if (errorMsg == null) errorMsg = request.getParameter("error");
            %>
            <% if (errorMsg != null && !errorMsg.isEmpty()) { %>
                <div class="error-msg" style="display:block;"><%= errorMsg %></div>
            <% } %>

            <form action="RegisterServlet" method="post">
                <div class="grid-2">

                    <!-- Họ và tên (full width) -->
                    <div class="field field-full">
                        <label for="fullname">Họ và tên</label>
                        <div class="input-wrap">
                            <input type="text" id="fullname" name="fullname" placeholder="Nguyễn Văn A" autocomplete="name" required>
                            <svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                        </div>
                    </div>

                    <!-- Email (full width) -->
                    <div class="field field-full">
                        <label for="email">Email</label>
                        <div class="input-wrap">
                            <input type="email" id="email" name="email" placeholder="you@example.com" autocomplete="email" required>
                            <svg viewBox="0 0 24 24"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="M2 7l10 7 10-7"/></svg>
                        </div>
                    </div>

                    <!-- Mật khẩu -->
                    <div class="field">
                        <label for="password">Mật khẩu</label>
                        <div class="input-wrap">
                            <input type="password" id="password" name="password" placeholder="••••••••" autocomplete="new-password" required oninput="checkStrength(this.value)">
                            <svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                        </div>
                        <div class="strength-bar" id="strengthBar">
                            <span></span><span></span><span></span>
                        </div>
                    </div>

                    <!-- Nhập lại mật khẩu -->
                    <div class="field">
                        <label for="repassword">Nhập lại</label>
                        <div class="input-wrap">
                            <input type="password" id="repassword" name="repassword" placeholder="••••••••" autocomplete="new-password" required oninput="checkMatch()">
                            <svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                            <span class="valid-icon" id="matchIcon"></span>
                        </div>
                    </div>

                </div>

                <button type="submit" class="btn-submit">Tạo tài khoản</button>
            </form>

            <p class="login-link">Đã có tài khoản?<a href="login.jsp">Đăng nhập</a></p>
        </div>

        <script>
            function checkStrength(val) {
                const bar = document.getElementById('strengthBar');
                bar.className = 'strength-bar';
                if (val.length === 0) return;
                if (val.length < 6)                              bar.classList.add('weak');
                else if (val.length < 10 || !/\d/.test(val))    bar.classList.add('medium');
                else                                             bar.classList.add('strong');
            }

            function checkMatch() {
                const pw  = document.getElementById('password').value;
                const rpw = document.getElementById('repassword').value;
                const icon = document.getElementById('matchIcon');
                if (rpw.length === 0) { icon.textContent = ''; icon.classList.remove('show'); return; }
                icon.textContent   = pw === rpw ? '✓' : '✗';
                icon.style.color   = pw === rpw ? '#4caf75' : '#e57373';
                icon.classList.add('show');
            }
        </script>
    </body>
</html>
