<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>DevOps Platform | Auth</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
:root{
  --neon:#00f5ff;
  --green:#00ff9c;
  --danger:#ff4d4d;
  --glass:rgba(255,255,255,0.08);
}

*{box-sizing:border-box;font-family:"Segoe UI",system-ui;}

body{
  margin:0;
  min-height:100vh;
  overflow:hidden;
  color:#fff;
}

/* ===== BACKGROUND ===== */
.bg video,
.bg img{
  position:fixed;
  inset:0;
  width:100%;
  height:100%;
  object-fit:cover;
  z-index:-2;
}
.overlay{
  position:fixed;
  inset:0;
  background:rgba(5,8,12,.75);
  z-index:-1;
}

/* ===== APP CARD ===== */
.app{
  max-width:480px;
  margin:40px auto;
  padding:30px;
  border-radius:22px;
  background:var(--glass);
  backdrop-filter:blur(18px);
  box-shadow:0 40px 100px rgba(0,0,0,.8);
  animation:floatIn .9s ease;
}

@keyframes floatIn{
  from{opacity:0;transform:translateY(40px) scale(.96)}
  to{opacity:1;transform:none}
}

/* ===== HEADER ===== */
.header{text-align:center;margin-bottom:20px;}
.header h1{
  margin:0;
  font-size:1.7rem;
  background:linear-gradient(90deg,var(--neon),var(--green));
  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
}
.header p{font-size:.8rem;color:#9aa3ad}

/* ===== TOGGLE ===== */
.toggle{
  display:flex;
  background:#111;
  border-radius:14px;
  overflow:hidden;
  margin-bottom:25px;
}
.toggle button{
  flex:1;
  padding:12px;
  border:none;
  background:none;
  color:#aaa;
  cursor:pointer;
  font-weight:600;
}
.toggle .active{
  background:linear-gradient(135deg,var(--neon),var(--green));
  color:#000;
}

/* ===== FORM ===== */
.form{display:none;}
.form.active{display:block;}

.field{
  position:relative;
  margin-bottom:18px;
}
.field input{
  width:100%;
  padding:15px;
  border-radius:14px;
  border:1px solid #222;
  background:rgba(0,0,0,.45);
  color:#fff;
  outline:none;
}
.field label{
  position:absolute;
  top:50%;
  left:15px;
  transform:translateY(-50%);
  font-size:.75rem;
  color:#888;
  pointer-events:none;
  transition:.3s;
  background:#0b0f14;
  padding:0 6px;
}
.field input:focus+label,
.field input:not(:placeholder-shown)+label{
  top:-6px;
  color:var(--neon);
}

/* ===== WARNINGS ===== */
.warn{
  font-size:.72rem;
  color:var(--danger);
  margin-top:4px;
  display:none;
}
.shake{
  animation:shake .4s;
}
@keyframes shake{
  25%{transform:translateX(-5px)}
  50%{transform:translateX(5px)}
  75%{transform:translateX(-5px)}
}

/* ===== PASSWORD METER ===== */
.meter{
  height:6px;
  background:#222;
  border-radius:10px;
  margin-top:8px;
  overflow:hidden;
}
.meter span{
  display:block;
  height:100%;
  width:0;
  transition:.4s;
}

/* ===== BUTTON ===== */
button.submit{
  width:100%;
  padding:15px;
  border:none;
  border-radius:16px;
  background:linear-gradient(135deg,var(--neon),var(--green));
  font-weight:700;
  cursor:pointer;
  box-shadow:0 20px 40px rgba(0,255,200,.25);
}
.footer{text-align:center;font-size:.75rem;color:#888;margin-top:15px}
.success{text-align:center;color:var(--green)}
</style>
</head>

<body>

<!-- ===== BACKGROUND ===== -->
<div class="bg">
  <!-- If video fails, image still visible -->
  <video autoplay muted loop>
    <source src="https://cdn.coverr.co/videos/coverr-server-room-technology-3969/1080p.mp4" type="video/mp4">
  </video>
  <img src="https://images.unsplash.com/photo-1518770660439-4636190af475" />
</div>
<div class="overlay"></div>

<div class="app">

<%
String submit=request.getParameter("submit");
if(submit==null){
%>

<div class="header">
  <h1>DevOps Platform</h1>
  <p>CI/CD · Cloud · Automation</p>
</div>

<div class="toggle">
  <button id="loginBtn" class="active" onclick="showForm('login')">Login</button>
  <button id="regBtn" onclick="showForm('register')">Register</button>
</div>

<!-- ===== LOGIN ===== -->
<div id="login" class="form active">
  <div class="field">
    <input type="email" placeholder=" ">
    <label>📧 Email</label>
  </div>
  <div class="field">
    <input type="password" placeholder=" ">
    <label>🔐 Password</label>
  </div>
  <button class="submit">Login</button>
</div>

<!-- ===== REGISTER ===== -->
<form method="post" id="register" class="form">
  <div class="field">
    <input type="text" name="name" placeholder=" ">
    <label>👤 Full Name</label>
    <div class="warn">Name is required</div>
  </div>

  <div class="field">
    <input type="tel" name="mobile" placeholder=" ">
    <label>📱 Mobile (10 digits)</label>
    <div class="warn">Invalid mobile number</div>
  </div>

  <div class="field">
    <input type="email" name="email" placeholder=" ">
    <label>📧 Email</label>
    <div class="warn">Invalid email</div>
  </div>

  <div class="field">
    <input type="password" id="pwd" placeholder=" ">
    <label>🔐 Password</label>
    <div class="meter"><span id="meter"></span></div>
  </div>

  <div class="field">
    <input type="password" id="cpwd" placeholder=" ">
    <label>🔁 Confirm Password</label>
    <div class="warn">Passwords do not match</div>
  </div>

  <button class="submit" name="submit">Create Account</button>
</form>

<div class="footer">
  Jenkins · Maven · Tomcat · AWS EC2
</div>

<%
}else{
String name=request.getParameter("name");
%>

<div class="success">
  <h2>Welcome <%=name%> 🎉</h2>
  <p>DevOps journey initialized 🚀</p>
</div>

<%}%>

</div>

<script>
function showForm(f){
  login.classList.remove("active");
  register.classList.remove("active");
  loginBtn.classList.remove("active");
  regBtn.classList.remove("active");
  document.getElementById(f).classList.add("active");
  document.getElementById(f+"Btn").classList.add("active");
}

/* Password strength */
pwd?.addEventListener("input",()=>{
  let v=pwd.value,m=meter;
  if(v.length<4){m.style.width="30%";m.style.background="#ff4d4d";}
  else if(/[A-Z]/.test(v)&&/[0-9]/.test(v)){
    m.style.width="100%";m.style.background="#00ff9c";
  }else{
    m.style.width="60%";m.style.background="#ffc107";
  }
});
</script>

</body>
</html>
