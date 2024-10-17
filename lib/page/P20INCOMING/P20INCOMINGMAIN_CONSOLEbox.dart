import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Cubit/NotificationEvent.dart';
import '../../../bloc/Cubit/Rebuild.dart';
import '../../../data/Base64Img.dart';
import '../../../model/model.dart';
import '../../../styles/TextStyle.dart';

import '../../../widget/box/00-nocon.dart';
import '../../../widget/box/01-normal.dart';

import '../../../widget/box/05-inputdata.dart';
import '../../bloc/BlocEvent/20-02-INCOMINGGETLIST.dart';
import 'P20INCOMINGMAIN.dart';
import 'P20INCOMINGVAR.dart';

late BuildContext P20INCOMINGMAINmaincontextbox;

void P20INCOMINGMAIN_ConsoleBoxBODY(
    dataset data, BuildContext contextin, List<INCOMINGGETLISTclass> list) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Container(
        // color: Colors.blue,
        child: Dialog(
            child: ConsoleWidget(
          data: data,
          list: list,
        )),
      );
    },
  );
}

late Timer _timer;

class ConsoleWidget extends StatefulWidget {
  ConsoleWidget({
    Key? key,
    required this.data,
    this.list,
  }) : super(key: key);
  dataset data;
  List<INCOMINGGETLISTclass>? list;

  @override
  State<ConsoleWidget> createState() => _ConsoleWidgetState();
}

