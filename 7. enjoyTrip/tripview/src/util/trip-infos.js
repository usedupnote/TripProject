const tripInfos = [
  {
    province: "서울",
    location: "연남",
    desc: "보존과 조화의 미덕(美德)을 아는 동네, 연남",
    detail: `새롭게 각광받고 있는 연남동은 유럽과 아시아식 요리를 선보이는 트렌디한 레스토랑과 '작은 차이나타운'의 중식당이 늘어선 식당가로 인기 있는 지역입니다. 벽화가 그려진 골목에는 개성 있는 카페와 독립 서점이 있으며 주말에 열리는 동진시장에서는 빈티지 의류와 핸드메이드 패션 액세서리를 판매합니다. 경의선숲길에는 오래된 기찻길을 따라 산책로가 조성되어 있습니다.`,
    imageFileName: "연남.jpg",
    lat: 37.563898,
    lng: 126.92038,
  },
  {
    province: "서울",
    location: "강남",
    desc: "도심 속 여유, 강남",
    detail: `강남구는 서울의 고급스럽고 현대적인 중심지로 빛나는 고층 빌딩, 디자이너 브랜드 매장, 유명한 DJ가 테크노와 하우스 음악을 트는 세련된 나이트클럽이 있습니다. 고급 레스토랑부터 프라이드치킨, 소주, 막걸리를 파는 술집 등 다양한 식당이 있습니다. 스타필드 코엑스몰에서는 아쿠아리움이 관광객에게 인기가 많으며 예술의전당에는 디자인 미술관과 공연장이 있습니다. 봉은사는 8세기에 건립되었습니다.`,
    imageFileName: "강남.jpg",
    lat: 37.498095,
    lng: 127.02761,
  },
  {
    province: "서울",
    location: "홍대",
    desc: "걷고 싶은 젊음의 거리, 홍대",
    detail: `네온 불빛으로 빛나는 바, 클럽, 벽화, 패션 매장, 길거리 공연자가 즐비한 트렌디한 장소`,
    imageFileName: "홍대.jpg",
    lat: 37.555816,
    lng: 126.924118,
  },
  {
    province: "서울",
    location: "종로",
    desc: "사람중심 명품도시 종로",
    detail: `번화한 종로구의 인기 명소로는 광화문 앞에서 수문장 교대식이 열리는 화려한 경복궁과 우아한 불교 사찰인 조계사 등이 있습니다. 전통 시장으로는 동묘 벼룩시장, 김밥 같은 길거리 음식을 판매하는 광장 시장이 있습니다. 인근의 길거리 포장마차에서는 소주, 막걸리와 함께 매콤한 해물 볶음 등을 판매하며 종로 3가에는 게이 바가 많습니다.`,
    imageFileName: "종로.jpg",
    lat: 37.571002,
    lng: 127.001952,
  },
  {
    province: "경기",
    location: "고양",
    desc: "꽃보다 아름다운 사람들의 도시, 고양",
    detail: `고양시는 대한민국 경기도의 북서부에 위치한 특례시이다. 시청은 덕양구 주교동에 있으며, 시의 슬로건은 "평화의 시작 미래의 중심 고양"이다. 서울특별시의 근교 지역으로 성장한 곳으로, 1970년대부터 읍 규모의 시가지들이 발달했다.`,
    imageFileName: "고양.jpg",
    lat: 37.658611,
    lng: 126.769945,
  },
  {
    province: "경기",
    location: "수원",
    desc: "사람이 반갑습니다. 휴먼시티 수원",
    detail: `수원시는 대한민국 경기도 중남부에 있는 특례시이자 경기도청 소재지이다. 동쪽으로는 용인시, 서쪽으로는 안산시, 남쪽으로는 화성시, 북쪽으로 의왕시와 접한다. 시청 소재지는 팔달구 인계동이며, 장안구, 권선구, 팔달구, 영통구의 4개 일반구가 설치되어 있다.`,
    imageFileName: "수원.jpg",
    lat: 37.280348,
    lng: 127.007884,
  },
  {
    province: "강원",
    location: "강릉",
    desc: "포켓몬고의 도시, 강릉",
    detail: `강릉시는 대한민국 강원도 동해안 중부에 있는 시이다. 서울과 비슷한 위도에 위치한 영동 지방 최대 도시이다. 서쪽으로 태백산맥이 뻗어 있고, 동쪽으로 동해가 펼쳐져 있으며, 해안선 길이는 73.72km이다.`,
    imageFileName: "강릉.jpg",
    lat: 37.72466,
    lng: 128.855473,
  },
  {
    province: "강원",
    location: "양양",
    desc: "서핑의 도시, 양양",
    detail: `양양군은 대한민국 강원도 동해안 중부에 있는 군이다. 동해는 수심이 깊고, 북서쪽으로 설악산이 있다. 특산물은 송이와 연어이며 다른 수산물도 풍부하다. 설악산과 해수욕장을 보유하고 있어 자연환경이 깨끗하다.`,
    imageFileName: "양양.jpg",
    lat: 38.015702,
    lng: 128.619233,
  },
  {
    province: "충청",
    location: "보령",
    desc: "맛있는 녹차와 머드축제, 보령",
    detail: `보령시는 대한민국 충청남도 서해안에 있는 시이다. 동쪽은 청양군·부여군, 서쪽은 서해에 면하며, 남쪽은 서천군, 북쪽은 홍성군과 접하고 있다. 장항선과 서해안고속도로가 연결된다. 대천항과 대천해수욕장, 무창포해수욕장 등이 있고, 매년 보령머드축제를 개최한다.`,
    imageFileName: "보령.jpg",
    lat: 36.345472,
    lng: 126.609131,
  },
  {
    province: "충청",
    location: "충주",
    desc: "충청북도 제2의 도시, 충주",
    detail: `충주시는 대한민국 충청북도 북부에 있는 시이다. 고구려 시대에는 고구려의 남부 거점인 국원성이었고 신라대에는 중원경이었다. 차령산맥과 소백산맥 사이에 있으며, 남한강 유역에 침식분지가 발달되어 하안단구 지형을 이룬다.`,
    imageFileName: "충주.jpg",
    lat: 36.988875,
    lng: 127.919182,
  },
  {
    province: "경상",
    location: "부산",
    desc: "대한민국 제 2의 도시, 부산",
    detail: `부산광역시는 대한민국 동남부에 위치한 광역시이다. 대한민국의 제2의 도시이자 최대의 해양 도시이며, 부산항을 중심으로 해상 무역과 물류 산업이 발달하였다. 일본과는 대한해협과 대마도를 사이에 두고 마주하고 있다. 시청 소재지는 연제구 연산동이며, 행정구역은 15구 1군이다`,
    imageFileName: "부산.jpg",
    lat: 35.202903,
    lng: 129.088515,
  },
  {
    province: "경상",
    location: "울산",
    desc: "해오름의 도시, 울산",
    detail: `울산광역시는 대한민국 남동부에 있는 광역시이다. 서쪽으로 밀양시, 양산시, 청도군, 북쪽으로 경주시, 남쪽으로 부산광역시 기장군과 접한다. 태화강이 울산광역시를 통과하여 동해로 흐르며, 동해안에 울산항과 방어진항, 온산항이 위치한다.`,
    imageFileName: "울산.jpg",
    lat: 35.548004,
    lng: 129.306197,
  },
  {
    province: "전라",
    location: "전주",
    desc: "문화유산의 도시, 전주",
    detail: `전주시는 대한민국 전라북도 내륙에 위치한 시이자 전라북도청 소재지이다. 대부분의 지역이 완주군에 둘러싸여 있으며, 서쪽으로는 김제시, 서북쪽으로는 익산시와 접한다. 면적은 205.5 km², 인구는 약 65만 명이다`,
    imageFileName: "전주.jpg",
    lat: 35.827747,
    lng: 127.116246,
  },
  {
    province: "제주",
    location: "애월",
    desc: "제주시의 옛 소박한 모습을 간직한 애월",
    detail: `애월읍은 제주특별자치도 제주시 서부에 있는 읍이다. 면적은 202.16km²로 제주특별자치도 전체의 10%를 차지하고, 제주시의 읍면 가운데에서 가장 면적이 넓다, 인구는 외국인을 제외하고 2019년 12월 31일을 기준으로 16,163세대, 36,233명이다.`,
    imageFileName: "애월.jpg",
    lat: 33.410621,
    lng: 126.393932,
  },
  {
    province: "제주",
    location: "서귀포",
    desc: "따뜻하고 아름다운 도시, 서귀포",
    detail: `서귀포시는 대한민국 제주특별자치도 남부에 있는 행정시이다. 과거 남제주군에 속했던 서귀읍이 서귀포항을 중심으로 도시화되어 1981년 자치시인 서귀포시로 승격하여 분리됐다가, 2006년 제주특별자치도 출범과 함께 동서로 접하던 자치군이었던 남제주군과 통합하여 행정시가 되었다.`,
    imageFileName: "서귀포.jpg",
    lat: 33.253185,
    lng: 126.561163,
  },
];

export default tripInfos;
