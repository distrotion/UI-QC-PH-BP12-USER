import 'package:flutter/material.dart';
import '../model/model.dart';
import 'P5SER-RGH-001/SERRGH001main.dart';
import 'P6SER-MIC-001/SERMIC001main.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page6Body();
  }
}

class Page6Body extends StatelessWidget {
  Page6Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return MICROSC_SERMIC001main();
  }
}
