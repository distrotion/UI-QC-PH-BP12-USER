import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/02-01-APPPHBP12.dart';

import 'P2APP-INSHES/APPINSHESmain.dart';
import 'P2APP-INSHES/APPINSHESvar.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page2BlocTableBody();
  }
}

class Page2BlocTableBody extends StatelessWidget {
  const Page2BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => APPPHBP12_Bloc(),
        child: BlocBuilder<APPPHBP12_Bloc, APPPHBP12SCHEMA>(
          builder: (context, data) {
            return Page2Body(
              data: data,
            );
          },
        ));
  }
}

class Page2Body extends StatelessWidget {
  Page2Body({Key? key, this.data}) : super(key: key);
  APPPHBP12SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: APPEARANCE_APPPHBP12main(
        data: data,
      ),
    );
  }
}
