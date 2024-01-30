import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/03-01-SURBAL013.dart';
import '../model/model.dart';

import 'P3SUR-BAL-013/SURBAL013main.dart';
import 'P3SUR-BAL-013/SURBAL013var.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3BlocTableBody();
  }
}

class Page3BlocTableBody extends StatelessWidget {
  const Page3BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SURBAL013_Bloc(),
        child: BlocBuilder<SURBAL013_Bloc, SURBAL013SCHEMA>(
          builder: (context, data) {
            return Page3Body(
              data: data,
            );
          },
        ));
  }
}

class Page3Body extends StatelessWidget {
  Page3Body({Key? key, this.data}) : super(key: key);

  SURBAL013SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BALANCE_SURBAL013main(
      data: data,
    );
  }
}
