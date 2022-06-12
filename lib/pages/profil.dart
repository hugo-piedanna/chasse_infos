import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _profilPage createState() => _profilPage();
}

class _profilPage extends State<profil> {
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
                      "Paramètre",
                      style: TextStyle(fontSize: 30, color: Color(0xfffaf3dd)),
                    ),
                  ),
                  const SizedBox(height: 40),
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
                            "Se connecter",
                            style: TextStyle(
                                fontSize: 30, color: Color(0xfffaf3dd)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: 350,
                    child: const Text(
                      "Il n'est pas obligatoire d'avoir un compte pour utiliser notre application, cependant, en vous connectant vous pourrez profiter pleinement des fonctionnalitées disponible",
                      style: TextStyle(fontSize: 20, color: Color(0xfffaf3dd)),
                    ),
                  )
                ],
              )),
            ),
          ),
        ),
      )),
    );
  }
}
