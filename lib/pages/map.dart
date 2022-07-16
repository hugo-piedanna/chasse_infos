import 'package:chasse_infos/index.dart';
import 'package:chasse_infos/pages/profil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latlong2/latlong.dart';

class map extends StatefulWidget {
  const map({Key? key}) : super(key: key);

  @override
  State<map> createState() => _mapView();
}

class _mapView extends State<map> with AutomaticKeepAliveClientMixin<map> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff4a7c59), Color(0xff52896e)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (user == null)
                ? _showNoLog(context)
                : Flexible(
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(43.40676081436447, 4.988552087050192),
                        zoom: 12.0,
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate:
                              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: ['a', 'b', 'c'],
                          tileProvider: const NonCachingNetworkTileProvider(),
                        ),
                      ],
                    ),
                  ),
          ],
        )),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _showNoLog(BuildContext context) {
    return new AlertDialog(
      backgroundColor: Color(0xff8fc0a9),
      title: const Text("Vous n'êtes pas connecté",
          style: TextStyle(
              color: Color(0xfffaf3dd),
              fontWeight: FontWeight.bold,
              fontSize: 22)),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            "Pour utilisé cette fonctionnalité vous devez vous connecter. Pour profiter au maximum de cette fonctionnalité vous devez vous abonner à 1 ou plusieurs point de chasse",
            style: TextStyle(color: Color(0xfffaf3dd), fontSize: 17),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => profil()),
                (route) => false);
          },
          textColor: Theme.of(context).primaryColor,
          child: Text(
            "Compris",
            style: TextStyle(color: HexColor('#C8D5B9')),
          ),
        ),
      ],
    );
  }
}
