<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <script>
      function login() {
        let id = document.getElementById("id").value;
        let password = document.getElementById("password").value;
        fetch('${root}/user/login', {
          method: "POST",
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ email: id, password: password })
        })
          .then((response) => {
            if (response.status != 200) {
              alert("로그인 실패");
            }
            return response.json();
          })
          .then((data) => {
            sessionStorage.setItem("email", id);
            sessionStorage.setItem("password", password);
            sessionStorage.setItem("age", data.age);
            sessionStorage.setItem("nickname", data.nickname);
            alert("로그인 성공")
            location.reload();
          });
      }

      function joinUser() {
        let id = document.getElementById("joinEmail").value;
        let password = document.getElementById("joinPassWord").value;
        let nickname = document.getElementById("joinMemberName").value;
        let age = document.getElementById("joinage").value;
        fetch('${root}/user', {
          method: "POST",
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ email: id, password: password, nickname: nickname, age: age })
        })
          .then((response) => {
            if (response.status == 200) {
              alert("회원가입 성공")
            } else {
              alert("회원가입 실패")
            }
          });
      }

      function deleteBoard() {
        let id = document.getElementById("boardModalId").value;
        fetch(`${root}/board/\${id}`, {
          method: "DELETE",
          headers: {
            'Content-Type': 'application/json',
          }
        })
          .then((response) => {
            return response.json();
          })
          .then((data) => {
            alert("게시물이 삭제되었습니다.");
            window.location.replace("http://localhost:8080/sample-inner-page");
          });
      }

      function editBoard() {
        let id = document.getElementById("boardModalId").value;
        let boardModalTitle = document.getElementById("boardModalTitle").innerHTML;
        let boardModalContent = document.getElementById("boardModalContent").value;
        fetch(`${root}/board`, {
          method: "PUT",
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ id: id, title: boardModalTitle, content: boardModalContent })
        })
          .then((response) => {
            return response.json();
          })
          .then((data) => {
            alert("게시물이 수정되었습니다.");
            window.location.replace("http://localhost:8080/sample-inner-page");
          });
      }
    </script>

    <!-- Start modal -->
    <!-- The loginModal -->
    <div class="modal" id="loginModal">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">로그인</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <form>
              <div class="form-floating mb-3">
                <input class="form-control" type="text" id="id" placeholder="ID" name="id" value="ssadol@gmail.com" />
                <label class="form-label" for="id">ID</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" type="password" id="password" name="password" placeholder="PASSWORD"
                  value="1234" />
                <label class="form-label" for="PassWord">password</label>
              </div>
              <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal" id="login_check"
                onclick="login()">
                로그인
              </button>
              <button class="btn btn-outline-success" type="reset" data-bs-toggle="modal" id="Join"
                data-bs-target="#JoinModal"> 회원가입 </button>
            </form>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>

    <!-- The JoinModal -->
    <div class="modal" id="JoinModal">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">회원가입</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <form>
              <div class="form-floating mb-3">
                <input class="form-control" type="text" id="joinMemberName" placeholder="MEMBERNAME"
                  name="joinMemberName" value="a" />
                <label class="form-label" for="MemberName">Name</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" type="password" id="joinPassWord" placeholder="PASSWORD" name="joinPassWord"
                  value="a" />
                <label class="form-label" for="PassWord">password</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" type="password" id="joinCheckPassWord" placeholder="CHECKPASSWORD"
                  name="joinCheckPassWord" value="a" />
                <label class="form-label" for="CheckPassWord">password 확인</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" type="email" id="joinEmail" placeholder="EMAIL" name="joinEmail"
                  value="a@a" />
                <label class="form-label" for="email">E-mail</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" type="number" id="joinage" placeholder="AGE" name="joinage" value="1" />
                <label class="form-label" for="age">age</label>
              </div>
              <button class="btn btn-outline-success" type="button" data-bs-dismiss="modal" id="login-check"
                onclick="joinUser()">
                회원가입
              </button>
              <input class="btn btn-outline-danger" type="reset" data-bs-dismiss="modal" id="Join" onclick=""
                value="취소">
            </form>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            </button>
          </div>
        </div>
      </div>
    </div>


    <!-- The loginModal -->
    <div class="modal" id="boardModal">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">핫플레이스!</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <form>
              <input hidden id="boardModalId">
              <h3 id="boardModalTitle">제목</h3>
              <input class="form-floating mb-3" id="boardModalContent" style="width: 100%;">
              </input>
            </form>
          </div>
          <button class="btn btn-outline-success" type="button" data-bs-dismiss="modal" onclick="editBoard()">
            수정
          </button>
          <button class="btn btn-outline-danger" type="button" data-bs-dismiss="modal" onclick="deleteBoard()">
            삭제
          </button>

          <!-- Modal footer -->
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>
    <!-- End modal -->