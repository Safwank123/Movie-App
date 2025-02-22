import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviesContainer extends StatelessWidget {
  final String title;
  final List movies;
  final bool isLarge;
  final VoidCallback? onSeeAll;

  const MoviesContainer({
    super.key,
    required this.title,
    required this.movies,
    required this.isLarge,
    this.onSeeAll,
  });

  // Function to launch the trailer URL
  Future<void> _launchTrailer(String trailerUrl) async {
    if (await canLaunch(trailerUrl)) {
      await launch(trailerUrl);
    } else {
      throw 'Could not launch $trailerUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isLarge ? 380 : 300,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: onSeeAll,
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final movie = movies[index];
                final trailerUrl = movie['trailer_url'];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: trailerUrl != null ? () => _launchTrailer(trailerUrl) : null,
                    child: Container(
                      width: isLarge ? 350 : 130,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20),
                        image: movie['poster_path'] != null
                            ? DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                                ),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: trailerUrl != null
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Watch Trailer',
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.black45,
                                  ),
                                ),
                              ),
                            )
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
