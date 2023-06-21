import 'package:fl_newsprovider/src/pages/tab1_page.dart';
import 'package:fl_newsprovider/src/pages/tab2_page.dart';
import 'package:fl_newsprovider/src/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
   
  const TabsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (BuildContext context) => _NavegacionModel(),
      child: const Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navegacionModel =  Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (value) => navegacionModel.paginaActual = value,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_outlined),label:  'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public),label: 'Encabezada')
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navegacionModel =  Provider.of<_NavegacionModel>(context);
    final newsModel =  Provider.of<NewsService>(context);
    
    return PageView(
      controller: navegacionModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),

        Tab2Page(),
        
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

  set paginaActual(int valor){
    _paginaActual = valor;

    _pageController.animateToPage(valor, duration: const Duration(microseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

    PageController get pageController => _pageController;
}