class _ConsoleWidgetState extends State<ConsoleWidget> {
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), _updateCounter);
  }

  int _counter = 0;

  void _updateCounter(Timer timer) {
    P20INCOMINGVAR_INPROCESSBOX.undercontrol = true;
    Dio().post(
      // "http://172.101.32.145:1880/" + "getmicro",
      "http://172.23.10.40:1900/" + "CTCROG001_OUT",
      data: {},
    ).then((value) {
      var databuff = value.data;

      if (databuff["DATA"] != null) {
        P20INCOMINGVAR_INPROCESSBOX.DATAINPUT = databuff["DATA"].toString();

        setState(() {});
        print("-");
      }
    });
  }

  @override
  void dispose() {
    // Dispose the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    P20INCOMINGMAINmaincontextbox = context;
    List<INCOMINGGETLISTclass> _list = widget.list ?? [];
    P20INCOMINGVAR_INPROCESSBOX.itemlistbuffer = _list;
    List<Widget> CONCOLE = [];
    Widget con = NOCON(
      load: _list.length > 0,
    );

    if (_list.length > 0) {
      // print(_list[P20INCOMINGVAR.ItemNow].RESULTFORMAT);
      if (_list[P20INCOMINGVAR.ItemNow].ITEMcode != '' &&
          _list[P20INCOMINGVAR.ItemNow].ITEMcode != '-') {
        //
      }
    }

    // con = NormalCheck();

    if (_list[P20INCOMINGVAR.ItemNow].RESULTFORMAT == 'Number') {
      con = InputDataCheck(
        point: _list[P20INCOMINGVAR.ItemNow].point,
        pointremain: "${P20INCOMINGVAR_INPROCESSBOX.datainlist.length}",
        PCS: _list[P20INCOMINGVAR.ItemNow].pcs,
        picremain: "${P20INCOMINGVAR_INPROCESSBOX.setofdatainlist.length}",

        Fre: _list[P20INCOMINGVAR.ItemNow].fre,
        //
        undercontrol: P20INCOMINGVAR_INPROCESSBOX.undercontrol,
        DATAINPUT: P20INCOMINGVAR_INPROCESSBOX.DATAINPUT,
        DATAINPUTFN: (s) {
          P20INCOMINGVAR_INPROCESSBOX.DATAINPUT = s;
        },
        Enabled: false,
        datalistin: P20INCOMINGVAR_INPROCESSBOX.datainlist,

        get: (v) {
          if (P20INCOMINGVAR_INPROCESSBOX.setofdatainlist.length <
              int.parse(_list[P20INCOMINGVAR.ItemNow].pcs)) {
            if (P20INCOMINGVAR_INPROCESSBOX.DATAINPUT != '') {
              if (P20INCOMINGVAR_INPROCESSBOX.datainlist.length <
                  int.parse(_list[P20INCOMINGVAR.ItemNow].point)) {
                P20INCOMINGVAR_INPROCESSBOX.datainlist.add(datainwait(
                    NO: "${P20INCOMINGVAR_INPROCESSBOX.datainlist.length + 1}",
                    VALUE: P20INCOMINGVAR_INPROCESSBOX.DATAINPUT));
                P20INCOMINGVAR_INPROCESSBOX.DATAINPUT = '';
                setState(() {});
              }
            }
          }
        },
        finish: (v) {
          if (P20INCOMINGVAR_INPROCESSBOX.datainlist.length >=
              int.parse(_list[P20INCOMINGVAR.ItemNow].point)) {
            if (P20INCOMINGVAR_INPROCESSBOX.setofdatainlist.length <
                int.parse(_list[P20INCOMINGVAR.ItemNow].pcs)) {
              P20INCOMINGVAR_INPROCESSBOX.setofdatainlist
                  .add(P20INCOMINGVAR_INPROCESSBOX.datainlist);

              P20INCOMINGVAR_INPROCESSBOX.datainlist = [];

              setState(() {});
            }
          } else if (P20INCOMINGVAR_INPROCESSBOX.datainlist.length == 0 &&
              P20INCOMINGVAR_INPROCESSBOX.setofdatainlist.length ==
                  int.parse(_list[P20INCOMINGVAR.ItemNow].pcs)) {
            print("FINISH");
            P20INCONINGMAINcontext.read<INCOMINGGETLIST_Bloc>()
                .add(INCOMINGGETLIST_SET());
            // context.read<P04INCOMING_BP12PHSET>().add(SETDataPressedSTWDATA(
            //       ITEMcode: _list[P04INCOMINGvar_BP12PH.ItemNow].ITEMcode,
            //     ));
          }
        },
      );
    } else if (_list[P20INCOMINGVAR.ItemNow].RESULTFORMAT == 'Text') {
      con = NormalCheck();
    } else {
      con = NOCON(
        load: _list.length > 0,
      );
    }

    //-------------------------------------------------------------------
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
          height: 500,
          width: 700,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "MATCP",
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f01,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        const SizedBox(
                          width: 100,
                          child: SizedBox(
                            child: Text("NAME1",
                                // style: TxtStylePOP(fontSize: 20),
                                overflow: TextOverflow.fade),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f02,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "PART_NM",
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f03,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "PART_NO",
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f04,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 100,
                          child: const Text(
                            "CHARG",
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f05,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 100,
                          child: const Text(
                            "CUST_LOT",
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f06,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        const SizedBox(
                          width: 100,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "STATUS",
                              // style: TxtStylePOP(fontSize: 20)
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f07,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                    // SizedBox(
                    //     height: 40,
                    //     child: Column(
                    //       children: [
                    //         Expanded(
                    //             flex: 1,
                    //             child: Padding(
                    //               padding: const EdgeInsetsDirectional.only(
                    //                   start: 15, top: 2, bottom: 2),
                    //               child: Container(
                    //                 // color: Colors.amberAccent,
                    //                 decoration: BoxDecoration(
                    //                     border: Border.all(
                    //                         width: 2.0, color: Colors.black),
                    //                     borderRadius: const BorderRadius.all(
                    //                         Radius.circular(8)),
                    //                     color: Colors.black),
                    //                 child: Center(
                    //                   child: Text(
                    //                     // "USER : ${P20INCOMINGVAR_INCOMINGDATAoutput.UserNO}",
                    //                     "USER :",
                    //                     style: TextStyle(color: Colors.white),
                    //                   ),
                    //                 ),
                    //               ),
                    //             )),
                    //       ],
                    //     )),
                    SizedBox(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 15, top: 2, bottom: 2),
                        child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: PicShowFront(base64: logo),
                            )),
                      ),
                    ),
                    SizedBox(
                        height: 52,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            if (false) ReportButton(),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                width: 400,
                // color: Colors.blue,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 40, end: 40),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 7,
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0, color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  color: Colors.white,
                                ),
                                // color: Colors.red,
                                child: Center(
                                    child: Text(
                                  _list.length == 0
                                      ? 'Loading...'
                                      : _list[P20INCOMINGVAR.ItemNow].ITEMname,
                                )),
                              )),
                          const Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 40,
                              )),
                          Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  if (P20INCOMINGVAR.ItemNow > 0) {
                                    setState(() {
                                      P20INCOMINGVAR.ItemNow--;
                                    });
                                    print(_list[P20INCOMINGVAR.ItemNow]
                                        .RESULTFORMAT);
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2.0, color: Colors.black),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    color: Colors.white,
                                  ),
                                  height: 40,
                                  // color: Colors.blue,
                                  child: const Center(child: Text("<")),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  if (P20INCOMINGVAR.ItemNow <
                                      _list.length - 1) {
                                    setState(() {
                                      P20INCOMINGVAR.ItemNow++;
                                    });
                                    print(_list[P20INCOMINGVAR.ItemNow]
                                        .RESULTFORMAT);
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2.0, color: Colors.black),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    color: Colors.white,
                                  ),
                                  height: 40,
                                  // color: Colors.blue,
                                  child: const Center(child: Text(">")),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(width: 350, height: 350, child: con)
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

//------------------------------------

class PicShowFront extends StatefulWidget {
  PicShowFront({Key? key, required this.base64}) : super(key: key);
  String base64;
  @override
  State createState() => new PicShowFrontState();
}

class PicShowFrontState extends State<PicShowFront> {
  // String _base64 = base64pic01;

  @override
  Widget build(BuildContext context) {
    if (widget.base64 == null) return new Container();
    Uint8List bytes = base64.decode(widget.base64);
    return Container(
      height: 50,
      child: new Image.memory(bytes),
    );
  }
}

void RedataPage() {
  // nogood = false;
  // yesno = 0;
  // attper = 0;
  // NoGoodPage = 1;
  // PiecesDropdownSelected = '1';
}

class ReportButton extends StatelessWidget {
  const ReportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: const Text('Report'),
        onPressed: () {},
      ),
    );
  }
}
