import 'package:chasse_infos/models/pointDataModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import '../models/userModel.dart';

class huntPoint extends StatefulWidget {
  var items;
  huntPoint(this.items, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _huntPoint createState() => _huntPoint(items);
}

class _huntPoint extends State<huntPoint> {
  var items;
  _huntPoint(this.items);
  User? user = FirebaseAuth.instance.currentUser;
  userModel userMod = userModel();

  @override
  void initState() {
    super.initState();
    if (user != null) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .get()
          .then((value) {
        userMod = userModel.fromMap(value.data());
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List? list = userMod.huntPoints;
    bool checkSub = list!.contains(items.id);
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff4a7c59), Color(0xff52896e)])),
      child: SafeArea(
        child: ClipRRect(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff4a7c59), Color(0xff52896e)])),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniStartTop,
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: const Color(0xff8fc0a9),
                foregroundColor: const Color(0xfffaf3dd),
                child: const Icon(Icons.arrow_back),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        items.name.toString(),
                        style: const TextStyle(
                            fontSize: 40,
                            color: Color(0xfffaf3dd),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 350,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: HexColor('#68B0AB'),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: HexColor('#68B0AB').withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "S'y rendre",
                                style: TextStyle(
                                    color: Color(0xfffaf3dd),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                items.address.toString(),
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xfffaf3dd)),
                              ),
                              Text(
                                  "${items.cp.toString()}, ${items.city.toString()}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Color(0xfffaf3dd)))
                            ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 350,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: HexColor('#68B0AB'),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: HexColor('#68B0AB').withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Ouvertures",
                                style: TextStyle(
                                    color: Color(0xfffaf3dd),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Du ${items.dateOpen.toString()} au ${items.dateClose.toString()}",
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xfffaf3dd)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Horraire: ${items.time.toString()}",
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xfffaf3dd)),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 350,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: HexColor('#68B0AB'),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: HexColor('#68B0AB').withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Informations",
                                style: TextStyle(
                                    color: Color(0xfffaf3dd),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${items.hunter.toString()} abonné.e.s",
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xfffaf3dd)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                items.adminID.toString() == "n/a"
                                    ? "Aucun administrateur"
                                    : items.adminID.toString(),
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xfffaf3dd)),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          subscribe();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 100),
                          onPrimary: HexColor('#faf3dd'),
                          primary: HexColor('#8fc0a9'),
                        ),
                        child: Text(
                          (checkSub) ? "Se désabonner" : "S'abonner",
                          style: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> subscribe() async {
    if (user != null) {
      List? list = userMod.huntPoints;
      if (list!.contains(items.id)) {
        list.remove(items.id);
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .update({"huntPoints": list}).then((result) {
          Fluttertoast.showToast(
              msg: "Abonnement annulé", toastLength: Toast.LENGTH_LONG);
        });
      } else {
        list.add(items.id);
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .update({"huntPoints": list}).then((result) {
          Fluttertoast.showToast(
              msg: "Vous êtes maintenant abonné",
              toastLength: Toast.LENGTH_LONG);
        });
      }
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => huntPoint(items)));
    } else {
      Fluttertoast.showToast(
          msg: "Vous n'êtes pas connecté", toastLength: Toast.LENGTH_LONG);
    }
  }
}
