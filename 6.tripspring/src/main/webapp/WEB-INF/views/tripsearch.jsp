<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trip Searcher</title>
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
  </head>

  <body>
    <!-- ======= Header ======= -->
    <%@ include file="include/header.jsp" %>
    <!-- End Header -->

    
    <main id="main">
      <nav id="wr">
        <h1>여행 정보 공유</h1>
      </nav>
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            <mark class="sky">여행지 목록</mark>
          </h2>
        </div>
        <div class="col-lg-8 col-md-10 col-sm-12" style="margin-top: 5%; margin-bottom: 5%;">
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
                <th scope="col">여행지명</th>
                <th scope="col">운영시간</th>
              </tr>
            </thead>
            <tbody id="table-content-trip">    
            </tbody>
          </table>
        </div>
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

  window.addEventListener("load", function () {
    let contentTableBody = document.getElementById("table-content-trip");
    fetch('${root}/attraction')
      .then((response) => {
        if (response.status != 200) {
        }
        return response.json();
      })
      .then((data) => {
        data.forEach(element => {
          let tr = document.createElement("tr");
          tr.setAttribute("class", "text-center");
          tr.innerHTML = `
          <th scope="row">\${element.id}</th>
                <td>\${element.name}</td>
                <td>\${element.buissnessHours}</td>`
          contentTableBody.appendChild(tr);
        });
      });
  });


  let searchBtn = document.getElementById("btn-search");
  searchBtn.addEventListener("click", function () {
    fetch('${root}/attraction/name/\${name}')
    .then((response) => {
      if (response.status != 200) {}
      return response.json();
    })
    .then((data) => {
      data.forEach(element => {
        let tr = document.createElement("tr");
        tr.setAttribute("class", "text-center");
        tr.innerHTML = `
        <th scope="row">\${element.id}</th>
              <td>\${element.name}</td>
              <td>\${element.buissnessHours}</td>`
        contentTableBody.appendChild(tr);
      });
    });
  });

    // document.querySelector("#btn-mv-register").addEventListener("click", function () {
    //   let form = document.querySelector("#form-param");
    //     form.setAttribute("action", "${root}/attraction/write");
    //     form.submit();
    // });

    
    // document.querySelector("#btn-search").addEventListener("click", function () {
    //   let form = document.querySelector("#form-search");
    //   if (form == null) {
    //     resultDiv.setAttribute("class", "mb-3 text-dark");
    //     resultDiv.textContent = "검색할 단어를 입력해주세요";
    //   } else {
    //     fetch("${root}/attraction/" + form)
    //     .then((response) => response.text())
    //     .then(data => {
    //     console.log(data);
    //       if(data != 0) {
    //           resultDiv.setAttribute("class", "mb-3 text-primary");
    //             resultDiv.textContent = form + "에 관한 관광지가 없습니다.";
    //       } else {
              

    //         // <c:forEach var="attraction" items="${attractions}">    
    //         //     <tr class="text-center">
    //         //       <th scope="row">${attraction.id}</th>
    //         //       <td class="text-start">
    //         //         <a
    //         //           href="#"
    //         //           class="attraction-title link-dark"
    //         //           data-no="${attraction.id}"
    //         //           style="text-decoration: none"
    //         //         >
    //         //           ${attraction.name}
    //         //         </a>
    //         //       </td>
    //         //       <td>${attraction.buissnessHours}</td>
    //         //     </tr>            
    //         //   </c:forEach>   
            
    //       }
    //     }
    //   }

    //     form.setAttribute("action", "${root}/attraction");
    //     form.submit();

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

</html>