<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="assets/css/member_edit.css" />
    <title>Member</title>
  </head>
  
  <body>
    <!-- ======= Header ======= -->
  <%@ include file="/include/header.jsp" %>
    <!-- End Header -->

    <div class="container rounded bg-white mt-5 mb-5">
      <div class="row">
        <div class="col-md-3 border-right">
          <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            <img
              class="rounded-circle mt-5"
              width="150px"
              src="https://img.icons8.com/bubbles/100/000000/user.png"
            /><span class="font-weight-bold">${userinfo.name}</span><span class="text-black-50">${userinfo.email}</span
            ><span> </span>
          </div>
        </div>
        <div class="col-md-5 border-right">
          <div class="p-3 py-5">
            <div class="d-flex justify-content-between align-items-center mb-3">
              <h4 class="text-right">회원정보 설정</h4>
            </div>
            <form action="${root}/main" name="login-form" method="post">
            <input type="hidden" name="action" value="modify">
            <div class="row mt-2">
              <div class="col-md-12">
                <label class="labels">이름</label
                ><input type="text" class="form-control" placeholder="김싸피" name="name" id="name" value="${userinfo.name}" />
              </div>
              <!-- <div class="col-md-6">
                <label class="labels">Surname</label
                ><input type="text" class="form-control" value="" placeholder="surname" />
              </div> -->
            </div>
            <div class="row mt-3">
              <div class="col-md-12">
                <label class="labels">핸드폰 번호</label
                ><input type="text" class="form-control" placeholder="010-1234-5678" value="" />
              </div>
              <div class="col-md-12">
                <label class="labels">주소</label
                ><input type="text" class="form-control" placeholder="강남구 역삼동" value="" />
              </div>
              <div class="col-md-12">
                <label class="labels">이메일</label
                ><input type="email" class="form-control" placeholder="kimSsafy@ssafy.com" name="email" id="email" value="${userinfo.email}" />
              </div>
              <div class="col-md-12">
                <label class="labels">직업</label
                ><input type="text" class="form-control" placeholder="여행가" value="" />
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-md-12">
                <label class="labels">나라</label
                ><input type="text" class="form-control" placeholder="대한민국" value="" />
              </div>
            </div>
            <div class="row">
	          <button class="btn btn-primary profile-button" type="submit" name="modify" id="modify">저장</button>
            </div>
            </form>
            
	         <form action="${root}/main" name="login-form" method="post" style="width:">
            <div class="row">
	           <input type="hidden" name="action" value="delete">
	           <button class="btn btn-primary profile-button" type="submit" name="delete" id="delete">회원 탈퇴</button>
            </div>
	         </form>
          </div>
        </div>
        
        <div class="col-md-4">
          <div class="p-3 py-5">
            <div class="d-flex justify-content-between align-items-center experience">
              <span>자기 소개</span
              ><span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;나의 여행</span>
            </div>
            <br />
            <div class="col-md-12">
              <label class="labels">한줄 소개</label>
              <input
                type="text"
                class="form-control"
                placeholder="안녕하세요 여행을 좋아하는 김싸피입니다."
                value=""
              />
            </div>
            <br />
            <div class="col-md-12">
              <label class="labels">추가 사항</label
              ><input type="text" class="form-control" placeholder="자유여행 선호" value="" />
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- ======= Footer ======= -->
  <%@ include file="/include/footer.jsp" %>
    <!-- End Footer -->

    <!-- ======= Start modal ======= -->
  <%@ include file="/include/modal.jsp" %>
    <!-- End modal -->


    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
    <script src="assets/js/memberCTRL.js"></script>
  </body>
</html>
