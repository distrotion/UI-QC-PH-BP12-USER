import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qc_ui_isn_hes/model/model.dart';

import '../../bloc/BlocEvent/20-01-INCOMINGGETPO.dart';
import '../../bloc/BlocEvent/20-02-INCOMINGGETLIST.dart';
import '../../bloc/BlocEvent/20-03-INCOMINGGETDATA.dart';
import '../../data/Base64Img.dart';
import '../../widget/common/ComInputText.dart';
import 'P20INCOMINGMAIN_CONSOLEbox.dart';
import 'P20INCOMINGVAR.dart';

late BuildContext P20INCONINGMAINcontext;

class P20INCONINGMAIN extends StatefulWidget {
  P20INCONINGMAIN({
    Key? key,
    this.data,
    this.list,
    this.getdata,
  }) : super(key: key);

  INCOMINGGETPOclass? data;
  List<INCOMINGGETLISTclass>? list;
  INCOMINGGETDATAclass? getdata;

  @override
  State<P20INCONINGMAIN> createState() => _P20INCONINGMAINState();
}

class _P20INCONINGMAINState extends State<P20INCONINGMAIN> {
  @override
  Widget build(BuildContext context) {
    P20INCONINGMAINcontext = context;
    INCOMINGGETPOclass _data = widget.data ?? INCOMINGGETPOclass();
    List<INCOMINGGETLISTclass> _list = widget.list ?? [];

    INCOMINGGETDATAclass _getdata = widget.getdata ?? INCOMINGGETDATAclass();

    print(_getdata.data.length);
    return Container(
      height: 600,
      width: 900,
      // color: Colors.red,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 80,
                  width: 200,
                  child: ComInputText(
                    isNumberOnly: true,
                    sLabel: "ORDER",
                    height: 40,
                    width: 200,
                    isContr: P20INCOMINGVAR.iscontrol,
                    fnContr: (input) {
                      setState(() {
                        P20INCOMINGVAR.iscontrol = input;
                      });
                    },
                    sValue: P20INCOMINGVAR.ORDER,
                    returnfunc: (String s) {
                      P20INCOMINGVAR.ORDER = s;
                      setState(() {});
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () {
                      //

                      if (_list.length == 0) {
                        context
                            .read<INCOMINGGETPO_Bloc>()
                            .add(INCOMINGGETPO_GET());
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: _list.length == 0 ? Colors.blue : Colors.grey,
                      child: Center(
                        child: Text("SELECT"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            // color: Colors.red,
            height: 400,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Text("PO:"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("CPMAT:"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("FGMAT:"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("QTYT:"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("UNIT:"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("CUSLOTNO:"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("FG_CHARG:"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("CUST_FULLNM:"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Text(_data.PO),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(_data.CPMAT),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(_data.FGMAT),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(_data.QTYT),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(_data.UNIT),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(_data.CUSLOTNO),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(_data.FG_CHARG),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        _data.CUST_FULLNM,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          InkWell(
                            onTap: () {
                              //
                              if (_list.length > 0) {
                                P20INCOMINGVAR.ItemNow = 0;
                                P20INCOMINGMAIN_ConsoleBoxBODY(
                                    dataset(), context, _list);
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              color:
                                  _list.length > 0 ? Colors.blue : Colors.grey,
                              child: Center(
                                child: Text("START"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          InkWell(
                            onTap: () {
                              //
                              P20INCOMINGVAR.POIN = P20INCOMINGVAR.ORDER;
                              if (_list.length > 0) {
                                context
                                    .read<INCOMINGGETDATA_Bloc>()
                                    .add(INCOMINGGETDATA_GET());
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              color:
                                  _list.length > 0 ? Colors.blue : Colors.grey,
                              child: Center(
                                child: Text("GET DATA"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          InkWell(
                            onTap: () {
                              //

                              P20INCOMINGVAR.iscontrol = true;

                              P20INCOMINGVAR.ORDER = '';

                              P20INCOMINGVAR.ItemNow = 0;

                              P20INCOMINGVAR.MATIN = "";
                              //

                              P20INCOMINGVAR.SEQ = "";
                              P20INCOMINGVAR.CPMAT = "";
                              P20INCOMINGVAR.FGMAT = "";
                              P20INCOMINGVAR.QTYT = "";
                              P20INCOMINGVAR.UNIT = "";
                              P20INCOMINGVAR.CUSTNA = "";
                              P20INCOMINGVAR.PARTNA = "";
                              P20INCOMINGVAR.PARTNO = "";
                              P20INCOMINGVAR.PROC = "";
                              P20INCOMINGVAR.CUSLOTNO = "";
                              P20INCOMINGVAR.FG_CHARG = "";
                              P20INCOMINGVAR.CUST_FULLNM = "";

                              P20INCOMINGVAR_INPROCESSBOX.DATAINPUT = '';
                              P20INCOMINGVAR_INPROCESSBOX.datainlist = [];
                              P20INCOMINGVAR_INPROCESSBOX.setofdatainlist = [];
                              P20INCOMINGVAR_INPROCESSBOX.itemlistbuffer = [];

                              _getdata = INCOMINGGETDATAclass();

                              context
                                  .read<INCOMINGGETPO_Bloc>()
                                  .add(INCOMINGGETPO_GET());
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              color: Colors.blue,
                              child: Center(
                                child: Text("END"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 550,
                  height: 400,
                  // color: Colors.amber,
                  child: SizedBox(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 15, top: 2, bottom: 2),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: Colors.white,
                        ),
                        child: _getdata.data.length == 0
                            ? Center(
                                child: PicShowFront(base64: logo),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    for (int i = 0;
                                        i < _getdata.data.length;
                                        i++) ...[
                                      Text(_getdata.data[i].toString()),
                                    ],
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}
