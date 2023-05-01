# ✈️ EnjoyTrip

![1 메인홈](https://user-images.githubusercontent.com/44824456/225885645-bd3d029f-0ca7-4eb4-b23d-a7b9d64dd937.JPG)

## 목차

1. 프로젝트 소개
2. 구현 기능

## 프로젝트 소개

공공 데이터 포탈의 국문 관광 정보 데이터를 활용해 여행을 주제로 지역 관광 소개 웹 프로젝트입니다.  
여행지에 관한 정보를 검색할 수 있고, 여행 후기 게시판을 통해 여행 가려는 곳의 정보를 얻을 수 있도록 하였습니다.

<br />

**기간** : 2023.04.14.

- front-end
- back-end

**인원** : 2명(front-end, back-end 모두 진행)

<br />

### 기술 스택

**front-end**  
<br />
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white"/>
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white"/>
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white"/>
<img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=white"/>

**back-end**  
<img src="https://img.shields.io/badge/mysql-4479A1?style=flat&logo=mysql&logoColor=white"/>

<p>Servlet JSP JSTL EL</p>

---

## 구현 기능 (Front-End)

### 회원가입 및 로그인 기능

![3 회원관리 페이지](https://user-images.githubusercontent.com/44824456/230768040-94bea3a3-016b-464d-9926-3b4fe7640c00.png)

- 네비게이션 바의 회원가입 버튼을 클릭 시 모달 창을 이용해 회원가입, 로그인 UI를 구현하였습니다.
- 자바스크립트를 이용해 각 입력 값이 유효한 값인지 확인 후 등록을 합니다.
- 정상적인 값이 입력 되었다면 DB에 입력한 회원의 정보를 저장합니다. <br />
  ![4-1 회원정보 등록화면](https://user-images.githubusercontent.com/44824456/230766853-2d6b65ab-75cc-4bac-af79-9bb5a449a0f5.png)

<br /><br />

![5 로그인 화면](https://user-images.githubusercontent.com/44824456/230768084-9eb8ceb9-c458-4f5e-a3c3-3a802d4ae1aa.png)

- JavaScript로 입력한 아이디와 비밀번호의 validation 체크를 한 후 DB저장된 정보와 같다면 로그인이 완료 됩니다.

<br />
<br />

### 비밀번호 찾기 기능

![3-5  비밀번호찾기](https://user-images.githubusercontent.com/44824456/225893489-4cceb4f5-16e9-4bad-a409-932950effc98.JPG)

- 로그인 모달 창에서 비밀번호 찾기 버튼을 클릭 시 비밀번호 찾기 모달창이 띄워지도록 구현했습니다.
- 아이디와 이메일을 입력 시 alert 창을 통해 비밀번호 복구 진행 상황을 사용자가 알 수 있도록 했습니다.

<br />
<br />
<br />
<br />

### 회원정보 조회

![4-4 회원정보 조회 화면](https://user-images.githubusercontent.com/44824456/230766891-62911bd9-e833-4d0b-9be1-737641d23646.png)

- 로그인 후 마이페이지 클릭 시 회원정보를 조회 페이지로 이동하도록 구성했습니다.

<br /><br />

### 회원정보 수정

![4-2 회원정보 수정화면](https://user-images.githubusercontent.com/44824456/230766895-ffc7408d-2d3b-4178-9534-cc45baae09b2.png)

- 자바스크립트를 이용해 수정 버튼 클릭 시 동적으로 input element가 생성 되게 하였습니다.
- input에 수정할 값을 입력 한 후 완료 버튼을 클릭하면 DB에 등록된 ID와 동일한 회원의 정보가 수정한 값으로 변경되도록 하였습니다.<br />
  ![4-2 회원정보 수정결과](https://user-images.githubusercontent.com/44824456/230766978-64d0757d-44ad-42f9-be9a-d87d9e350c35.png)

<br /><br />

### 회원정보 삭제(회원 탈퇴)

![4-3 회원정보 삭제화면](https://user-images.githubusercontent.com/44824456/230767135-fa3cce15-8ac1-44f6-924d-e07de45db728.png)

- 자바스크립트를 이용해 탈퇴 버튼 클릭 시 DB에 등록된 ID와 동일한 회원의 데이터를 삭제한 후 alert 창을 띄웠습니다

<br />
<br />
<br />
<br />

### 관광지 정보 조회

![2-1 관광지 정보 조회](https://user-images.githubusercontent.com/44824456/230767002-f4245300-a0f9-40fb-a426-01621b2676e1.png)

- 공공데이터 포털의 한국관광공사\_국문관광정보 서비스\_GW 데이터와 카카오맵 API를 이용하여 구현하였습니다.

<br /><br />

![2-2 관광지 정보 조회](https://user-images.githubusercontent.com/44824456/230767004-9c5114d7-7671-4458-ab3f-e3003cfc0de7.png)

- 검색할 지역과 관광지 유형, 검색어를 입력한 후 검색 버튼을 누르면 입력한 값을 GET방식으로 전송해 DB에서 해당하는 데이터를 찾았습니다.
- 찾은 데이터를 카카오맵에 마크를 만들어 뿌려지도록 구현하였고 한 눈에 볼 수 있도록 카카오맵 API를 사용해 지도의 레벨을 조정하였습니다.
- 검색 결과를 데이터를 지도 아래에 이미지와 장소 이름, 주소를 볼 수 있는 UI를 동적으로 만들어서 추가했으며, 각 데이터를 클릭 시 지도가 해당 위치로 이동하도록 구현하였습니다.

<br />
<br />
<br />
<br />

### 게시판 글 목록 조회 - 공지사항

![7-1 심화 공지사항 게시판 목록_게시글 있음](https://user-images.githubusercontent.com/44824456/230767207-4ffd0985-6e73-407b-9ec6-143b2fdf362c.png)

- 공지사항 게시판의 글 목록을 볼 수 있도록 페이지를 구성했습니다.
- 게시물의 제목을 클릭 시 해당 게시물 페이지로 이동할 수 있도록 했습니다.
- 글 쓰기 버튼을 통해 게시물 작성 페이지로 이동할 수 있도록 했습니다.

<br />
<br />

### 게시판 글 목록 조회 - 여행 후기

![8-1 심화 여행후기 게시판 목록_게시글 있음](https://user-images.githubusercontent.com/44824456/230767236-f1988f01-aadf-478f-9b41-d41ba1166012.png)

- 여행 후기 게시판의 글 목록을 볼 수 있도록 페이지를 구성했습니다.
- 게시물의 제목을 클릭 시 해당 게시물 페이지로 이동할 수 있도록 했습니다.
- 글 쓰기 버튼을 통해 게시물 작성 페이지로 이동할 수 있도록 했습니다.

<br />
<br />

### 게시판 글 조회

![8-2 심화 여행후기 게시글 상세 화면](https://user-images.githubusercontent.com/44824456/230767842-8302c2f1-8b52-41d1-a5fa-f22f4d3a34b0.png)
![8-3 추가  여행후기 게시글 상세 화면_좋아요클릭](https://user-images.githubusercontent.com/44824456/230767802-e7cc7c7d-d679-4bd2-b139-40fb6802128f.png)
![8-3 추가  여행후기 게시판 목록 화면_좋아요수증가](https://user-images.githubusercontent.com/44824456/230767860-90493d62-ce63-43d4-b537-4c21776791e0.png)

- dot 아이콘 클릭 시 해당 게시물 수정, 삭제를 할 수 있도록 구현했습니다.
- 하트 아이콘 클릭 시 쿠키를 생성해 게시물의 좋아요 수 증가 되도록 구현하였습니다.

<br />
<br />

### 게시판 글 작성, 수정

![7-1   심화 공지사항 게시판 등록 화면](https://user-images.githubusercontent.com/44824456/230767219-7fe817d4-ae7d-4ab5-b802-29d81523526d.png)

- 제목, 내용, 사진을 입력 받을 수 있는 input 요소를 만들어 후기를 작성하는 내용을 입력 받을 수 있도록 했습니다.
- 글 작성 시 DB에 제목, 내용, 작성자, 작성일을 등록했으며 글 수정 시 DB에서 article_no이 일치하는 게시물의 데이터를 update하게 구현했습니다.

## 구현 기능 (Back-End)

### ER Diagram

![EnjoyTrip ER Diagram캡쳐](https://user-images.githubusercontent.com/44824456/232015629-2355200c-ca4f-4f70-a95c-f2136be6396d.PNG)


- 회원 등급과 본인 여부에 따라 게시판에 게시글을 CRUD 가능하도록 DB를 설계하였습니다.
- 맞춤 검색을 위한 Keyword를 게시글 / 여행지 / 개인에 각각 등록 및 관리할 수 있도록 DB를 설계하였습니다.
- 게시글 Hit(좋아요) 기능 추가 및 데이터 관리를 위한 DB를 설계하였습니다.
- 메인 페이지 및 메뉴 구성하였습니다.
- 관광지 정보 데이터관리를 할 수 있도록 DB를 설계하였습니다.
- 회원관리 정보 데이터 관리를 위한 DB를 구축하였습니다.
