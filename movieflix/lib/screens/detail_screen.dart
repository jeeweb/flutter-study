import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, posterPath;
  final int id;

  static const String baseUrl = "https://image.tmdb.org/t/p/w500/";

  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.posterPath,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movieInfo;

  @override
  void initState() {
    super.initState();
    movieInfo = ApiService.getMovieDetailsById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 배경색
        foregroundColor: Theme.of(context).textTheme.bodyMedium!.color, // 글자색s
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Hero(
                tag: widget.id,
                child: Container(
                  width: 300,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${widget.posterPath}',
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                ),
              ),
              FutureBuilder(
                future: movieInfo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    num rating = (snapshot.data!.voteAverage / 2).round();

                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        right: 8,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.4),
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Text(
                                        snapshot.data!.adult ? '18+' : 'ALL',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.8),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${snapshot.data!.runtime}m',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.8),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Text(
                                        '•',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.8),
                                        ),
                                      ),
                                    ),
                                    for (var genre in snapshot.data!.genres)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: Text(
                                          genre['name'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.8),
                                          ),
                                        ),
                                      )
                                  ],
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
                                          size: 24,
                                        )
                                      : Icon(
                                          Icons.star_rate_outlined,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          size: 24,
                                        ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              child: Container(
                                width: 400,
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Text(
                                  'Buy ticket',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 118,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                  snapshot.data!.overview,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const Text("...");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
