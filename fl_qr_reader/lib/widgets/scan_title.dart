import 'package:fl_qr_reader/providers/scan_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {


  final String tipo;

  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {

    final scannListProvider  = Provider.of<ScanListProvider>(context);
    final scans = scannListProvider.scans;

    return  ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(
              color:  Colors.red,
            ),
            onDismissed: (direction) {
                Provider.of<ScanListProvider>(context,listen: false)
                    .borrarScanByID(scans[index].id!);
            },
            child: ListTile(
              leading: Icon(
                    tipo == 'http' ?  Icons.home_outlined :  Icons.macro_off_outlined , 
                   color: Theme.of(context).primaryColor
                   ),
                title: Text(scans[index].valor),
                subtitle: Text(scans[index].id.toString()),
                trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                onTap: ()  =>  launchURL(context, scans[index]),
          
            ),
          );
      },
    );
  }
}