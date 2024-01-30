import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/07-01-SURMCS001.dart';
import '../model/model.dart';

import 'P7SUR-MCS-001/SURMCS001main.dart';
import 'P7SUR-MCS-001/SURMCS001var.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page7BlocTableBody();
  }
}

class Page7BlocTableBody extends StatelessWidget {
  const Page7BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SURMCS001_Bloc(),
        child: BlocBuilder<SURMCS001_Bloc, SURMCS001SCHEMA>(
          builder: (context, data) {
            return Page7Body(
              data: data,
            );
          },
        ));
  }
}

class Page7Body extends StatelessWidget {
  Page7Body({Key? key, this.data}) : super(key: key);

  SURMCS001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return MICROSCOPE_SURMCS001main(
      data: data,
    );
  }
}
