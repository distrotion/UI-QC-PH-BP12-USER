import 'package:flutter/material.dart';
import '../model/model.dart';

import 'P7SER-MSC-001/SERMSC001main.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page7Body();
  }
}

class Page7Body extends StatelessWidget {
  Page7Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return MICROSCOPE_SERMSC001main();
  }
}
