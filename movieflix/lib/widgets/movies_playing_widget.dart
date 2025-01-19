import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/widgets/movie_small_widget.dart';

class MoviesPlaying extends StatelessWidget {
  const MoviesPlaying({
    super.key,
    required this.nowPlayingMovies,
  });

  final Future<List<MovieModel>> nowPlayingMovies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 24,
      ),
      child: FutureBuilder(
        future: nowPlayingMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 288,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Text(
                          'Latest movies',
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                      child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var movie = snapshot.data![index];
                      return MovieSmall(movie: movie);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 12,
                    ),
                  )),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
