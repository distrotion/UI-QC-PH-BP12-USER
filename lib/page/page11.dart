import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/11-GRAPHMASTER.dart';

import '../model/model.dart';
import 'P11MASTERGRAPH/MASTERGRAPHmain.dart';

class Page11 extends StatelessWidget {
  const Page11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page11BlocTableBody();
  }
}

class Page11BlocTableBody extends StatelessWidget {
  const Page11BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GRAPHMASTER_Bloc(),
        child: BlocBuilder<GRAPHMASTER_Bloc, List<dataset>>(
          builder: (context, data) {
            return Page11Body(
              data: data,
            );
          },
        ));
  }
}

class Page11Body extends StatelessWidget {
  Page11Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MASTERGRAPHmain(
        data: data,
      ),
    );
  }
}
