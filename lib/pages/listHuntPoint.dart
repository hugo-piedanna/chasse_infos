import 'dart:convert';

import 'package:chasse_infos/pointDataModel.dart';
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
            SizedBox(
                height: 60,
                child: FutureBuilder(
                  future: ReadJSONData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Center(child: Text("${data.error}"));
                    } else if (data.hasData) {
                      var items = data.data as List<pointDataModel>;
                      return ListView.builder(
                          itemCount: items == null ? 0 : items.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(items[index].city.toString())
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ))
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
