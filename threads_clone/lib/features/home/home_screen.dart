import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/data/mock_data.dart';
import 'package:threads_clone/features/home/widgets/post_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _itemCount = 6;
  final faker = Faker();
  List<String> imagesList = [
    "assets/",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 20.00,
        ),
        itemCount: _itemCount,
        itemBuilder: (context, index) => PostItem(
          username: mockData[index].username,
          userAvatar: mockData[index].userAvatar,
          time: mockData[index].time,
          contentText: mockData[index].contentText,
          images: mockData[index].images,
          replies: mockData[index].replies,
          likes: mockData[index].likes,
        ),
      ),
    );
  }
}
