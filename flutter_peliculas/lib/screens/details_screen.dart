import 'package:flutter/material.dart';
import 'package:flutter_peliculas/models/models.dart';
import 'package:flutter_peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

   final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return  Scaffold(
      body: CustomScrollView(
        slivers: [
           _CustomAppBar(movie: movie),
        
          SliverList(
            delegate: SliverChildListDelegate([
                _PosterAndTitle(movie: movie,),
                 _Overview(movie: movie,),
                 _Overview(movie: movie,),
                 _Overview(movie: movie,),
                 CastingCard(movieId: movie.id),
             ])
          ),

        ],
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {
  
  final Movie movie;
  const _CustomAppBar({
    Key? key, 
    required this.movie
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor:  Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle:  true ,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            width:  double.infinity,
            alignment:  Alignment.bottomCenter,
            color:  Colors.black12,
            padding: const EdgeInsets.only(bottom: 10,left: 20, right: 20),
            child:  Text(
              movie.title, 
              style:   TextStyle(fontSize:  16)
            )
        ),
        background:  FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(movie.fullBackdropPath),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
   
  final Movie movie;

  const _PosterAndTitle({required this.movie});

  @override
  Widget build(BuildContext context) {
  
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return  Container(
       margin: const EdgeInsets.only(top: 20),
       padding: const EdgeInsets.symmetric(horizontal:  29),
       child:  Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius:  BorderRadius.circular(20),
              child:  FadeInImage(
                 placeholder: const AssetImage('assets/loading.gif'),
                 image: NetworkImage(movie.fullPosterImg),
                 height: 150,
                 width: 110,
              ),
            ),
          ),
          const SizedBox(width: 20),


          ConstrainedBox(
           constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title, 
                  style:
                   textTheme.headlineSmall,
                   overflow: TextOverflow.ellipsis,
                   maxLines: 2
                  ),
                Text(
                  movie.originalTitle, 
                  style:
                   textTheme.titleMedium,
                   overflow: TextOverflow.ellipsis,
                   maxLines: 2
                  ),
                  Row(
                    children: [
                      const Icon(Icons.start_outlined, size: 15, color: Colors.grey),
                      const SizedBox(width: 2),
                      Text('${movie.voteAverage}', style: textTheme.bodySmall)
                    ],
                  )
              ],
            ),
          )
        ],
       ),
    );
  }
}


class _Overview extends StatelessWidget {
  final Movie movie;
  const _Overview({Key? key, required this.movie}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:  const EdgeInsets.symmetric(horizontal: 30 , vertical:  30),
        child: Text(
          'Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras, al contrario de usar textos como por ejemplo "Contenido aquí, contenido aquí". Estos textos hacen parecerlo un español que se puede leer',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.titleMedium ,
          ),
    );
  }
}