# tripfront - Enjoy Trip
![1 메인홈](https://user-images.githubusercontent.com/44824456/225885645-bd3d029f-0ca7-4eb4-b23d-a7b9d64dd937.JPG)

## 목차
1. 프로젝트 소개
2. 구현 기능


## 프로젝트 소개
여행을 주제로 한 SSAFY 9기 1학기 관통 프로젝트입니다.     
여행지에 관한 정보를 검색할 수 있고, 여행 후기 게시판을 통해 여행 가려는 곳의 정보를 얻을 수 있도록 하였습니다.


### 기술 스택
**front-end**      
<br />
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white"/>
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white"/>
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white"/>
<img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=white"/>


----

## 구현 기능

### 회원가입 및 로그인 기능
![3-2 회원정보등록_입력](https://user-images.githubusercontent.com/44824456/225888527-9703b167-5968-43d8-a004-b6cc73ebc549.JPG)
- 네비게이션 바의 회원가입 버튼을 클릭 시 모달 창을 이용해 회원가입, 로그인 UI를 구현하였습니다.   
- 자바스크립트를 이용해 각 입력 값이 유효한 값인지 확인 후 등록을 합니다.   
- 정상적인 값이 입력 되었다면 localStorage에 입력한 회원의 정보를 저장합니다.    

<br /><br />

![4 로그인_입력](https://user-images.githubusercontent.com/44824456/225889563-c718e74d-1ae4-450b-a5bf-c4138c353277.JPG)
- 로그인 할 때 입력한 아이디와 비밀번호가 회원가입 시에 입력한 정보와 같다면 로그인이 완료 됩니다.

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
![3-4  회원정보조회](https://user-images.githubusercontent.com/44824456/225891469-9184cb77-58ef-487f-a020-31b8b5bd6a21.JPG)
- 로그인 후 마이페이지 클릭 시 회원정보를 조회 페이지로 이동하도록 구성했습니다.

<br /><br />

### 회원정보 수정
![3-2  회원정보수정](https://user-images.githubusercontent.com/44824456/225891819-f86c5a5e-29a7-4764-b619-6f9c484aea0d.JPG)
- 자바스크립트를 이용해 수정 버튼 클릭 시 동적으로 input element가 생성 되게 하였습니다.
- input에 수정할 값을 입력 한 후 완료 버튼을 클릭하면 localStorage에 있는 값이 수정한 값으로 변경되도록 하였습니다.

<br /><br />

### 회원정보 삭제(회원 탈퇴)
![3-3 회원정보삭제](https://user-images.githubusercontent.com/44824456/225892371-36b6aea5-49ec-4516-bfdc-569be096b33d.JPG)
- 자바스크립트를 이용해 탈퇴 버튼 클릭 시 저장되어 있는 localStorage를 비우도록 하였습니다.

<br />
<br />
<br />
<br />

### 관광지 정보 조회
![2 관광지정보조회_기본](https://user-images.githubusercontent.com/44824456/225895925-7ddc4f36-b9fd-4d20-a9ea-83f55b993c06.JPG)
- 공공데이터 포털의 한국관광공사_국문관광정보 서비스_GW 데이터와 카카오맵 API를 이용하여 구현하였습니다.
- 국문관광정보 서비스 데이터를 JSON형식으로 가져와 검색할 지역을 파싱해 동적으로 option element를 생성해 추가하였습니다.

<br /><br />

![3 관광지정보조회_검색결과](https://user-images.githubusercontent.com/44824456/225890871-430e7fee-c6f9-44a1-8f34-cc1f8e9613b2.JPG)
- 검색할 지역과 관광지 유형, 검색어를 입력한 후 검색 버튼을 누르면 입력한 값을 fetch API를 사용해 GET방식으로 전송해 국문관광정보에서 해당하는 데이터를 찾았습니다. 
- 찾은 데이터를 카카오맵에 마크를 만들어 뿌려지도록 구현하였고 한 눈에 볼 수 있도록 카카오맵 API를 사용해 지도의 레벨을 조정하였습니다.
- fetch API를 통해 얻은 데이터를 지도 아래에 이미지와 장소 이름, 주소를 볼 수 있는 UI를 동적으로 만들어서 추가했으며, 각 데이터를 클릭 시 지도가 해당 위치로 이동하도록 구현하였습니다. 

<br />
<br />
<br />
<br />

### 게시판 글 목록 조회 - 공지사항
![5-1 심화 공지사항_게시판_목록조회](https://user-images.githubusercontent.com/44824456/225893066-6697af3c-55f4-4662-952b-dfe3211872cb.JPG)
- 공지사항 게시판의 글 목록을 볼 수 있도록 페이지를 구성했습니다.
- 게시물의 제목을 클릭 시 해당 게시물 페이지로 이동할 수 있도록 했습니다.
- 글 쓰기 버튼을 통해 게시물 작성 페이지로 이동할 수 있도록 했습니다.

<br />
<br />

### 게시판 글 목록 조회 - 여행 후기
![5-5 심화 여행후기_게시판_글삭제](https://user-images.githubusercontent.com/44824456/225895001-603aa11f-9a71-42b0-bd22-d13fbd92e314.JPG)
- 여행 후기 게시판의 글 목록을 볼 수 있도록 페이지를 구성했습니다.
- dot 아이콘을 클릭 시 해당 게시물을 수정 / 삭제 할 수 있도록 구현했으며 게시물의 제목을 클릭 시 해당 게시물 페이지로 이동할 수 있도록 했습니다.
- 글 쓰기 버튼을 통해 게시물 작성 페이지로 이동할 수 있도록 했습니다.


<br />
<br />

### 게시판 글 작성, 수정
![5-2 심화 여행후기_게시판_글등록](https://user-images.githubusercontent.com/44824456/225894458-2f49d533-b630-4ede-bbc0-133a0db25458.JPG)
![5-3 심화 여행후기_게시판_글수정](https://user-images.githubusercontent.com/44824456/225894463-33014d5f-6e09-457b-a1a9-1e50c61fe264.JPG)
- 제목, 내용, 사진을 입력 받을 수 있는 input 요소를 만들어 후기를 작성하는 내용을 입력 받을 수 있도록 했습니다.

<br />
<br />

### 게시판 글 조회
![5-4 심화 여행후기_게시판_글조회](https://user-images.githubusercontent.com/44824456/225894779-9d8bc8e3-4a53-45c9-b405-b7a5ebb0757a.JPG)
![5-4 심화 여행후기_게시판_글조회_좋아요기능](https://user-images.githubusercontent.com/44824456/225894788-6cc88ec4-ab89-45f0-88ce-3f5c3fd7efb4.JPG)
- 게시물 제목, 작성자, 작성일, 내용을 볼 수 있도록 구현하였습니다.
- 제목 옆에 좋아요 아이콘을 넣어 사용자가 클릭 시 색이 변하며 해당 게시물에 대해 좋아요를 누를 수 있도록 기능을 추가하였습니다. 
