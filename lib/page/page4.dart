import 'package:flutter/material.dart';
import '../model/model.dart';
import 'P4SER-THI-002/SERTHI002main.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page4Body();
  }
}

class Page4Body extends StatelessWidget {
  Page4Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return THICKNESS_SERTHI002main();
  }
}
