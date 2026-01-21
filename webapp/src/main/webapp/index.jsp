<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>DevOps Learning | Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
:root {
  --neon: #00f5ff;
  --green: #00ff9c;
  --bg: #0b0f14;
  --glass: rgba(255,255,255,0.08);
}

* {
  box-sizing: border-box;
  font-family: "Segoe UI", system-ui;
}

body {
  min-height: 100vh;
  margin: 0;
  background:
    radial-gradient(circle at top, #112 0%, transparent 60%),
    linear-gradient(135deg, #05070a, #0b0f14);
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
}

/* ===== CARD ===== */
.app {
  width: 100%;
  max-width: 480px;
  padding: 30px;
  border-radius: 20px;
  background: var(--glass);
  backdrop-filter: blur(20px);
  box-shadow: 0 30px 80px rgba(0,0,0,0.8);
  animation: floatIn 1s ease;
}

@keyframes floatIn {
  from { opacity: 0; transform: translateY(40px) scale(0.96); }
  to   { opacity: 1; transform: translateY(0) scale(1); }
}

/* ===== HEADER ===== */
.header {
  text-align: center;
  margin-bottom: 25px;
}

.header h1 {
  margin: 0;
  font-size: 1.7rem;
  background: linear-gradient(90deg, var(--neon), var(--green));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.header p {
  font-size: 0.85rem;
  color: #9aa3ad;
}

/* ===== STEPS ===== */
.steps {
  display: flex;
  justify-content: space-between;
  margin-bottom: 25px;
}

.step {
  flex: 1;
  height: 4px;
  margin: 0 5px;
  background: #222;
  border-radius: 10px;
  overflow: hidden;
}

.step span {
  display: block;
  height: 100%;
  width: 0%;
  background: linear-gradient(90deg, var(--neon), var(--green));
  transition: 0.4s;
}

/* ===== FIELDS ===== */
.field {
  position: relative;
  margin-bottom: 18px;
}

.field input {
  width: 100%;
  padding: 15px 14px;
  background: rgba(0,0,0,0.4);
  border: 1px solid #222;
  border-radius: 12px;
  color: #fff;
  outline: none;
  font-size: 0.95rem;
}

.field label {
  position: absolute;
  left: 14px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 0.75rem;
  color: #888;
  pointer-events: none;
  transition: 0.3s;
  background: var(--bg);
  padding: 0 6px;
}

.field input:focus + label,
.field input:not(:placeholder-shown) + label {
  top: -6px;
  color: var(--neon);
}

/* ===== PASSWORD METER ===== */
.meter {
  height: 6px;
  border-radius: 10px;
  background: #222;
  margin-top: 8px;
  overflow: hidden;
}

.meter span {
  display: block;
  height: 100%;
  width: 0%;
  transition: 0.4s;
}

/* ===== BUTTON ===== */
button {
  width: 100%;
  padding: 15px;
  border-radius: 14px;
  border: none;
  background: linear-gradient(135deg, var(--neon), var(--green));
  color: #000;
  font-weight: 700;
  cursor: pointer;
  letter-spacing: 0.5px;
  box-shadow: 0 15px 30px rgba(0,255,200,0.25);
}

button:hover {
  transform: translateY(-2px);
}

/* ===== SUCCESS ===== */
.success {
  text-align: center;
  animation: pop 0.6s ease;
}

@keyframes pop {
  from { transform: scale(0.9); opacity: 0; }
  to   { transform: scale(1); opacity: 1; }
}

.success h2 {
  color: var(--green);
}

.footer {
  text-align: center;
  margin-top: 15px;
  font-size: 0.8rem;
  color: #888;
}
</style>
</head>

<body>

<div class="app">

<%
  String submit = request.getParameter("submit");
  if (submit == null) {
%>

  <div class="header">
    <h1>DevOps Learning</h1>
    <p>Interactive registration · by Toji Zenin</p>
  </div>

  <div class="steps">
    <div class="step"><span id="s1"></span></div>
    <div class="step"><span id="s2"></span></div>
    <div class="step"><span id="s3"></span></div>
  </div>

  <form method="post">

    <div class="field">
      <input type="text" name="name" required placeholder=" ">
      <label>👤 Full Name</label>
    </div>

    <div class="field">
      <input type="tel" name="mobile" pattern="[0-9]{10}" required placeholder=" ">
      <label>📱 Mobile Number</label>
    </div>

    <div class="field">
      <input type="email" name="email" required placeholder=" ">
      <label>📧 Email Address</label>
    </div>

    <div class="field">
      <input type="password" id="password" name="password" required placeholder=" ">
      <label>🔐 Password</label>
      <div class="meter"><span id="meter"></span></div>
    </div>

    <button type="submit" name="submit">🚀 Create DevOps Account</button>
  </form>

  <div class="footer">
    CI/CD ready · Tomcat · Jenkins · AWS EC2
  </div>

<%
  } else {
    String name = request.getParameter("name");
%>

  <div class="success">
    <h2>Welcome, <%= name %> 🎉</h2>
    <p>Your DevOps journey starts now.</p>
    <p>Happy Learning 🚀</p>
  </div>

<%
  }
%>

</div>

<script>
const password = document.getElementById("password");
const meter = document.getElementById("meter");
const s1 = document.getElementById("s1");
const s2 = document.getElementById("s2");
const s3 = document.getElementById("s3");

if (password) {
  password.addEventListener("input", () => {
    const v = password.value;
    if (v.length < 4) {
      meter.style.width = "30%";
      meter.style.background = "#ff4d4d";
      s1.style.width = "100%";
    } else if (/[A-Z]/.test(v) && /[0-9]/.test(v)) {
      meter.style.width = "100%";
      meter.style.background = "#00ff9c";
      s2.style.width = s3.style.width = "100%";
    } else {
      meter.style.width = "60%";
      meter.style.background = "#ffc107";
      s2.style.width = "100%";
    }
  });
}
</script>

</body>
</html>
