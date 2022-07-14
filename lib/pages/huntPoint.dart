import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
                              const Text(
                                "Aucun administrateur",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xfffaf3dd)),
                              ),
                            ]),
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
}
