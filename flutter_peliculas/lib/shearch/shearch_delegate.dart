import 'package:flutter/material.dart';
import 'package:flutter_peliculas/models/models.dart';
import 'package:flutter_peliculas/providers/movies_providers.dart';
import 'package:provider/provider.dart';

class MovieShearchDelegate  extends SearchDelegate{

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Buscar pelicula";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear)
       )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(
        onPressed: () {
          close(context, null); 
        },
        icon: const Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }


  Widget _emptyContainer(){
    return Container(
      child: const Center(
        child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size:  130,),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProviders>(context, listen:  false);
    moviesProvider.getSuggestionsByQuery(query);
    
    return StreamBuilder(
      stream:  moviesProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<Movie>> snapshot){
        if(!snapshot.hasData){
            return _emptyContainer();
        }

        final movies = snapshot.data;

        return ListView.builder(
            itemCount:  movies!.length,
            itemBuilder: (context, index) => _MovieItem(movie: movies[index]),
        );
      }
    );
  }
}


class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {

    movie.heroId = 'search-${movie.id}';

    return ListTile(
      leading:  FadeInImage(
        placeholder: const AssetImage('assets/no-image.jpg'),
        image: NetworkImage(movie.fullPosterImg),
        fit: BoxFit.contain,
        width:  50,
      ),
      title:  Text(movie.title),
       subtitle:  Text(movie.originalLanguage),
       onTap: () {
         Navigator.pushNamed(context, 'details',arguments: movie);
       },
    );
  }
}