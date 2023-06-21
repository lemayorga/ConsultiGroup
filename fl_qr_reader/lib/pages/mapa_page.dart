import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_qr_reader/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {

    final  scan =  ModalRoute.of(context)?.settings.arguments as ScanModel;
    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.5,
      tilt: 50
    );

     //Marcadores
     Set<Marker> markes = Set<Marker>();
     markes.add(
      Marker(
        markerId: MarkerId('geo-location'),
        position: scan.getLatLng()
      );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
            onPressed:() async {
              final GoogleMapController controller = await _controller.future;
              await controller.animateCamera( 
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getLatLng(),
                    zoom: 17.5,
                    tilt: 50
                  )
                )
              )
              ;
          }, icon:Icon(Icons.location_disabled))
        ],
      ),
     body: GoogleMap(
      myLocationEnabled:  false,
        mapType: mapType,
        markers: markes,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.layers),
          onPressed: () {
              if(mapType == MapType.normal){
                mapType = MapType.satellite;
              }else{
                mapType = MapType.normal;
              }
              setState(() { });
          },
      ),
    );
  }
}