<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/postWrite.css">
    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet" />
    <title>Docum ent</title>
  </head>

  <body>
    <!-- ======= Header ======= -->
    <%@ include file="include/header.jsp" %>
      <!-- End Header -->

      <main id="main">
        <nav id="wr">
          <h1>핫플 공유</h1>
        </nav>
        <div class="row justify-content-center">
          <div class="col-lg-8 col-md-10 col-sm-12">
            <h2 class="my-3 py-3 shadow-sm bg-light text-center">
              <mark class="sky">글목록</mark>
            </h2>
          </div>
          <div class="col-lg-8 col-md-10 col-sm-12">
            <div class="row align-self-center mb-2">
              <div class="col-md-9 offset-3">
                <form class="d-flex" id="form-search" action="">
                  <input type="hidden" name="pgno" value="1"/>
                  <select
                    name="key"
                    id="key"
                    class="form-select form-select-sm ms-5 me-1 w-50"
                    aria-label="검색조건"
                  >
                    <option selected>검색조건</option>
                    <option value="name">여행지명</option>
                    <option value="id">여행지 코드(id)</option>
                  </select>
                  <div class="input-group input-group-sm">
                    <input type="text" name="word" id="word" class="form-control" placeholder="검색어..." />
                    <button id="btn-search" class="btn btn-dark" type="button">검색</button>
                  </div>
                </form>
              </div>
            </div>
            <table class="table table-hover">
              <thead>
                <tr class="text-center">
                  <th scope="col">글번호</th>
                  <th scope="col">제목</th>
                  <th scope="col">운영시간</th>
                </tr>
              </thead>
              <tbody>    
                <c:forEach var="attraction" items="${attractions}">    
                  <tr class="text-center">
                    <th scope="row">${attraction.id}</th>
                    <td class="text-start">
                      <a
                        href="#"
                        class="attraction-title link-dark"
                        data-no="${attraction.id}"
                        style="text-decoration: none"
                      >
                        ${attraction.name}
                      </a>
                    </td>
                    <td>${attraction.buissnessHours}</td>
                  </tr>            
                </c:forEach>   
              </tbody>
            </table>
          </div>
          <div class="row">
            ${navigation.navigator}
          </div>

        <form id="newQuote">
          <label for="author">제목</label>
          <input type="text" id="title" />
          <label for="comment">내용</label>
          <textarea name="content" id="content" cols="20" rows="10"></textarea>
          <div id="writeButton">
            <div><input type="button" value="글쓰기" id="submit" onclick="postWrite()" /></div>
            <div><input type="reset" value="내용 지우기" id="reset"></div>
          </div>
        </form>

        <div class="listed-comments">
        </div>
      </div>
      <form id="form-param" method="get" action="">
        <input type="hidden" name="pgno" id="pgno" value="${pgno}">
        <input type="hidden" name="key" value="${key}">
        <input type="hidden" name="word" value="${word}">
      </form>
      <form id="form-no-param" method="get" action="${root}/attraction/view">
        <input type="hidden" name="pgno" value="${pgno}">
        <input type="hidden" name="key" value="${key}">
        <input type="hidden" name="word" value="${word}">
        <input type="hidden" id="attractionno" name="attractionno" value="">
      </form>

      <!-- <form id="newQuote">
        <label for="author">제목</label>
        <input type="text" id="author" />
        <label for="comment">내용</label>
        <textarea name="comment" id="comment" cols="20" rows="10"></textarea>
        <div id="writeButton">
          <div><input type="submit" value="글쓰기" id="submit" /></div>
          <div><input type="reset" value="내용 지우기" id="reset"></div>
        </div>
      </form>
      <div class="listed-comments">
      </div> -->
    </main>
        
    <!-- ======= Footer ======= -->
    <%@ include file="include/footer.jsp" %>
    <!-- End Footer -->

    <!-- ======= Start modal ======= -->
    <%@ include file="include/modal.jsp" %>
    <!-- End modal -->

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

    <script>
      let titles = document.querySelectorAll(".attraction-title");
      titles.forEach(function (title) {
        title.addEventListener("click", function () {
          document.querySelector("#attractionno").value = this.getAttribute("data-no");
          document.querySelector("#form-no-param").submit();
        });
      });

      // document.querySelector("#btn-mv-register").addEventListener("click", function () {
    	//   let form = document.querySelector("#form-param");
      //     form.setAttribute("action", "${root}/attraction/write");
      //     form.submit();
      // });
      
      document.querySelector("#btn-search").addEventListener("click", function () {
    	  let form = document.querySelector("#form-search");
          form.setAttribute("action", "${root}/attraction/list");
          form.submit();
      });
      
      let pages = document.querySelectorAll(".page-link");
      pages.forEach(function (page) {
        page.addEventListener("click", function () {
       	  document.querySelector("#pgno").value = this.parentNode.getAttribute("data-pg");
          let form = document.querySelector("#form-param");
          form.setAttribute("action", "${root}/attraction/list");
          form.submit();
        });
      });
    </script>
  </body>
  <script>
    function postWrite() {
      let userEmail = sessionStorage.getItem("email");
      let nickName = sessionStorage.getItem("nickname");
      let title = document.getElementById("title").value;
      let content = document.getElementById("content").value;
      let boardCategoryId = 1;
      fetch('${root}/board', {
        method: "POST",
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ userEmail: userEmail, title: title, content: content, boardCategoryId: boardCategoryId })
      })
        .then((response) => {
          if (response.status != 200) {
            alert(`\${nickName}님의 게시물이 공유에 실패했습니다.`);
          } else {
            alert(`\${nickName}님의 게시물이 공유되었습니다.`);
            window.location.replace("http://localhost:8080/sample-inner-page");
          }
        })
    }
  </script>

  </html>