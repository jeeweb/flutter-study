import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:threads_clone/data/mock_data.dart';
import 'package:threads_clone/features/users/settings_screen.dart';
import 'package:threads_clone/features/users/widgets/persistent_tab_bar.dart';
import 'package:threads_clone/features/users/widgets/replies_item.dart';
import 'package:threads_clone/features/users/widgets/threads_item.dart';
import 'package:threads_clone/utils.dart';

class ProfileScreen extends StatefulWidget {
  static const routeURL = "/profile";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _onSettingsTap() {
    context.go(SettingsScreen.routeURL);
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => SettingsScreen(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                //pinned: true,
                surfaceTintColor: Colors.white,
                leading: IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.globe,
                    size: 24.0,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: _onSettingsTap,
                    icon: FaIcon(
                      FontAwesomeIcons.bars,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jane",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 28.0,
                                    letterSpacing: 0.1),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "jane_mobbin",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                      vertical: 4.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? Colors.grey.shade800
                                          : Color(0xFFF5F6F6),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(
                                      "threads.net",
                                      style: TextStyle(
                                        color: isDark
                                            ? Colors.grey.shade400
                                            : Colors.grey.shade500,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 36,
                            foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/52396673?v=4"),
                            child: Text("janice"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                        child: Text(
                          "Plant enthusiast!",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 196.0,
                            padding: EdgeInsets.symmetric(
                              vertical: 6.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Edit profile",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 196.0,
                            padding: EdgeInsets.symmetric(
                              vertical: 6.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Share profile",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => Divider(
                  color: isDark ? Color(0xFF666666) : Colors.grey.shade300,
                ),
                itemCount: 4,
                itemBuilder: (context, index) => ThreadsItem(
                  username: mockDataThreads[index].username,
                  userAvatar: mockDataThreads[index].userAvatar,
                  time: mockDataThreads[index].time,
                  contentText: mockDataThreads[index].contentText,
                  images: mockDataThreads[index].images,
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => Divider(
                  color: isDark ? Color(0xFF666666) : Colors.grey.shade300,
                ),
                itemCount: 2,
                itemBuilder: (context, index) => RepliesItem(
                  username: mockDataReplies[index].username,
                  userAvatar: mockDataReplies[index].userAvatar,
                  time: mockDataReplies[index].time,
                  contentText: mockDataReplies[index].contentText,
                  images: mockDataReplies[index].images,
                  myName: mockDataReplies[index].myName,
                  myAvatar: mockDataReplies[index].myAvatar,
                  myTime: mockDataReplies[index].myTime,
                  myContentText: mockDataReplies[index].myContentText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
