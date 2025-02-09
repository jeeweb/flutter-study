import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1, // 하단에 구분선
          title: Text("Discover"),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory, // 클릭했을 때 배경에 splash 애니메이션 효과
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true, // 탭 수가 많아지는 경우 스크롤로 넘어가게 옵션
            labelStyle: TextStyle(
              // 활성화된 탭의 label 텍스트스타일
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Colors.black,
            labelColor: Colors.black, // 활성화된 탭의 label 폰트컬러
            unselectedLabelColor: Colors.grey.shade500, // 비활성화된 탭의 label 폰트 컬러
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (var tab in tabs)
              Center(
                child: Text(
                  tab,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
