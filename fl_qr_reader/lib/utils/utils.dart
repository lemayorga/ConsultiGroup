
 import 'package:fl_qr_reader/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

 Future<void> launchURL(BuildContext context, ScanModel scan) async {

  final url  = scan.valor;
  if(scan.tipo == 'http'){
     Uri uri = Uri.parse(url);
      // if(await canLaunchUrl(uri)){
        await launchUrl(uri);
      // }else{
      //   throw 'Could nor launch';
      // }
  }else{
   Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}

