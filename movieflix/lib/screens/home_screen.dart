import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/movies_comingsoon_widget.dart';
import 'package:movieflix/widgets/movies_playing_widget.dart';
import 'package:movieflix/widgets/movies_popular_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  final Future<List<MovieModel>> popularMovies =
      ApiService.getMovieList(popular);
  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getMovieList(nowPlaying);
  final Future<List<MovieModel>> comingSoonMovies =
      ApiService.getMovieList(comingSoon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor, // 배경색
        foregroundColor: Theme.of(context).textTheme.bodyMedium!.color, // 글자색
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Movieflix",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.search_rounded,
              size: 32,
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: Column(
          children: [
            MoviesPopular(popularMovies: popularMovies),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    MoviesPlaying(nowPlayingMovies: nowPlayingMovies),
                    MoviesComingSoon(comingSoonMovies: comingSoonMovies),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
