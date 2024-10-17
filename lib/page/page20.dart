import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/20-01-INCOMINGGETPO.dart';
import '../bloc/BlocEvent/20-02-INCOMINGGETLIST.dart';
import '../model/model.dart';
import 'P20INCOMING/P20INCOMINGMAIN.dart';

class Page20 extends StatelessWidget {
  const Page20({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page20BlocTableBody();
  }
}

class Page20BlocTableBody extends StatelessWidget {
  const Page20BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INCOMINGGETPO_Bloc(),
        child: BlocBuilder<INCOMINGGETPO_Bloc, INCOMINGGETPOclass>(
          builder: (context, data) {
            return Page20BlocTableBody2(
              data: data,
            );
          },
        ));
  }
}

class Page20BlocTableBody2 extends StatelessWidget {
  Page20BlocTableBody2({
    Key? key,
    this.data,
  }) : super(key: key);
  INCOMINGGETPOclass? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INCOMINGGETLIST_Bloc(),
        child: BlocBuilder<INCOMINGGETLIST_Bloc, List<INCOMINGGETLISTclass>>(
          builder: (context, list) {
            return Page20Body(
              list: list,
              data: data,
            );
          },
        ));
  }
}

class Page20Body extends StatelessWidget {
  Page20Body({
    Key? key,
    this.data,
    this.list,
  }) : super(key: key);

  INCOMINGGETPOclass? data;
  List<INCOMINGGETLISTclass>? list;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P20INCONINGMAIN(
        data: data,
        list: list,
      ),
    );
  }
}
