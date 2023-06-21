import 'package:fl_newsprovider/src/models/category_model.dart';
import 'package:fl_newsprovider/src/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;


const _URL_NEWS = 'https://newsapi.org/v2';
const _APIKEY = 'b186c9e2d3eb4c1ea35ba1cf4bef15bd';

class NewsService with ChangeNotifier{

  List<Article> headlines = [];
  String _seletedCategoria = 'bsiness';

  String get selectedCategoria => _seletedCategoria;

  set selectedCategoria(String valor){
    _seletedCategoria =  valor;

    getArticulesByCategory(valor);
  }

    List<Article> get getArticulosCategoriaSeleccionada => 
    categoryArticles[ _seletedCategoria ] ?? List.empty();



  List<Category> categories = [
      Category(FontAwesomeIcons.building, 'business'),
      Category(FontAwesomeIcons.tv, 'entertainment'),
      Category(FontAwesomeIcons.addressCard, 'general'),
      Category(FontAwesomeIcons.headSideVirus, 'health'),
      Category(FontAwesomeIcons.vial, 'science'),
      Category(FontAwesomeIcons.volleyball, 'sports'),
      Category(FontAwesomeIcons.memory, 'tecnology'),
  ];


  Map<String,List<Article>> categoryArticles = {};
  NewsService(){
      getTopHeadLines();   

      categories.forEach((element) {
             categoryArticles[element.name] =  List.empty();
      });
  }


  getTopHeadLines() async {
      const url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us';
      
      final resp = await  http.get(Uri.http(url));
      final newResponse = NewResponse.fromRawJson(resp.body);

      headlines.addAll(newResponse.articles);
  }


  getArticulesByCategory(String categoria) async {

      if(categoryArticles[categoria].length > 0){
        return categoryArticles[categoria];
      }

      final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us&category=${categoria}';
      
      final resp = await  http.get(Uri.http(url));
      final newResponse = NewResponse.fromRawJson(resp.body);


      categoryArticles[categoria]?.addAll(newResponse.articles);

      headlines.addAll(newResponse.articles);
  }
}