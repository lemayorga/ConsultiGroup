import 'package:fl_qr_reader/providers/scan_list_provider.dart';
import 'package:fl_qr_reader/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
       String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF',  'Cancelar',  false,  ScanMode.QR);
      // final barcodeScanRes = 'https://www.tutorialspoint.com/sqlite/';
        

        if(barcodeScanRes == '-1'){
             return;
        }

       // final barcodeScanRes = 'geo:12.129737, -86.227835';
        final scannListProvider  = Provider.of<ScanListProvider>(context,listen: false);
        final newScan =  await scannListProvider.nuevoScan(barcodeScanRes);

        launchURL(context, newScan);
      },
    );
  }
}