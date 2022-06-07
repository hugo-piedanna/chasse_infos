import 'package:flutter/material.dart';

class map extends StatelessWidget {
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
          child: Text('Carte'),
        ),
      ),
    );
  }
}
