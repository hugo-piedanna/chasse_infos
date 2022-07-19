import 'package:chasse_infos/index.dart';
import 'package:chasse_infos/models/userModel.dart';
import 'package:chasse_infos/pages/profil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

class _mapView extends State<map> {
  User? user = FirebaseAuth.instance.currentUser;
  userModel userMod = userModel();
  bool checkHunt = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .get()
          .then((value) {
        userMod = userModel.fromMap(value.data());
        List? list = userMod.huntPoints;
        setState(() {
          checkHunt = list!.isEmpty;
        });
      });
    }
  }

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
                ? _showNoLog(context, "Vous n'êtes pas connecté",
                    "Pour utilisé cette fonctionnalité vous devez vous connecter. Pour profiter au maximum de cette fonctionnalité vous devez vous abonner à 1 ou plusieurs point de chasse")
                : (checkHunt)
                    ? _showNoLog(context, "Abonnement",
                        "Vous êtes abonné à aucun point de chasse, vous ne verrez donc aucun repère sur la carte")
                    : Flexible(
                        child: FlutterMap(
                          options: MapOptions(
                            center:
                                LatLng(43.40676081436447, 4.988552087050192),
                            zoom: 12.0,
                          ),
                          layers: [
                            TileLayerOptions(
                              urlTemplate:
                                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                              subdomains: ['a', 'b', 'c'],
                              tileProvider:
                                  const NonCachingNetworkTileProvider(),
                            ),
                          ],
                        ),
                      ),
          ],
        )),
      ),
    );
  }

  Widget _showNoLog(BuildContext context, String title, String lore) {
    return AlertDialog(
      backgroundColor: HexColor('#68B0AB'),
      title: Text(title,
          style: const TextStyle(
              color: Color(0xfffaf3dd),
              fontWeight: FontWeight.bold,
              fontSize: 22)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            lore,
            style: const TextStyle(color: Color(0xfffaf3dd), fontSize: 17),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            if (user == null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profil()),
              );
            } else if (checkHunt) {
              setState(() {
                checkHunt = false;
              });
            }
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text(
            "Compris",
            style: TextStyle(color: Color(0xffC8D5B9)),
          ),
        ),
      ],
    );
  }
}
