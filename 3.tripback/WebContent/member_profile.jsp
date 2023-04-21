<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="./assets/img/favicon.ico" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
    <script src="./assets/js/key.js"></script>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css"
    />
    <link rel="stylesheet" href="assets/css/member_profile.css" />
    <title>Document</title>
  </head>
  <body>

    <!-- ======= Header ======= -->
  <%@ include file="/include/header.jsp" %>
    <!-- End Header -->

    <div class="page-content page-container" id="page-content">
      <div class="padding d-flex justify-content-center align-items-center">
        <div class="row container d-flex justify-content-center">
          <div class="col-xl-12 col-md-12">
            <div class="card user-card-full">
              <div class="row m-l-0 m-r-0">
                <div class="col-sm-4 bg-c-lite-green user-profile">
                  <div class="card-block text-center text-white">
                    <div class="m-b-25">
                      <img
                        src="https://img.icons8.com/bubbles/100/000000/user.png"
                        class="img-radius"
                        alt="User-Profile-Image"
                      />
                    </div>
                    <h6 class="f-w-600">${userinfo.name}</h6>
                    <p>yo</p>
                    <i class="mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                    <div class="mt-5 text-center">
                      <button
                        class="btn btn-primary profile-button"
                        type="button"
                        onclick="location.href='${root}/member_edit.jsp'"
                      >
                        수정
                      </button>
                    </div>
                  </div>
                </div>
                <div class="col-sm-8">
                  <div class="card-block">
                    <h6 class="m-b-20 p-b-5 b-b-default f-w-600">회원 정보</h6>
                    <div class="row">
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">이메일</p>
                        <h6 class="text-muted f-w-400">${userinfo.email}</h6>
                      </div>
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">핸드폰 번호</p>
                        <h6 class="text-muted f-w-400">010-1234-5678</h6>
                      </div>
                    </div>
                    <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">지역</h6>
                    <div class="row">
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">나라</p>
                        <h6 class="text-muted f-w-400">대한민국</h6>
                      </div>
                      <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">최근 여행지</p>
                        <h6 class="text-muted f-w-400">이탈리아</h6>
                      </div>
                    </div>
                    <ul class="social-link list-unstyled m-t-40 m-b-10">
                      <li>
                        <a
                          href="#!"
                          data-toggle="tooltip"
                          data-placement="bottom"
                          title=""
                          data-original-title="facebook"
                          data-abc="true"
                          ><i class="mdi mdi-facebook feather icon-facebook facebook" aria-hidden="true"></i
                        ></a>
                      </li>
                      <li>
                        <a
                          href="#!"
                          data-toggle="tooltip"
                          data-placement="bottom"
                          title=""
                          data-original-title="twitter"
                          data-abc="true"
                          ><i class="mdi mdi-twitter feather icon-twitter twitter" aria-hidden="true"></i
                        ></a>
                      </li>
                      <li>
                        <a
                          href="#!"
                          data-toggle="tooltip"
                          data-placement="bottom"
                          title=""
                          data-original-title="instagram"
                          data-abc="true"
                          ><i class="mdi mdi-instagram feather icon-instagram instagram" aria-hidden="true"></i
                        ></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/memberCTRL.js"></script>
  </body>
</html>