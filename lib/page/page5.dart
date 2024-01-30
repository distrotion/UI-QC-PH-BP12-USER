import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/05-01-SURRGH001.dart';
import '../model/model.dart';

import 'P5SUR-RGH-001/SURRGH001main.dart';
import 'P5SUR-RGH-001/SURRGH001var.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5BlocTableBody();
  }
}

class Page5BlocTableBody extends StatelessWidget {
  const Page5BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SURRGH001_Bloc(),
        child: BlocBuilder<SURRGH001_Bloc, SURRGH001SCHEMA>(
          builder: (context, data) {
            return Page5Body(
              data: data,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({Key? key, this.data}) : super(key: key);

  SURRGH001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return ROUGHNESS_SURRGH001main(
      data: data,
    );
  }
}
