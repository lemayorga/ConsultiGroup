import 'package:fl_qr_reader/providers/db_provider.dart';
import 'package:flutter/material.dart';

class ScanListProvider  extends ChangeNotifier{
   List<ScanModel> scans = [];
   String tipoSeleccionado = 'http';

   Future<ScanModel> nuevoScan(String valor) async{
     final nuevoScan = ScanModel(valor: valor);
     final id  = await DBProvider.db.nuevoScanRaw(nuevoScan);

    nuevoScan.id = id;
    if(tipoSeleccionado == nuevoScan.tipo){
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
   }


  cargarScans() async{
    final scansAll  = await DBProvider.db.getScanAll();
    scans = [...? scansAll];
    notifyListeners();
  }

   cargarScantPorTipo(String tipo)async{
    final scansAll  = await DBProvider.db.getScanByTipo(tipo);
    scans = [...? scansAll];
    tipoSeleccionado = tipo;
    notifyListeners();
   }

  borrarTodos() async{
   await DBProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
   }

  borrarScanByID(int id) async{
    await DBProvider.db.deleteScan(id);
   }
}