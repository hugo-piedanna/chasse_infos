import 'dart:convert';

import 'package:chasse_infos/pages/huntPoint.dart';
import 'package:chasse_infos/pages/profil.dart';
import 'package:chasse_infos/models/pointDataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class listHuntingPoint extends StatelessWidget {
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
          body: Column(children: [
            const Text(
              'Points chasse',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfffaf3dd)),
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: ReadJSONData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  var items = data.data as List<pointDataModel>;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: items == null ? 0 : items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      huntPoint(items[index])),
                            );
                          },
                          child: Card(
                            color: const Color(0xff8fc0a9),
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Container(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: Text(
                                                items[index].name.toString(),
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    color: Color(0xfffaf3dd),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: Text(
                                                "${items[index].city} - ${items[index].country}",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Color(0xfffaf3dd)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Icon(
                                              Icons.arrow_right_alt,
                                              size: 30,
                                              color: Color(0xfffaf3dd),
                                            )),
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          ]),
        ));
  }

  Future<List<pointDataModel>> ReadJSONData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/points_chasse.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => pointDataModel.fromJSON(e)).toList();
  }
}
