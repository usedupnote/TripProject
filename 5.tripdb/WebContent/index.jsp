<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/include/header.jsp" %>
  </head>
  <body>
    <%@ include file="/include/nav.jsp" %>
    <header class="masthead">
      <div class="container">
        <a class="btn btn-secondary btn-xl rounded-5 w-100 text-center" href="./tripList.jsp">
          <i class="bi bi-search"></i> 어디든지 언제든지
        </a>
      </div>
    </header>
    <!-- Portfolio Grid-->
    <section class="page-section bg-light" id="portfolio">
      <div class="container">
        <div class="text-center">
          <h2 class="section-heading text-uppercase">지금 가장 핫한🔥 여행지</h2>
          <h3 class="section-subheading text-muted">여행 후기를 통해 찾아보세요</h3>
        </div>
        <a class="btn btn-outline-warning d-inline float-end mb-3" href="board.jsp">후기 더보기</a>
        <div class="row" style="clear: both">
          <div class="col-lg-4 col-sm-6 mb-4">
            <!-- Portfolio item 1-->
            <div class="portfolio-item">
              <a class="portfolio-link" href="view.jsp">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="bi bi-plus-lg fs-1"></i></div>
                </div>
                <img class="img-fluid" src="./assets/img/reveiw1.jpg" alt="미국 국립공원" />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading">자연과 함께</div>
                <div class="portfolio-caption-subheading text-muted">미국 아치스 국립공원</div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-sm-6 mb-4">
            <!-- Portfolio item 2-->
            <div class="portfolio-item">
              <a class="portfolio-link" href="view.jsp">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="bi bi-plus-lg fs-1"></i></div>
                </div>
                <img class="img-fluid" src="./assets/img/reveiw2.jpg" alt="알래스카" />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading">알래스카</div>
                <div class="portfolio-caption-subheading text-muted">알래스카 스노우 캡 마운틴</div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-sm-6 mb-4">
            <!-- Portfolio item 3-->
            <div class="portfolio-item">
              <a class="portfolio-link" href="view.jsp">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="bi bi-plus-lg fs-1"></i></div>
                </div>
                <img class="img-fluid" src="./assets/img/reveiw3.jpg" alt="한국 용인" />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading">환상의 나라</div>
                <div class="portfolio-caption-subheading text-muted">에버랜드</div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-sm-6 mb-4">
            <!-- Portfolio item 1-->
            <div class="portfolio-item">
              <a class="portfolio-link" href="view.jsp">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="bi bi-plus-lg fs-1"></i></div>
                </div>
                <img class="img-fluid" src="./assets/img/reveiw1.jpg" alt="미국 국립공원" />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading">자연과 함께</div>
                <div class="portfolio-caption-subheading text-muted">미국 아치스 국립공원</div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-sm-6 mb-4">
            <!-- Portfolio item 2-->
            <div class="portfolio-item">
              <a class="portfolio-link" href="view.jsp">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="bi bi-plus-lg fs-1"></i></div>
                </div>
                <img class="img-fluid" src="./assets/img/reveiw2.jpg" alt="알래스카" />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading">알래스카</div>
                <div class="portfolio-caption-subheading text-muted">스노우 캡 마운틴</div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-sm-6 mb-4">
            <!-- Portfolio item 3-->
            <div class="portfolio-item">
              <a class="portfolio-link" href="view.jsp">
                <div class="portfolio-hover">
                  <div class="portfolio-hover-content"><i class="bi bi-plus-lg fs-1"></i></div>
                </div>
                <img class="img-fluid" src="./assets/img/reveiw3.jpg" alt="한국 용인" />
              </a>
              <div class="portfolio-caption">
                <div class="portfolio-caption-heading">환상의 나라</div>
                <div class="portfolio-caption-subheading text-muted">에버랜드</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <%@ include file="/include/footer.jsp" %>
  </body>
</html>
