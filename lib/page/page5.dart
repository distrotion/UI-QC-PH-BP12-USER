import 'package:flutter/material.dart';
import '../model/model.dart';
import 'P5SER-RGH-001/SERRGH001main.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5Body();
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return ROUGHNESS_SERRGH001main();
  }
}
