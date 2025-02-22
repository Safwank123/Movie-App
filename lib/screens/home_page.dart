import 'package:flutter/material.dart';
import 'package:movie_app/provider/trending_provider.dart';
import 'package:movie_app/widgets/custom_appbar.dart';
import 'package:movie_app/widgets/custom_container.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final trendingProvider = Provider.of<TmdbApiProvider>(context, listen: false);
    trendingProvider.loadMovies(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Movies Hub'),
      body: SingleChildScrollView(
        child: Consumer<TmdbApiProvider>(
          builder: (context, trendingProvider, child) {
            if (trendingProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                MoviesContainer(
                  title: 'Trending Movies',
                  movies: trendingProvider.trendingMovies,
                  isLarge: false,
                ),
                const SizedBox(height: 20),
                MoviesContainer(
                  title: 'Top Rated Movies',
                  movies: trendingProvider.topRatedMovies,
                  isLarge: false,
                ),
                 const SizedBox(height: 20),
                MoviesContainer(
                  title: 'Upcomming Movies',
                  movies: trendingProvider.upcomingMovies,
                  isLarge: false,
                ),
                MoviesContainer(
                  title: 'Upcomming Movies',
                  movies: trendingProvider.popularMovies,
                  isLarge: false,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
