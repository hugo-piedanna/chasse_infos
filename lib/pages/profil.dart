import 'package:chasse_infos/index.dart';
import 'package:chasse_infos/models/userModel.dart';
import 'package:chasse_infos/pages/login.dart';
import 'package:chasse_infos/pages/registration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:open_mail_app/open_mail_app.dart';

class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _profilPage createState() => _profilPage();
}

class _profilPage extends State<profil> {
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
                Navigator.push(
                  this.context,
                  MaterialPageRoute(builder: (context) => const acceuil()),
                );
              },
              backgroundColor: const Color(0xff8fc0a9),
              foregroundColor: const Color(0xfffaf3dd),
              child: const Icon(Icons.arrow_back),
            ),
            body: SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  const Text(
                    "Profil",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffaf3dd)),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 100),
                      onPrimary: HexColor('#faf3dd'),
                      primary: HexColor('#8fc0a9'),
                    ),
                    child: const Text(
                      "Paramètres",
                      style: TextStyle(fontSize: 30, color: Color(0xfffaf3dd)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  (user == null)
                      ? Container(
                          width: 350,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: HexColor('#68B0AB'),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    this.context,
                                    MaterialPageRoute(
                                        builder: (context) => const login()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(300, 100),
                                  onPrimary: HexColor('#faf3dd'),
                                  primary: HexColor('#8fc0a9'),
                                ),
                                child: const Text(
                                  "Se connecter",
                                  style: TextStyle(
                                      fontSize: 30, color: Color(0xfffaf3dd)),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    this.context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const registration()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(300, 100),
                                  onPrimary: HexColor('#faf3dd'),
                                  primary: HexColor('#8fc0a9'),
                                ),
                                child: const Text(
                                  "S'enregistrer",
                                  style: TextStyle(
                                      fontSize: 30, color: Color(0xfffaf3dd)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Center(
                                child: Text(
                                  "Certaines fonctionnalités nécessitent d'avoir un compte et de se connecter",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xfffaf3dd)),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Container(
                              width: 350,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: HexColor('#68B0AB'),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(300, 100),
                                      onPrimary: HexColor('#faf3dd'),
                                      primary: HexColor('#8fc0a9'),
                                    ),
                                    child: const Text(
                                      "Avertir !",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xfffaf3dd)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Center(
                                    child: Text(
                                      "Signalez la présence de promeneurs pour que vos collègues soient plus attention",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xfffaf3dd)),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: 350,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: HexColor('#68B0AB'),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Amis",
                                    style: TextStyle(
                                        color: Color(0xfffaf3dd),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Vous pourrer prochainement ajouter des amis pour partager votre position ou vos performences avec eux !",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xfffaf3dd),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                logout(context);
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 100),
                                onPrimary: HexColor('#faf3dd'),
                                primary: HexColor('#8fc0a9'),
                              ),
                              child: const Text(
                                "Se déconnecter",
                                style: TextStyle(
                                    fontSize: 30, color: Color(0xfffaf3dd)),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            )),
          ),
        ),
      )),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(
        msg: "Deconnecter avec succès !", toastLength: Toast.LENGTH_LONG);

    setState(() {
      user = FirebaseAuth.instance.currentUser;
    });
  }
}
