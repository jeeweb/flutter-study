import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/screens/detail_screen.dart';

class MovieSmall extends StatelessWidget {
  const MovieSmall({
    super.key,
    required this.movie,
  });
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    num rating = (movie.voteAverage / 2).round();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: movie.id,
              title: movie.title,
              posterPath: movie.posterPath,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(4, 4),
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ],
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 8,
              ),
              child: Text(
                movie.title,
                textWidthBasis: TextWidthBasis.parent,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  height: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              children: [
                for (var i = 1; i <= 5; i++)
                  i < rating
                      ? Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow,
                          size: 14,
                        )
                      : Icon(
                          Icons.star_rate_outlined,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 14,
                        ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
