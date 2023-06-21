import 'package:fl_qr_reader/widgets/scan_title.dart';
import 'package:flutter/material.dart';


class MapasPage extends StatelessWidget {
  const MapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'geo');
  }
}