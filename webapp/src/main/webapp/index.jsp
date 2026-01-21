<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>DevOps Learning Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
* {
  box-sizing: border-box;
  font-family: "Segoe UI", sans-serif;
}

body {
  min-height: 100vh;
  background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
  color: #fff;
}

.card {
  background: #111;
  width: 100%;
  max-width: 450px;
  padding: 30px;
  border-radius: 14px;
  box-shadow: 0 20px 40px rgba(0,0,0,0.6);
  animation: fadeIn 0.8s ease;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

h1 {
  text-align: center;
  margin-bottom: 8px;
}

.sub {
  text-align: center;
  font-size: 0.85rem;
  color: #aaa;
  margin-bottom: 22px;
}

.field {
  position: relative;
  margin-bottom: 18px;
}

.field input {
  width: 100%;
  padding: 14px 12px;
  border-radius: 8px;
  border: 1px solid #333;
  background: #1a1a1a;
  color: #fff;
  outline: none;
}

.field label {
  position: absolute;
  top: 50%;
  left: 12px;
  transform: translateY(-50%);
  color: #777;
  font-size: 0.8rem;
  pointer-events: none;
  transition: 0.3s;
  background: #111;
  padding: 0 6px;
}

.field input:focus + label,
.field input:not(:placeholder-shown) + label {
  top: -6px;
  font-size: 0.7rem;
  color: #00e0ff;
}

button {
  width: 100%;
  padding: 14px;
  border-radius: 8px;
  border: none;
  background: linear-gradient(135deg, #00e0ff, #00ff9c);
  font-weight: bold;
  cursor: pointer;
  margin-top: 10px;
}

button:hover {
  box-shadow: 0 10px 20px rgba(0,255,200,0.3);
}

.strength {
  font-size: 0.75rem;
  margin-top: 5px;
}

.footer {
  text-align: center;
  margin-top: 15px;
  font-size: 0.8rem;
  color: #aaa;
}

.footer a {
  color: #00e0ff;
  text-decoration: none;
}

.success {
  text-align: center;
  color: #00ff9c;
}
</style>
</head>

<body>

<div class="card">

<%
  String submitted = request.getParameter("submit");
  if (submitted == null) {
%>

  <h1>DevOps Learning Registration</h1>
  <p class="sub">New user signup by <b>Toji Zenin</b></p>

  <form method="post">

    <div class="field">
      <input type="text" name="name" required placeholder=" ">
      <label>Full Name</label>
    </div>

    <div class="field">
      <input type="tel" name="mobile" pattern="[0-9]{10}" required placeholder=" ">
      <label>Mobile Number</label>
    </div>

    <div class="field">
      <input type="email" name="email" required placeholder=" ">
      <label>Email Address</label>
    </div>

    <div class="field">
      <input type="password" id="password" name="password" required placeholder=" ">
      <label>Password</label>
      <div id="strength" class="strength"></div>
    </div>

    <div class="field">
      <input type="password" name="confirm" required placeholder=" ">
      <label>Repeat Password</label>
    </div>

    <button type="submit" name="submit">Register</button>
  </form>

  <div class="footer">
    Already have an account? <a href="#">Sign in</a>
  </div>

<%
  } else {
    String name = request.getParameter("name");
%>

  <div class="success">
    <h1>Registration Successful 🎉</h1>
    <h2>Welcome, <%= name %></h2>
    <p>Thank you & Happy DevOps Learning 🚀</p>
  </div>

<%
  }
%>

</div>

<script>
const password = document.getElementById("password");
const strength = document.getElementById("strength");

if (password) {
  password.addEventListener("keyup", () => {
    const val = password.value;
    if (val.length < 6) {
      strength.textContent = "Weak password";
      strength.style.color = "#ff4d4d";
    } else if (/[A-Z]/.test(val) && /[0-9]/.test(val)) {
      strength.textContent = "Strong password";
      strength.style.color = "#00ff9c";
    } else {
      strength.textContent = "Medium password";
      strength.style.color = "#ffc107";
    }
  });
}
</script>

</body>
</html>
