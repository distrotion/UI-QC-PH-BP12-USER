import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Cubit/31-ReportPDFCommoncubit.dart';

import 'P50ReportPDFcommonlist/ReportPDFcommonlistMain.dart';

class Page50 extends StatelessWidget {
  const Page50({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page50BlocTableBody();
  }
}

class Page50BlocTableBody extends StatelessWidget {
  const Page50BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportPDFCommon_Cubit(),
      child: BlocBuilder<ReportPDFCommon_Cubit, CommonReportOutput>(
        builder: (context, dataCommon) {
          return Page50Body(
            dataCommon: dataCommon,
          );
        },
      ),
    );
  }
}

class Page50Body extends StatelessWidget {
  Page50Body({Key? key, this.dataCommon}) : super(key: key);

  CommonReportOutput? dataCommon;

  @override
  Widget build(BuildContext context) {
    return ReportPDFcommonlist(
      dataCommon: dataCommon,
    );
  }
}
