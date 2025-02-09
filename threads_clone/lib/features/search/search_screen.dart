import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/data/mock_data.dart';
import 'package:threads_clone/features/search/widgets/user_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드 열릴 때 body가 resize 되지 않도록
      appBar: AppBar(
        toolbarHeight: 80.0,
        surfaceTintColor: Colors.white,
        centerTitle: false,
        elevation: 1, // 하단에 구분선
        title: Text(
          "Search",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(size.width, 24.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: CupertinoSearchTextField(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10.0,
              ),
              itemColor: Colors.grey.shade500,
              prefixInsets: EdgeInsets.only(left: 8.0),
              controller: _textEditingController,
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        controller: _scrollController,
        itemCount: mockDataUsers.length,
        separatorBuilder: (context, index) => Divider(
          indent: 74.0,
          color: Colors.grey.shade200,
        ),
        itemBuilder: (context, index) => UserList(
          username: mockDataUsers[index].username,
          userAvatar: mockDataUsers[index].userAvatar,
          stateMessage: mockDataUsers[index].stateMessage,
          followers: mockDataUsers[index].followers,
        ),
      ),
    );
  }
}
