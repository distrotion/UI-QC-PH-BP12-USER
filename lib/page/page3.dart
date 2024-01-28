import 'package:flutter/material.dart';
import '../model/model.dart';
import 'P3SER-BAL-013/SERBAL013main.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3Body();
  }
}

class Page3Body extends StatelessWidget {
  Page3Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return BALANCE_SERBAL013main();
  }
}
