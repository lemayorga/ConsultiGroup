import 'package:fl_newsprovider/src/models/category_model.dart';
import 'package:fl_newsprovider/src/services/news_service.dart';
import 'package:fl_newsprovider/src/theme/teme.dart';
import 'package:fl_newsprovider/src/widgets/lista_notiicias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
   
  const Tab2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final newsService =  Provider.of<NewsService>(context);
    return  SafeArea(
      child:  Scaffold(
        body: Column(
           children: [
             const _ListaCategorias(),
             Expanded(
              child: ListaNoticias(noticias: newsService.getArticulosCategoriaSeleccionada) 
             );

           ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final categories =  Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder:(context, index) {
    
          final cName = categories[index].name;
          final name = '${cName[0].toUpperCase()}${cName.substring(1)}';
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                    _CategoriaButtom(categoria: categories[index]),
                    SizedBox(height: 5,), 
                    Text(name)
                ],
              ),
            );
        },
      ),
    );
  }
}

class _CategoriaButtom extends StatelessWidget {

  final Category categoria;
  
  const _CategoriaButtom({
    super.key,
    required this.categoria,
  });

  @override
  Widget build(BuildContext context) {

    final newsService =  Provider.of<NewsService>(context,);
    
    return GestureDetector(
      onTap: () {
              final newsService =  Provider.of<NewsService>(context,listen: false);
              newsService.selectedCategoria = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color:  Colors.white
        ),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategoria == categoria.name )
            ?  miTema.hintColor : Colors.black54,
          ),
      ),
    );
  }
}