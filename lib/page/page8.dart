import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/08-01-CTCSEM001.dart';
import '../model/model.dart';
import 'P8CTC-SEM-001/CTCSEM001main.dart';
import 'P8CTC-SEM-001/CTCSEM001var.dart';

class Page8 extends StatelessWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page8BlocTableBody();
  }
}

class Page8BlocTableBody extends StatelessWidget {
  const Page8BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CTCSEM001_Bloc(),
        child: BlocBuilder<CTCSEM001_Bloc, CTCSEM001SCHEMA>(
          builder: (context, data) {
            return Page8Body(
              data: data,
            );
          },
        ));
  }
}

class Page8Body extends StatelessWidget {
  Page8Body({Key? key, this.data}) : super(key: key);

  CTCSEM001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return MICROVICKER_CTCSEM001main(
      data: data,
    );
  }
}
