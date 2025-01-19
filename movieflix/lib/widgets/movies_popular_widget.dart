import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/widgets/movie_wide_widget.dart';

class MoviesPopular extends StatelessWidget {
  const MoviesPopular({
    super.key,
    required this.popularMovies,
  });

  final Future<List<MovieModel>> popularMovies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 24,
      ),
      child: FutureBuilder(
        future: popularMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 204,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var movie = snapshot.data![index];
                  return MovieWide(
                      id: movie.id,
                      title: movie.title,
                      posterPath: movie.posterPath,
                      voteCount: movie.voteCount);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 12,
                ),
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
