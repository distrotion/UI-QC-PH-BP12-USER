import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Cubit/Rebuild.dart';
import '../common/ComInputText.dart';

// import 'dart:html' as html;

class InputDataCheck extends StatefulWidget {
  InputDataCheck({
    Key? key,
    this.botonCOLOR,
    this.point,
    this.PCS,
    this.Fre,
    this.status,
    this.blockGOOD,
    this.blockNOGOOD,
    this.modeNOGOODRT,
    this.undercontrol,
    this.DATAINPUT,
    this.DATAINPUTFN,
    this.Refresh,
    this.get,
    this.finish,
    this.Enabled,
    this.datalistin,
    this.picremain,
    this.pointremain,
  }) : super(key: key);

  bool? botonCOLOR;
  String? point;
  String? PCS;
  String? Fre;
  String? status;
  bool? blockGOOD;
  bool? blockNOGOOD;
  Function(bool)? modeNOGOODRT;
  bool? undercontrol;
  String? DATAINPUT;

  Function(String)? DATAINPUTFN;
  Function(String)? Refresh;
  Function(String)? get;
  Function(String)? finish;
  bool? Enabled;
  List<datainwait>? datalistin;

  String? picremain;
  String? pointremain;

  @override
  State<InputDataCheck> createState() => _InputDataCheckState();
}

class _InputDataCheckState extends State<InputDataCheck> {
  @override
  Widget build(BuildContext context) {
    List<datainwait> _datalistin = widget.datalistin ?? [];
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
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
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
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Center(child: Text(widget.point ?? "10")),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Center(child: Text("Points")),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Center(child: Text(widget.PCS ?? "10")),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Center(child: Text(widget.Fre ?? "pcs/lot")),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            // color: confirmPass ? Colors.green : Colors.white,reject
                            color: widget.status == "-"
                                ? Colors.white
                                : widget.status == "GOOD"
                                    ? Colors.green
                                    : widget.status == "reject"
                                        ? Colors.red
                                        : Colors.white,
                          ),
                          child: Center(child: Text(widget.status ?? "-")),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
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
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.yellow,
                          ),
                          child: Center(child: Text("Finished")),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Center(child: Text(widget.pointremain ?? "0")),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Center(child: Text("Points")),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Center(child: Text(widget.picremain ?? "0")),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Center(child: Text(widget.Fre ?? "pcs/lot")),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            // color: confirmPass ? Colors.green : Colors.white,reject
                            color: widget.status == "-"
                                ? Colors.white
                                : widget.status == "GOOD"
                                    ? Colors.green
                                    : widget.status == "reject"
                                        ? Colors.red
                                        : Colors.white,
                          ),
                          child: Center(child: Text(widget.status ?? "-")),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 15, end: 15, top: 10),
              child: Container(
                // color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border:
                            //       Border.all(width: 2.0, color: Colors.black),
                            //   borderRadius:
                            //       BorderRadius.all(Radius.circular(8)),
                            //   color: Colors.white,
                            // ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: ComInputText(
                                nLimitedChar: 300,
                                isNumberOnly: true,
                                isEnabled: widget.Enabled,
                                height: 30,
                                width: 350,
                                isContr: widget.undercontrol,
                                fnContr: (input) {
                                  setState(() {
                                    widget.undercontrol = input;
                                  });
                                },
                                sValue: widget.DATAINPUT ?? '',
                                returnfunc: (String s) {
                                  if (widget.DATAINPUT != null) {
                                    widget.DATAINPUTFN!(s);
                                  }
                                },
                              ),
                            ),
                          ),
                        )),
                    // Expanded(
                    //   flex: 1,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(4.0),
                    //     child: InkWell(
                    //       onTap: () {
                    //         if (widget.Refresh != null) {
                    //           widget.Refresh!("s");
                    //         }
                    //       },
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           border:
                    //               Border.all(width: 2.0, color: Colors.black),
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(8)),
                    //           // color: confirmPass ? Colors.green : Colors.white,reject
                    //           color: Colors.yellow,
                    //         ),
                    //         child: Center(child: Icon(Icons.refresh)),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            if (widget.get != null) {
                              widget.get!("s");
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              // color: confirmPass ? Colors.green : Colors.white,reject
                              color: (widget.blockGOOD ?? false)
                                  ? Colors.grey
                                  : Colors.blue,
                            ),
                            child: Center(child: Text("Next")),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            if (widget.finish != null) {
                              widget.finish!("s");
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              // color: confirmPass ? Colors.green : Colors.white,reject
                              color: (widget.blockGOOD ?? false)
                                  ? Colors.grey
                                  : Colors.green,
                            ),
                            child: Center(child: Text("Finish")),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
        Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < _datalistin.length; i++)
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(_datalistin[i].NO),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(_datalistin[i].VALUE),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            )

            // Row(
            //   children: [
            //     Expanded(
            //         flex: 3,
            //         child: Padding(
            //           padding: const EdgeInsetsDirectional.only(
            //               start: 15, end: 5, top: 10, bottom: 10),
            //           child: InkWell(
            //             onTap: () {
            //               if (widget.modeNOGOODRT != null) {
            //                 widget.modeNOGOODRT!(true);
            //               }
            //             },
            //             child: Container(
            //               // color: Colors.pink,
            //               decoration: BoxDecoration(
            //                 border: Border.all(width: 2.0, color: Colors.black),
            //                 borderRadius: BorderRadius.all(Radius.circular(8)),
            //                 color: widget.botonCOLOR ?? true
            //                     ? Colors.green
            //                     : Colors.grey,
            //               ),
            //               child: const Center(
            //                 child: Text("GOOD"),
            //               ),
            //             ),
            //           ),
            //         )),
            //     Expanded(
            //         flex: 2,
            //         child: Padding(
            //           padding: const EdgeInsetsDirectional.only(
            //               start: 5, end: 15, top: 10, bottom: 10),
            //           child: InkWell(
            //             onTap: () {
            //               if (widget.modeNOGOODRT != null) {
            //                 widget.modeNOGOODRT!(false);
            //               }
            //             },
            //             child: Container(
            //               // color: Colors.yellow,
            //               decoration: BoxDecoration(
            //                 border: Border.all(width: 2.0, color: Colors.black),
            //                 borderRadius: BorderRadius.all(Radius.circular(8)),
            //                 color: widget.botonCOLOR ?? true
            //                     ? Colors.red
            //                     : Colors.grey,
            //               ),
            //               child: const Center(
            //                 child: Text("NO GOOD"),
            //               ),
            //             ),
            //           ),
            //         )),
            //   ],
            // ),
            ),
      ],
    );
  }
}

class datainwait {
  datainwait({
    this.NO = '',
    this.VALUE = '',
  });
  String NO;
  String VALUE;
}
