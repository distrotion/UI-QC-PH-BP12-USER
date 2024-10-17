import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Cubit/Rebuild.dart';

// import 'dart:html' as html;

class NormalCheck extends StatelessWidget {
  NormalCheck({
    Key? key,
    this.botonCOLOR,
    this.PCS,
    this.Fre,
    this.status,
    this.blockGOOD,
    this.blockNOGOOD,
    this.modeNOGOODRT,
  }) : super(key: key);

  bool? botonCOLOR;
  String? PCS;
  String? Fre;
  String? status;
  bool? blockGOOD;
  bool? blockNOGOOD;
  Function(bool)? modeNOGOODRT;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 15, end: 15, top: 10),
              child: Container(
                // color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(child: Text("Check")),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(child: Text(PCS ?? "10")),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(child: Text(Fre ?? "pcs/lot")),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              // color: confirmPass ? Colors.green : Colors.white,reject
                              color: status == "-"
                                  ? Colors.white
                                  : status == "GOOD"
                                      ? Colors.green
                                      : status == "reject"
                                          ? Colors.red
                                          : Colors.white,
                            ),
                            child: Center(child: Text(status ?? "-")),
                          ),
                        ))
                  ],
                ),
              ),
            )),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 15, end: 5, top: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        if (modeNOGOODRT != null) {
                          modeNOGOODRT!(true);
                        }
                      },
                      child: Container(
                        // color: Colors.pink,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color:
                              botonCOLOR ?? true ? Colors.green : Colors.grey,
                        ),
                        child: const Center(
                          child: Text("GOOD"),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 5, end: 15, top: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        if (modeNOGOODRT != null) {
                          modeNOGOODRT!(false);
                        }
                      },
                      child: Container(
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: botonCOLOR ?? true ? Colors.red : Colors.grey,
                        ),
                        child: const Center(
                          child: Text("NO GOOD"),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
