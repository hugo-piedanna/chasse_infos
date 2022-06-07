import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Color(0xff4a7c59),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff4a7c59), Color(0xff52896e)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    'images/icon-foret.png',
                    scale: 3,
                  ),
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              Container(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: HexColor('#faf3dd'),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 100),
                            onPrimary: HexColor('#faf3dd'),
                            primary: HexColor('#8fc0a9'),
                          ),
                          child: const Text(
                            'Joggeur',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 100),
                            onPrimary: HexColor('#faf3dd'),
                            primary: HexColor('#8fc0a9'),
                          ),
                          child: const Text(
                            'Chasseur',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        const Text('Developed by Hugo.P')
                      ],
                    )),
              ))
            ],
          ),
        ));
  }
}
