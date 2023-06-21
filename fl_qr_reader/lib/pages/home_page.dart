import 'package:fl_qr_reader/pages/direcciones_page.dart';
import 'package:fl_qr_reader/pages/mapas_page.dart';
import 'package:fl_qr_reader/providers/scan_list_provider.dart';
import 'package:fl_qr_reader/providers/ui_provider.dart';
import 'package:fl_qr_reader/widgets/widgetes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed:  (){
              final scannListProvider  = Provider.of<ScanListProvider>(context,listen: false);
              scannListProvider.borrarTodos();
            }, 
            icon: const Icon(Icons.delete_forever)
           )
          ],
      ),
      body: const MapasPage(),
      floatingActionButton: const ScanButton(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProviders>(context);

    final currenIndex = uiProvider.selectMenuOpt;

    //Usar el provider
    final scannListProvider  = Provider.of<ScanListProvider>(context,listen: false);
    
    switch (currenIndex) {
      case 0:
         scannListProvider.cargarScantPorTipo('geo');
         return const MapasPage();
      case 1:
        scannListProvider.cargarScantPorTipo('http');
          return const DireccionesPage();
      default:
        return const MapasPage();
    }
  }
}