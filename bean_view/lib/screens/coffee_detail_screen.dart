import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:bean_view/data/coffee_data.dart';

class CoffeeDetailScreen extends StatefulWidget {
  final int index;

  const CoffeeDetailScreen({super.key, required this.index});

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  bool _isBottom = false;
  final ScrollController _verticalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _verticalScrollController.addListener(() {
      print(_isBottom);
      print("offset: ${_verticalScrollController.offset}");
      print("maxScroll: ${_verticalScrollController.position.maxScrollExtent}");

      if (_verticalScrollController.offset >
          _verticalScrollController.position.maxScrollExtent) {
        setState(() {
          _isBottom = true;
        });
      }

      // final controller = _verticalScrollController;
      // if (!controller.hasClients) return;

      // final atBottom =
      //     controller.offset >= controller.position.maxScrollExtent &&
      //         !controller.position.outOfRange;
      // if (_isBottom != atBottom) {
      //   setState(() {
      //     _isBottom = atBottom;
      //   });
      // }
    });
  }

  @override
  void dispose() {
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void onList() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.only(
                bottom: 128.0,
                top: 24.0,
              ),
              child: SingleChildScrollView(
                controller: _verticalScrollController,
                child: Column(
                  children: [
                    Image.asset(
                        "assets/images/backgrounds/bg${widget.index + 1}.jpg"),
                    SizedBox(height: 36.0),
                    Wrap(
                      spacing: 16.0,
                      runSpacing: 16.0,
                      children: List.generate(
                        coffeeData[widget.index].flavor.length,
                        (i) {
                          return Column(children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/flavor/flavor${widget.index + 1}-${i + 1}.png"),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey.shade200,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              coffeeData[widget.index].flavor[i],
                              style: TextStyle(color: Colors.black54),
                            ),
                          ]);
                        },
                      )
                          .animate(delay: 500.ms, interval: 500.ms)
                          .fadeIn(begin: 0)
                          .flipH(
                            begin: -0.5,
                            end: 0,
                            curve: Curves.easeInCubic,
                          ),
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      spacing: 8.0,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "가공: ${coffeeData[widget.index].process}",
                          style: TextStyle(height: 1.0, fontSize: 14.0),
                        ),
                        Text(
                          "|",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                            height: 1.0,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          "로스팅: ${coffeeData[widget.index].roast}",
                          style: TextStyle(height: 1.0, fontSize: 14.0),
                        ),
                      ],
                    )
                        .animate(delay: 1.5.seconds)
                        .fadeIn(begin: 0)
                        .slideY(begin: 1, end: 0),
                    SizedBox(height: 16.0),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 36.0, horizontal: 48.0),
                          child: Text(
                            coffeeData[widget.index].subTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                        for (var desc in coffeeData[widget.index].description)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 48.0),
                            child: Text(
                              desc,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        SizedBox(height: 24.0),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: size.width,
              height: 160.0,
              padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(22, 22, 22, 0.2),
                    blurRadius: 10,
                    // spreadRadius: 1,
                    offset: Offset(0, -1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${widget.index}",
                        child: Image.asset(
                          "assets/images/products/product${widget.index + 1}.png",
                          height: 100.0,
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            coffeeData[widget.index].nameKr,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            coffeeData[widget.index].nameEn,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            coffeeData[widget.index].company,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "${coffeeData[widget.index].price}원 | ${coffeeData[widget.index].weight}g",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: onList,
                        child: Icon(
                          Icons.keyboard_double_arrow_down,
                          size: 20.0,
                          color: Colors.black45,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ).animate().slideY(begin: 1, end: 0),
          ),

          // Positioned.fill(
          //   child: IgnorePointer(
          //     ignoring: !_isBottom,
          //     child: GestureDetector(
          //       behavior: HitTestBehavior.translucent,
          //       onVerticalDragEnd: _handleSwipeDown,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
