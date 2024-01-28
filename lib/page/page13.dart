import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/13-01-SumReportGET.dart';
import '../model/model.dart';
import 'P13SumReport/P01SumReportmain.dart';

class Page13 extends StatelessWidget {
  const Page13({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page13BlocTableBody();
  }
}

class Page13BlocTableBody extends StatelessWidget {
  const Page13BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SumReportGET_Bloc(),
        child: BlocBuilder<SumReportGET_Bloc, datauoutraw>(
          builder: (context, datain) {
            return Page13Body(
              datain: datain,
            );
          },
        ));
  }
}

class Page13Body extends StatelessWidget {
  Page13Body({
    Key? key,
    this.datain,
  }) : super(key: key);

  datauoutraw? datain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P01SumReportmain(
        datain: datain,
      ),
    );
  }
}
