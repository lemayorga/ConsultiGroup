import 'package:flutter/material.dart';
import 'package:flutter_peliculas/shearch/shearch_delegate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_peliculas/providers/movies_providers.dart';
import 'package:flutter_peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {


  final movieProvider = Provider.of<MoviesProviders>(context);
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cine'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: MovieShearchDelegate()), 
            icon: const Icon(Icons.search_outlined)
          )
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
      
            //Tarjeta principales
            CardSwiper(movies: movieProvider.onDisplayMovies),
      
            //Slider de peliculas
             MovieSlider(
              movies: movieProvider.popularMovies,
              title: '',
              onNextPage: () => movieProvider.getPopularMovies(),
            ),
          ]
        ),
      ),
    );
  }
}
