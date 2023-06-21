import 'package:fl_newsprovider/src/models/news_model.dart';
import 'package:fl_newsprovider/src/theme/teme.dart';
import 'package:flutter/material.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:  noticias.length,
      itemBuilder: (context, index) {
        return _Noticia(
            index: index,
            noticia: noticias[index],
        );
      },
    );
  }
}



class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({super.key, required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia: noticia, index: index,),

          _TarjetaTitulo(noticia: noticia,),

          _TarjetaImagen(noticia: noticia,),

         _TarjetaBody(noticia: noticia,),

         _TarjetaBotones(),

         SizedBox(height: 10,),

         Divider(),

      ],
    );
  }
}



class _TarjetaTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaTopBar({super.key, required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${ index + 1 }.', style: TextStyle(color: miTema.hintColor)), 
          Text('${ noticia.source.name }.'), 
        ],
      ),
    );
  }
}


class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;
  const _TarjetaTitulo({Key? key, required this.noticia}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
         child:  Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), 
      );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article noticia;

  const _TarjetaImagen({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child:(noticia.url != null)
           ? FadeInImage(
            placeholder: AssetImage('assets/gitphy.gif'),
            image: NetworkImage(noticia.urlToImage!),
          )
          : Image(image:  AssetImage('assets/no-image.png')),
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {

  final Article noticia;

  const _TarjetaBody({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(noticia.description != null ? noticia.description! : '')
    );
  }
}


class _TarjetaBotones extends StatelessWidget {

  const _TarjetaBotones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                RawMaterialButton(
                  onPressed: (){},
                  fillColor: miTema.hintColor,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.star_border),
                ),

                SizedBox(width: 10,), 

                RawMaterialButton(
                  onPressed: (){},
                  fillColor: Colors.blue,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.more),
                ),
            ],
          ),
    );
  }
}


