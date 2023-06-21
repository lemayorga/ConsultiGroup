import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_peliculas/helpers/debouncer.dart';
import 'package:flutter_peliculas/models/models.dart';
import 'package:http/http.dart' as http;


class MoviesProviders extends ChangeNotifier {

  final String _baseUrl = "api.themoviedb.org";
  final String _apiKye = "45ba9b89f6ecda4f5c17eb425ed0e52a";
  final String _languague = "es-Es";


  List<Movie> onDisplayMovies  = [];
  List<Movie> popularMovies  = [];
  int _popularPage = 0;
  Map<int, List<Cast>> moviesCast = {};

  final debouncer = Debouncer(
    duration: Duration(microseconds: 500),

   );
  final StreamController<List<Movie>> _suggestionStreamController =  new StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => this._suggestionStreamController.stream;
 
  MoviesProviders(){
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
      var url = Uri.https(_baseUrl, endpoint,{
        '_apiKye':_apiKye,
        '_languague':_languague,
        'page':'$page'
      });
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

     onDisplayMovies = nowPlayingResponse.results;

     notifyListeners();
  }


  getPopularMovies() async{

    _popularPage ++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final  popularResponse = PopularResponse.fromJson(jsonData);
     popularMovies = [...popularMovies, ...popularResponse.results];

     notifyListeners();
  }


 Future<List<Cast>> getMovieCast(int movieId) async{
    if(moviesCast.containsKey(movieId)) {
        return moviesCast[movieId]!;
    }
    
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

     moviesCast[movieId] = creditsResponse.cast;
     return creditsResponse.cast;
  }



  Future<List<Movie>> searchMovie(String query) async{
      var url = Uri.https(_baseUrl, '3/search/movie',{
        '_apiKye':_apiKye,
        '_languague':_languague,
        'query': query
      });
    final response = await http.get(url);
     final searchResponse = SearchResponse.fromJson(response.body);

     return searchResponse.results;
  }


  void getSuggestionsByQuery(String searchTerm){
    debouncer.value = '';
    debouncer.onValue = ((value) async {
      final results = await this.searchMovie(value);
      this._suggestionStreamController.add(results);
    });

    final timer = Timer.periodic(Duration(microseconds: 300),(_){
      debouncer.value = searchTerm;
    });

  Future.delayed(Duration(milliseconds: 301)).then((value) => timer.cancel());
  }
}