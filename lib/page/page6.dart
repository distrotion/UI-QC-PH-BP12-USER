import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/06-01-SURMIC001.dart';
import '../model/model.dart';

import 'P6SUR-MIC-001/SURMIC001main.dart';
import 'P6SUR-MIC-001/SURMIC001var.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page6BlocTableBody();
  }
}

class Page6BlocTableBody extends StatelessWidget {
  const Page6BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SURMIC001_Bloc(),
        child: BlocBuilder<SURMIC001_Bloc, SURMIC001SCHEMA>(
          builder: (context, data) {
            return Page6Body(
              data: data,
            );
          },
        ));
  }
}

class Page6Body extends StatelessWidget {
  Page6Body({Key? key, this.data}) : super(key: key);

  SURMIC001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return MICROSC_SURMIC001main(
      data: data,
    );
  }
}
