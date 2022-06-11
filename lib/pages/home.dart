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
