import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class MovieWide extends StatelessWidget {
  static const String baseUrl = "https://image.tmdb.org/t/p/w500/";
  final String title, posterPath;
  final int id;
  final num voteCount;

  const MovieWide({
    super.key,
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    onButtonTap() {
      print("click!");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            id: id,
            title: title,
            posterPath: posterPath,
          ),
          fullscreenDialog: true,
        ),
      );
    }

    return Container(
      width: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(255, 255, 255, 0.2),
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 240,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFDDFDD),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 1,
                      ),
                      child: Text(
                        '$voteCount Votes',
                        style: TextStyle(
                            color: Color(0xFFF30E02),
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 20,
                    ),
                    child: Text(
                      title,
                      textWidthBasis: TextWidthBasis.parent,
                      softWrap: true,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        height: 1.2,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onButtonTap,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 24,
                        ),
                        child: Text(
                          'Click here',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.scale(
            scale: 1.2,
            child: Transform.translate(
              offset: Offset(-10, 0),
              child: Image.network(
                '$baseUrl$posterPath',
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
