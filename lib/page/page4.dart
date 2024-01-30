import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/04-01-SURTHI002.dart';
import '../model/model.dart';

import 'P4SUR-THI-002/SURTHI002main.dart';
import 'P4SUR-THI-002/SURTHI002var.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page4BlocTableBody();
  }
}

class Page4BlocTableBody extends StatelessWidget {
  const Page4BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SURTHI002_Bloc(),
        child: BlocBuilder<SURTHI002_Bloc, SURTHI002SCHEMA>(
          builder: (context, data) {
            return Page4Body(
              data: data,
            );
          },
        ));
  }
}

class Page4Body extends StatelessWidget {
  Page4Body({Key? key, this.data}) : super(key: key);

  SURTHI002SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return THICKNESS_SURTHI002main(
      data: data,
    );
  }
}
