
// 로그인
function login() {
  // 사용자 정보를 입력받는다.\
  var userid = document.getElementById('id').value;
  if (userid.length == 0) {
    alert("아이디를 입력하세요");
    return;
  }
  var userpass = document.getElementById("PassWord").value;
  if (userpass.length == 0) {
    alert("비밀번호를 입력하세요");
    return;
  }
  if (userid == "ssafy" && userpass == "1234") {
    document.querySelector("#header_nav_confirm_off").style.display = "";
    document.querySelector("#header_nav_confirm_on").style.display = "none";
  } else {
    alert(userid + " " + userpass + "아이디 또는 비밀번호 확인해주세요");
  }
}

// 로그아웃
function logout() {
  document.querySelector("#header_nav_confirm_on").setAttribute("style", "display: ");
  document.querySelector("#header_nav_confirm_off").setAttribute("style", "display: none");
}