import 'dart:ui';

import 'package:bean_view/data/coffee_data.dart';
import 'package:bean_view/screens/coffee_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CoffeeListScreen extends StatefulWidget {
  const CoffeeListScreen({super.key});

  @override
  State<CoffeeListScreen> createState() => _CoffeeListScreenState();
}

class _CoffeeListScreenState extends State<CoffeeListScreen> {
  final PageController _pageController = PageController(
    viewportFraction: 0.8,
  );

  int _currentPage = 0;
  final ValueNotifier<double> _horizontalScroll = ValueNotifier(0.0);

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page == null) return;
      _horizontalScroll.value = _pageController.page!;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onDetail(int index) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: CoffeeDetailScreen(
              index: index,
            ),
          );
        },
        fullscreenDialog: true,
      ),
    );
  }

  void _onSwipeDown(detail, index) {
    _onDetail(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Container(
              key: ValueKey(_currentPage),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/backgrounds/bg${_currentPage + 1}.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  color: Color.fromRGBO(0, 0, 0, .4),
                ),
              ),
            ),
          ),
          PageView.builder(
            onPageChanged: _onPageChanged,
            controller: _pageController,
            itemCount: coffeeData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onVerticalDragEnd: (detail) => _onSwipeDown(detail, index),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 150),
                      alignment: Alignment.center,
                      child: Container(
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(222, 222, 222, .6),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              coffeeData[index].nameKr,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              coffeeData[index].nameEn,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              coffeeData[index].company,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "${coffeeData[index].price}원 | ${coffeeData[index].weight}g",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 24.0),
                            GestureDetector(
                              onTap: () => _onDetail(index),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDEDCDC),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: Text(
                                  "Detail",
                                  style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: _horizontalScroll,
                      builder: (context, scroll, child) {
                        final difference = (scroll - index).abs();
                        final scale = 1 - (difference * 0.2);
                        return Positioned(
                          top: 220,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.center,
                            child: Hero(
                              tag: "$index",
                              child: Transform.scale(
                                scale: scale,
                                child: Image.asset(
                                  "assets/images/products/product${index + 1}.png",
                                  height: 300.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
