import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homePage();
}

class _homePage extends State<home> with AutomaticKeepAliveClientMixin<home> {
  String btnHunt = "Commencer";
  bool visibleTimer = false;
  String digitalHours = "00", digitalMinute = "00", digitalSeconds = "00";
  int hours = 0, minutes = 0, seconds = 0;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitalSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitalMinute = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitalHours = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
  }

  void interactStart() {
    setState(() {
      if (!visibleTimer) {
        btnHunt = "Arreter";
        startTimer();
      } else {
        btnHunt = "Commencer";
        timer!.cancel();
        seconds = 0;
        minutes = 0;
        hours = 0;
        digitalSeconds = "00";
        digitalMinute = "00";
        digitalHours = "00";
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: const Text('Temps enregistré'),
            backgroundColor: const Color(0xff4a7c59),
            action: SnackBarAction(
                label: 'OK',
                onPressed: Scaffold.of(context).hideCurrentSnackBar),
          ),
        );
      }
      visibleTimer = !visibleTimer;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff4a7c59), Color(0xff52896e)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Acceuil',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfffaf3dd)),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () => interactStart(),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 100),
                    onPrimary: HexColor('#faf3dd'),
                    primary: HexColor('#8fc0a9'),
                  ),
                  child: Text(
                    btnHunt,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: visibleTimer,
                  child: Text(
                    "$digitalHours:$digitalMinute:$digitalSeconds",
                    style:
                        const TextStyle(fontSize: 20, color: Color(0xfffaf3dd)),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Bienvenue",
                          style: TextStyle(
                              color: Color(0xfffaf3dd),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Cette application propose plusieurs fonctionnalitées. Vous pouvez commencer par vos enregistrer dans les paramètres",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xfffaf3dd)),
                        )
                      ]),
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
                          "Scanner",
                          style: TextStyle(
                              color: Color(0xfffaf3dd),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Prenez en photo un animal pour avoir la taille, le poids*, l'espèce et le descriptif de l'animal.\n*Les données sont des approximations",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xfffaf3dd)),
                        )
                      ]),
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
                          "Analytique",
                          style: TextStyle(
                              color: Color(0xfffaf3dd),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Retrouvez toutes vos statistiques, le nombre de cartouches utilisées, le temps passé à la chasse, le nombre d'animaux morts ...",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xfffaf3dd)),
                        )
                      ]),
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
                          "Points de chasse",
                          style: TextStyle(
                              color: Color(0xfffaf3dd),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Trouvez les informations relatives à vos points de chasse favoris, comme les prévisions météo, les dates d'ouvertures",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xfffaf3dd)),
                        )
                      ]),
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
                          "Carte",
                          style: TextStyle(
                              color: Color(0xfffaf3dd),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Notre carte vous permet de retrouver les parkings, les pièges possés, votre emplacement, les miradors, la délimitation de votre zone et plus",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xfffaf3dd)),
                        )
                      ]),
                ),
                const SizedBox(height: 70)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
