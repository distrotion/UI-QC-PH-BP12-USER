import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Cubit/31-ReportPDFCommoncubit.dart';
import 'P32ReportPDFlong/ReportPDFlongMain.dart';

class Page32 extends StatelessWidget {
  const Page32({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page32BlocTableBody();
  }
}

class Page32BlocTableBody extends StatelessWidget {
  const Page32BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportPDFCommon_Cubit(),
      child: BlocBuilder<ReportPDFCommon_Cubit, CommonReportOutput>(
        builder: (context, dataCommon) {
          return Page32Body(
            dataCommon: dataCommon,
          );
        },
      ),
    );
  }
}

class Page32Body extends StatelessWidget {
  Page32Body({Key? key, this.dataCommon}) : super(key: key);

  CommonReportOutput? dataCommon;

  @override
  Widget build(BuildContext context) {
    return ReportPDFlong(
      dataCommon: dataCommon,
    );
  }
}
