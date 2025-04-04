class Coffee {
  final String nameKr, nameEn, origin, process, roast, company, subTitle, price;
  final int weight;
  final List<String> flavor, description;

  Coffee({
    required this.nameKr,
    required this.nameEn,
    required this.origin,
    required this.process,
    required this.roast,
    required this.company,
    required this.subTitle,
    required this.price,
    required this.weight,
    required this.flavor,
    required this.description,
  });
}

final List<Coffee> coffeeData = [
  Coffee(
      nameKr: "케냐 칸고초",
      nameEn: "Kenya Kangocho",
      origin: "케냐 니에리",
      process: "워시드",
      roast: "Medium Light",
      company: "빈브라더스",
      price: "20,000",
      weight: 200,
      flavor: ["복숭아", "패션프루트", "키위", "달콤한(Sugary)"],
      subTitle: "싱그러운 복숭아와 키위, 패션프루트, 파인애플과 같은 열대 과일향과 캐러멜 같은 농밀한 단맛까지 더해진 커피",
      description: [
        "싱그러운 봄날에 조금 이른 감이 있지만 케냐 칸고초는 여름의 달콤한 속삭임 같은 커피입니다. 미디움 라이트로 로스팅한 이 커피는 생두가 지닌 본연의 복합적인 향들과 깊은 단맛이 어우러지는데요.",
        "코랄 핑크 빛의 싱그러운 복숭아와 키위, 패션프루트, 파인애플과 같은 열대 과일 향들이 가득 느껴집니다. 여기에서 그치지 않고 흑설탕으로 만든 시럽과 캐러멜 같은 농밀한 단맛과 바디감까지 더해져 달콤한 기분에서 헤어 나오기 어렵습니다.",
        "이 커피가 지닌 다채로운 향들을 보다 선명하게 느낄 수 있도록 생두가 볶이는 속도 또한 섬세히 조정해 가며 로스팅을 진행했습니다. 봄에 소개하는 마지막 케냐 커피인만큼, 이 산지의 커피를 좋아하시는 분들께서는 칸고초와 함께 곧 다가올 여름의 달콤한 설렘을 미리 느껴 보시길 바랍니다.",
      ]),
  Coffee(
      nameKr: "멕시코 마파파스",
      nameEn: "Mexico Mafafas",
      origin: "멕시코 베라크루스",
      process: "워시드",
      roast: "Medium",
      company: "빈브라더스",
      price: "18,000",
      weight: 200,
      flavor: ["달달한 누가 캔디", "싱그러운 감귤", "브라운 스파이스"],
      subTitle: "밀크캐러멜의 달콤함에 싱그러운 귤피향의 밸런스, 그리고 뒤에 오는 박하사탕 같은 스파이시함이 느껴지는 커피",
      description: [
        "이 커피를 마시고 나면 ‘참 달다’라는 생각으로 가득해집니다. 밀크캐러멜처럼 크림과 설탕의 단맛이 어우러지고 싱그러운 귤피 향으로 밸런스를 잡아 줍니다. 마시고 난 후에 목뒤에서 박하사탕과 향신료 같은 스파이시함이 느껴져 이 커피의 달콤함을 더욱 부각해 주고 풍미를 더욱 높여 줍니다.",
        "멕시코 산지의 커피는 1년에 한 번 정도 소개할 정도로 흔히 만나기 어렵지만, 마실 때마다 좋은 단맛에 놀라곤 합니다. 이 커피의 기획 과정에서 생두 본연의 달콤함이 좋아 로스팅 팀에서도 로스팅 속도와 배전도를 섬세히 높여 단 향의 강도와 생동감을 높였다고 합니다.",
        "‘밸런스가 좋은 커피’라는 표현을 들어 보셨을 텐데요. 조금 더 쉽게 표현하면 ‘마시기 편한 커피’라는 뜻입니다. 이런 커피는 공통적으로 단맛의 강도가 높아 커피의 균형을 잡아 줍니다. 커피에서 단맛을 느껴보길 원하시는 분은 이달엔 멕시코 마파파스 커피를 추천해 드립니다. 브루잉 커피로 내릴 때, 다른 커피보다 물 빠짐이 빠른 특징이 있습니다. 하지만 충분히 성분들이 잘 추출되어 진한 커피를 드실 수 있는 점 참고 되세요."
      ]),
  Coffee(
      nameKr: "과테말라 엘 미라도르",
      nameEn: "Guatemala El Mirador",
      origin: "과테말라 우에우에테낭고",
      process: "워시드",
      roast: "Medium",
      company: "빈브라더스",
      price: "19,000",
      weight: 200,
      flavor: ["메이플 시럽", "캐슈넛", "파인애플"],
      subTitle: "메이플 시럽의 감미로움과 캐슈넛의 섬세한 단맛, 그리고 청량한 파인애플향의 여운이 있는 커피",
      description: [
        "지난달의 우아하고 싱그러웠던 엘 오브라헤 농장의 옐로우 버번 커피를 맛있게 드신 분께 특히 이 커피를 추천해 드리고 싶습니다.",
        "첫 모금을 들이키는 순간, 노란 꽃에서 채취한 듯한 꿀 내음이 코끝을 간질이며 메이플 시럽 특유의 감미로움이 입안 가득 퍼집니다. 이어서 캐슈넛의 섬세한 단맛이 은은하게 멤돌며 언제 맛보아도 기분 좋은 달콤하고 청량한 파인애플 향의 여운을 길게 남기는 커피입니다.",
        "이 커피는 마치 겨울과 봄의 경계에서 불어오는 선선하고 부드러운 바람을 닮아, 첫 모금부터 마지막 여운까지 계절의 변화를 음미하는 듯한 느낌을 전합니다. 평소 같이 보기 힘든 신선한 조합의 향들이 섬세하고 균형감 있게 조화를 이뤄내는데요. 다양한 커피를 마셔온 여러분께도 새로운 영감을 느끼게 하는 미식의 즐거움을 전할 것으로 기대합니다.",
      ]),
  Coffee(
    nameKr: "브라질 엔리케",
    nameEn: "Brazil Henrique",
    origin: "브라질 미나스제라이스",
    process: "펄프드 네추럴",
    roast: "Medium",
    company: "테라로사",
    price: "22,000",
    weight: 250,
    flavor: ["헤이즐넛", "아몬드", "크래커", "초콜렛"],
    subTitle: "헤이즐넛의 고소한 풍미와 초콜릿의 달콤한 여운이 남는 커피",
    description: [
      "2009년부터 테라로사와 함께해 온 엔리케 씨는 평생을 스페셜티 커피에 전념한 전문가로, 4대째 가업을 이어 커피를 재배하고 있습니다. 축구장 면적의 870배에 달하는 엔리케 씨의 사맘바이아 농장에서는 옐로우 부르봉, 카투아이, 문도 노보, 토파지오 등 다양한 품종을 재배하고 있으며, 대를 이어 쌓아온 전통과 경험에서 오는 섬세한 가공으로 매년 놀라운 품질의 커피를 보여 줍니다.",
      "이렇게 스페셜티 커피에 대한 열정과 정성은 물론, 엔리케씨는 브라질 커피 농부들 간의 정보 교류와 수출을 돕고, 커피 기술력 개발에 힘쓰는 등 '함께' 성장하고자 하는 노력을 아끼지 않아 많은 이들에게 존경받는 생산자이기도 합니다.",
      "올해 갓 들여온 사맘바이아 농장의 햇커피는 헤이즐넛, 아몬드와 같은 고소한 견과류의 풍미와 초콜릿의 달콤한 여운이 은은하게 어우러집니다. 따뜻한 햇살 같은 올해의 커피와 함께 브라질 커피의 저력, 그리고 엔리케 씨의 열정을 함께 느껴 보시기 바랍니다.",
    ],
  ),
  Coffee(
    nameKr: "과테말라 아우렐리오",
    nameEn: "Guatemala Aurelio",
    origin: "과테말라 우에우에테낭고",
    process: "워시드",
    roast: "Medium",
    company: "테라로사",
    price: "24,000",
    weight: 250,
    flavor: ["다크체리", "건포도", "마카다미아", "토피"],
    subTitle: "다크체리의 풍미와 마카다미아의 고소한 여운이 남는 커피",
    description: [
      "이번 커피는 과테말라 컵 오브 엑셀런스 (Cup of Excellence) 대회에서 상위권에 여러 번 입상한 스페셜티 커피의 유명인사, 2015년부터 테라로사와 연을 이어온 아우렐리오 씨의 커피입니다.",
      "아우렐리오 씨의 비요레 농장은 산세가 험난하기로 유명한 우에우에테낭고 지역 안, 멕시코 국경 근처의 오하 블랑카 마을에 자리잡고 있습니다. 오하 블랑카 지역의 깊은 산 속 미세기후와 자연환경이 만들어낸 특별한 풍미는 아우렐리오씨의 열정적인 농사를 통해 고품질 스페셜티 커피로 완성됩니다.",
      "수확기가 되면 아우렐리오 씨는 형제들과 함께 비탈진 산의 경사면을 따라 심어진 커피나무에서 핸드픽으로 한 알 한 알 커피를 수확하고, 잘 정비한 워싱 스테이션에서 당일 가공을 시작합니다. 과육을 벗겨내고 점액질을 제거한 파치먼트는 파티오에서 천천히 건조합니다.",
      "테라로사가 매년 소개해 온 아우렐리오 씨의 커피, 올해의 커피도 다크체리, 건포도 같은 과일의 풍미와 마카다미아의 고소한 여운, 토피의 진한 달콤함이 어우러지는 매력적인 플레이버를 느낄 수 있습니다. 우에우에테낭고의 특별한 떼루아와 노련한 생산자의 노하우 속에서 탄생한 올해의 아우렐리오 커피를 만나보세요.",
    ],
  ),
];
