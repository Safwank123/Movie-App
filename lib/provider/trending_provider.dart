import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:url_launcher/url_launcher.dart';

class TmdbApiProvider with ChangeNotifier {
  List<Map<String, dynamic>> _trendingMovies = [];
  List<Map<String, dynamic>> _topRatedMovies = [];
  List<Map<String, dynamic>> _upcomingMovies = [];
  List<Map<String, dynamic>> _popularMovies = [];
  bool _isLoading = true;

  final String _apiKey = 'a5ff1e81f237d4b025cfa438b428cf62';
  final String _readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNWZmMWU4MWYyMzdkNGIwMjVjZmE0MzhiNDI4Y2Y2MiIsIm5iZiI6MTcyMjQzODI2OC4zMTEyMTMsInN1YiI6IjY2YWE0ZjQ3NWQ3ZjMxN2Y3Njg4MDA1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.jggfpSSNNtfgBO6pnnltkOI33_pm_-FW-9m2T6FOx7Y';

  late TMDB _tmdbWithCustomLogs;

  TmdbApiProvider() {
    _tmdbWithCustomLogs = TMDB(
      ApiKeys(_apiKey, _readAccessToken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    loadMovies();
  }

  
  List<Map<String, dynamic>> get trendingMovies => _trendingMovies;
  List<Map<String, dynamic>> get topRatedMovies => _topRatedMovies;
  List<Map<String, dynamic>> get upcomingMovies => _upcomingMovies;
  List<Map<String, dynamic>> get popularMovies => _popularMovies;
  bool get isLoading => _isLoading;


  Future<void> loadMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Fetch data from TMDB API
      Map trendingResult = await _tmdbWithCustomLogs.v3.trending.getTrending();
      Map topRatedMoviesResult =
          await _tmdbWithCustomLogs.v3.movies.getTopRated();
      Map upcomingMoviesResult =
          await _tmdbWithCustomLogs.v3.movies.getUpcoming();
      Map popularMoviesResult =
          await _tmdbWithCustomLogs.v3.movies.getPopular();

      // Process data and fetch trailers
      _trendingMovies = await _fetchTrailers(
        List<Map<String, dynamic>>.from(trendingResult['results'] ?? []),
      );
      _topRatedMovies = await _fetchTrailers(
        List<Map<String, dynamic>>.from(topRatedMoviesResult['results'] ?? []),
      );
      _upcomingMovies = await _fetchTrailers(
        List<Map<String, dynamic>>.from(upcomingMoviesResult['results'] ?? []),
      );
      _popularMovies = await _fetchTrailers(
        List<Map<String, dynamic>>.from(popularMoviesResult['results'] ?? []),
      );

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading movies: $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<List<Map<String, dynamic>>> _fetchTrailers(
    List<Map<String, dynamic>> movies, {
    bool isTVShow = false,
  }) async {
    return Future.wait(movies.map((movie) async {
      try {
        var id = movie['id'];
        if (id == null || id is! int) {
          debugPrint('Invalid movie ID: $id');
          return movie; 
        }

        Map videoResult = isTVShow
            ? await _tmdbWithCustomLogs.v3.tv.getVideos(id as String)
            : await _tmdbWithCustomLogs.v3.movies.getVideos(id);

        List videos = (videoResult['results'] ?? []) as List;

        String? trailerUrl;
        for (var video in videos) {
          if (video['type'] == 'Trailer' && video['site'] == 'YouTube') {
            if (video['key'] != null) {
              trailerUrl = 'https://www.youtube.com/watch?v=${video['key']}';
            }
            break;
          }
        }

        movie['trailer_url'] = trailerUrl;
      } catch (e) {
        debugPrint(
            'Error fetching trailers for movie ID ${movie['id'] ?? 'unknown'}: $e');
      }
      return movie;
    }).toList());
  }

 
  Future<void> openTrailer(String trailerUrl) async {
    if (trailerUrl.isNotEmpty && await canLaunch(trailerUrl)) {
      await launch(trailerUrl);
    } else {
      debugPrint('Could not open trailer URL: $trailerUrl');
    }
  }
}
