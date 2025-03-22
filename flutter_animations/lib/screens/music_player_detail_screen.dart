import 'package:flutter/material.dart';

class MusicPlayerDetailScreen extends StatefulWidget {
  final int index;
  const MusicPlayerDetailScreen({super.key, required this.index});

  @override
  State<MusicPlayerDetailScreen> createState() =>
      _MusicPlayerDetailScreenState();
}

class _MusicPlayerDetailScreenState extends State<MusicPlayerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Interstellar'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Hero(
                tag: "${widget.index}",
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, .4),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 8),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("assets/covers/${widget.index}.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
