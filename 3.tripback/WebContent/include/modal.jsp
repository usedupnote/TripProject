<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
            <form action="${root}/main" name="login-form" method="post">
            <input type="hidden" name="action" value="login">
              <div class="form-floating mb-3">
                <input class="form-control" type="text" id="id" placeholder="ID" name="id" value="ssafy" />
                <label class="form-label" for="id">ID</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" type="password" id="PassWord" name="password" placeholder="PASSWORD" value="1234" />
                <label class="form-label" for="PassWord">password</label>
              </div>
           	  <input class="btn btn-outline-primary" type="submit" data-bs-dismiss="modal" id="login_check" onclick="" value="로그인">
              <button class="btn btn-outline-success" type="reset" data-bs-toggle="modal" id="Join" data-bs-target="#JoinModal"> 회원가입 </button>
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
            <form action="${root}/main" name="login-form" method="post">
            <input type="hidden" name="action" value="regist">
              <div class="form-floating mb-3">
                <input class="form-control" type="text" id="joinMemberName" placeholder="MEMBERNAME" name="joinMemberName" value="a"/>
                <label class="form-label" for="MemberName">Name</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" type="text" id="joinid" placeholder="ID" name="joinid" value="a"/>
                <label class="form-label" for="id">ID</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" type="password" id="joinPassWord" placeholder="PASSWORD" name="joinPassWord" value="a"/>
                <label class="form-label" for="PassWord">password</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" type="password" id="joinCheckPassWord" placeholder="CHECKPASSWORD" name="joinCheckPassWord" value="a"/>
                <label class="form-label" for="CheckPassWord">password 확인</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" type="email" id="joinEmail" placeholder="EMAIL" name="joinEmail" value="a@a"/>
                <label class="form-label" for="email">E-mail</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" type="number" id="joinage" placeholder="AGE" name="joinage" value="1"/>
                <label class="form-label" for="age">age</label>
              </div>
              <input class="btn btn-outline-success" type="submit" data-bs-dismiss="modal" id="login-check" onclick="" value="회원가입">
			  <input class="btn btn-outline-danger" type="reset" data-bs-dismiss="modal" id="Join" onclick="" value="취소">
            </form>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- End modal -->
    