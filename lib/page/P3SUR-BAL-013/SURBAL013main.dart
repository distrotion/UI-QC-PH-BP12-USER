import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:function_tree/function_tree.dart';

import '../../bloc/BlocEvent/03-01-SURBAL013.dart';
import '../../bloc/BlocEvent/03-02-TrickSURBAL013.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTCW/SINGLESHOTCWwidget.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'SURBAL013var.dart';

late BuildContext BALANCE_SURBAL013maincontext;

class BALANCE_SURBAL013main extends StatelessWidget {
  BALANCE_SURBAL013main({Key? key, this.data}) : super(key: key);
  SURBAL013SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_SURBAL013_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_SURBAL013_BlocBuffer extends StatelessWidget {
  _TRICKER_SURBAL013_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  SURBAL013SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_SURBAL013_Bloc(),
        child: BlocBuilder<TRICKER_SURBAL013_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_SURBAL013body(data: data);
          },
        ));
  }
}

class ROCKWELL_SURBAL013body extends StatefulWidget {
  ROCKWELL_SURBAL013body({Key? key, this.data}) : super(key: key);
  SURBAL013SCHEMA? data;

  @override
  State<ROCKWELL_SURBAL013body> createState() => _ROCKWELL_SURBAL013bodyState();
}

class _ROCKWELL_SURBAL013bodyState extends State<ROCKWELL_SURBAL013body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    // SURBAL013var.ANS = '';
    context.read<SURBAL013_Bloc>().add(SURBAL013_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);

    super.dispose();
    SURBAL013var.DHtimer.cancel();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    SURBAL013var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    SURBAL013var.ItemPickSELECT = '';
    context.read<TRICKER_SURBAL013_Bloc>().add(TRICKER_SURBAL013SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    BALANCE_SURBAL013maincontext = context;
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        SURBAL013var.PO = widget.data?.PO ?? '';
        SURBAL013var.CP = widget.data?.CP ?? '';
        SURBAL013var.QTY = widget.data?.QTY ?? '';
        SURBAL013var.PROCESS = widget.data?.PROCESS ?? '';
        SURBAL013var.CUSLOT = widget.data?.CUSLOT ?? '';
        SURBAL013var.TPKLOT = widget.data?.TPKLOT ?? '';
        SURBAL013var.FG = widget.data?.FG ?? '';
        SURBAL013var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        SURBAL013var.PART = widget.data?.PART ?? '';
        SURBAL013var.PARTNAME = widget.data?.PARTNAME ?? '';
        SURBAL013var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        SURBAL013var.ItemPick = widget.data?.ItemPick ?? [''];
        SURBAL013var.PCS = widget.data?.PCS ?? '';
        // SURBAL013var.PCS = '10';
        SURBAL013var.PCSleft = widget.data?.PCSleft ?? '';
        // SURBAL013var.PCSleft = '10';
        SURBAL013var.POINTs = widget.data?.POINTs ?? '';
        // SURBAL013var.POINTs = '10';
        SURBAL013var.UNIT = widget.data?.UNIT ?? '';
        // SURBAL013var.UNIT = 'pcs/lots';
        SURBAL013var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        SURBAL013var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        SURBAL013var.Area = widget.data?.Area ?? '';
        SURBAL013var.GAP = widget.data?.GAP ?? '';
        SURBAL013var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        SURBAL013var.preview = widget.data?.preview ?? [];
        SURBAL013var.confirmdata = widget.data?.confirmdata ?? [];
        SURBAL013var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        SURBAL013var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        SURBAL013var.VAL1 = widget.data?.VAL1 ?? '';
        SURBAL013var.VAL2 = widget.data?.VAL2 ?? '';
        SURBAL013var.VAL3 = widget.data?.VAL3 ?? '';
        SURBAL013var.VAL4 = widget.data?.VAL4 ?? '';
        SURBAL013var.AearI = widget.data?.AearI ?? '';
        SURBAL013var.FORMULAI = widget.data?.FORMULAI ?? '';

        SURBAL013var.ANS = widget.data?.ANS ?? '';

        SURBAL013var.shape = widget.data?.shape ?? '';

        // print(">>>>${SURBAL013var.FORMULA}");

        SURBAL013var.FORMULA = widget.data?.FORMULA ?? '';

        if (SURBAL013var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<SURBAL013_Bloc>().add(SURBAL013_READ());
      });
      SURBAL013var.DHtimer = timer;
    }

    // if (SURBAL013var.ANS == '') {
    //   if (SURBAL013var.PCS != '' &&
    //       SURBAL013var.POINTs != '' &&
    //       SURBAL013var.ItemPickSELECT != '') {
    //     if (SURBAL013var.FORMULAI != '' &&
    //         SURBAL013var.VAL1 != '' &&
    //         SURBAL013var.VAL2 != '' &&
    //         SURBAL013var.AearI != '') {
    //       SURBAL013var.PREANS = SURBAL013var.FORMULAI
    //           .replaceAll("X", SURBAL013var.VAL1)
    //           .replaceAll("Y", SURBAL013var.VAL2)
    //           .replaceAll("K1", SURBAL013var.AearI);
    //       // print(SURBAL013var.PREANS.interpret().toString());
    //       setState(() {
    //         SURBAL013var.ANS =
    //             SURBAL013var.PREANS.interpret().toStringAsFixed(4);
    //       });
    //     }
    //   }
    // }
    return SINGLESHOTCWmain(
      //------ Left
      LABEL: "SER-BAL-002",
      PO: SURBAL013var.PO,
      CP: SURBAL013var.CP,
      QTY: SURBAL013var.QTY,
      PROCESS: SURBAL013var.PROCESS,
      CUSLOT: SURBAL013var.CUSLOT,
      TPKLOT: SURBAL013var.TPKLOT,
      FG: SURBAL013var.FG,
      CUSTOMER: SURBAL013var.CUSTOMER,
      PART: SURBAL013var.PART,
      PARTNAME: SURBAL013var.PARTNAME,
      MATERIAL: SURBAL013var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        SURBAL013var.ItemPickSELECT = v;
        SURBAL013var.ANS = '';
        //
        context
            .read<TRICKER_SURBAL013_Bloc>()
            .add(TRICKER_SURBAL013geteachITEM());
      },
      Areafn: (v) {
        metrix(context);
      },
      ItemPick: SURBAL013var.ItemPick,
      PCS: SURBAL013var.PCS,
      PCSleft: SURBAL013var.PCSleft,
      POINTs: SURBAL013var.POINTs,
      UNIT: SURBAL013var.UNIT,
      INTERSEC: SURBAL013var.INTERSEC,
      RESULTFORMAT: SURBAL013var.RESULTFORMAT,
      Area: SURBAL013var.Area,
      GAP: SURBAL013var.GAP,
      GAPnameList: SURBAL013var.GAPnameList,
      GAPname: SURBAL013var.GAPname,
      GAPnamePick: (v) {
        SURBAL013var.GAPname = v;
        context
            .read<TRICKER_SURBAL013_Bloc>()
            .add(TRICKER_SURBAL013geteachGRAPH());
      },

      //------- Bottom
      ACCEPT: (v) {
        print(SURBAL013var.ARAE_ANS);
        print(SURBAL013var.AearI);
        print(SURBAL013var.Area);
        if (SURBAL013var.Area == '-') {
          //
          if (SURBAL013var.AearI != '') {
            if (SURBAL013var.PCS != '' &&
                SURBAL013var.POINTs != '' &&
                SURBAL013var.ItemPickSELECT != '') {
              if (2 > SURBAL013var.confirmdata.length) {
                context
                    .read<TRICKER_SURBAL013_Bloc>()
                    .add(TRICKER_SURBAL013confirmdata());
              } else {
                WORNINGpop(context, "Have completed POINTs");
              }
            } else {
              WORNINGpop(context, "Please select item");
            }
          }
        } else {
          if (SURBAL013var.PCS != '' &&
              SURBAL013var.POINTs != '' &&
              SURBAL013var.ItemPickSELECT != '') {
            if (2 > SURBAL013var.confirmdata.length) {
              context
                  .read<TRICKER_SURBAL013_Bloc>()
                  .add(TRICKER_SURBAL013confirmdata());
            } else {
              WORNINGpop(context, "Have completed POINTs");
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      FINISH: (v) {
        // num testou = test.interpret();
        // print(testou);

        if (SURBAL013var.PCSleft != '0') {
          if (SURBAL013var.PCS != '' &&
              SURBAL013var.POINTs != '' &&
              SURBAL013var.ItemPickSELECT != '') {
            if (SURBAL013var.FORMULAI != '' &&
                SURBAL013var.VAL1 != '' &&
                SURBAL013var.VAL2 != '' &&
                SURBAL013var.AearI != '') {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_SURBAL013_Bloc>()
                  .add(TRICKER_SURBAL013FINISH());
            } else {
              WORNINGpop(context, "POINTs are not complete");
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      preview: SURBAL013var.preview,
      confirmdata: SURBAL013var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_SURBAL013_Bloc>().add(TRICKER_SURBAL013CLEAR());
      },
      BACKPAGE: (v) {
        SURBAL013var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        SURBAL013var.ItemPickSELECT = '';
        context.read<TRICKER_SURBAL013_Bloc>().add(TRICKER_SURBAL013SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_SURBAL013_Bloc>()
            .add(TRICKER_SURBAL013RESETVALUE());
      },
      CAL2: SURBAL013var.RESULTFORMAT != 'CAL2',

      ITEMleftUNIT: SURBAL013var.ITEMleftUNIT,
      ITEMleftVALUE: SURBAL013var.ITEMleftVALUE,
      VAL1: SURBAL013var.VAL1,
      VAL2: SURBAL013var.VAL2,
      VAL3: SURBAL013var.VAL3,
      VAL4: SURBAL013var.VAL4,
      Aear: SURBAL013var.AearI,
      FORMULA: SURBAL013var.FORMULA,
      FORMULAI: SURBAL013var.FORMULAI,
      ANS: SURBAL013var.ANS,
      AearACCEPT: (v) {},
      AearACCEPTbool: false,
    );
  }
}

void metrix(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          height: 1000,
          width: 1100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: select_metrix(),
            ),
          ),
        ),
      );
    },
  );
}

class select_metrix extends StatefulWidget {
  const select_metrix({Key? key}) : super(key: key);

  @override
  State<select_metrix> createState() => _select_metrixState();
}

class _select_metrixState extends State<select_metrix> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            if (SURBAL013var.shape == 'sheet') ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    SURBAL013var.SelectAEAR = 'RS';
                    setState(() {});
                  },
                  child: Container(
                    height: 200,
                    width: 500,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(1),
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/squre.jpg"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            if (SURBAL013var.shape == 'cylinder') ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    SURBAL013var.SelectAEAR = 'CYNH';
                    setState(() {});
                  },
                  child: Container(
                    height: 200,
                    width: 500,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(1),
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/rol2.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            if (SURBAL013var.shape == 'tube') ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    SURBAL013var.SelectAEAR = 'CYWH';
                    setState(() {});
                  },
                  child: Container(
                    height: 200,
                    width: 500,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(1),
                      child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/rolin2.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
        Container(
          height: 800,
          width: 500,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  // if (SURBAL013var.SelectAEAR == 'RS') ...[
                  if (SURBAL013var.shape == 'sheet') ...[
                    Text("rectangular shape"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("L1*L2 + L1*L2 + L1*H*2 + L2*H*2"),
                    ),
                    // Text("L1 ความกว้าง , L2 ความยาว , H ความสูง"),
                    Text("--------------------------------------"),
                    ComInputText(
                      sLabel: "L1 ความกว้าง",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: SURBAL013var.iscontrol,
                      fnContr: (input) {
                        SURBAL013var.iscontrol = input;
                      },
                      sValue: SURBAL013var.RS_L1,
                      returnfunc: (String s) {
                        setState(() {
                          SURBAL013var.RS_L1 = s;
                        });
                      },
                    ),
                    ComInputText(
                      sLabel: "L2 ความยาว",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: SURBAL013var.iscontrol,
                      fnContr: (input) {
                        SURBAL013var.iscontrol = input;
                      },
                      sValue: SURBAL013var.RS_L2,
                      returnfunc: (String s) {
                        setState(() {
                          SURBAL013var.RS_L2 = s;
                        });
                      },
                    ),
                    ComInputText(
                      sLabel: "H ความสูง",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: SURBAL013var.iscontrol,
                      fnContr: (input) {
                        SURBAL013var.iscontrol = input;
                      },
                      sValue: SURBAL013var.RS_HI,
                      returnfunc: (String s) {
                        setState(() {
                          SURBAL013var.RS_HI = s;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: InkWell(
                        onTap: () {
                          if (SURBAL013var.RS_HI != '' &&
                              SURBAL013var.RS_L1 != '' &&
                              SURBAL013var.RS_L2 != '') {
                            double L1 =
                                (double.parse(ConverstStr(SURBAL013var.RS_L1)) /
                                    2);
                            double L2 =
                                (double.parse(ConverstStr(SURBAL013var.RS_L2)) /
                                    2);
                            double H =
                                (double.parse(ConverstStr(SURBAL013var.RS_HI)));
                            SURBAL013var.ARAE_ANS =
                                "${(L1 * L2 + L1 * L2 + L1 * H * 2 + L2 * H * 2).toStringAsFixed(4)}";
                            BALANCE_SURBAL013maincontext.read<
                                    TRICKER_SURBAL013_Bloc>()
                                .add(TRICKER_SURBAL013AEAR());
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 400,
                          color: Colors.blue,
                          child: Center(
                            child: Text("SAVE"),
                          ),
                        ),
                      ),
                    ),
                  ],
                  // if (SURBAL013var.SelectAEAR == 'CYNH') ...[
                  if (SURBAL013var.shape == 'cylinder') ...[
                    Text("Cylinser"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("2*PI*(DI/2)*H + PI*(DI/2)^2"),
                    ),
                    // Text("R รัศมี , H ความสูง , PI 3.1415"),
                    Text("PI 3.1415"),
                    Text("--------------------------------------"),
                    ComInputText(
                      sLabel: "DI เส้นผ่านศูนย์กลาง",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: SURBAL013var.iscontrol,
                      fnContr: (input) {
                        SURBAL013var.iscontrol = input;
                      },
                      sValue: SURBAL013var.CYNH_DI,
                      returnfunc: (String s) {
                        setState(() {
                          SURBAL013var.CYNH_DI = s;
                        });
                      },
                    ),
                    ComInputText(
                      sLabel: "H ความสูง",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: SURBAL013var.iscontrol,
                      fnContr: (input) {
                        SURBAL013var.iscontrol = input;
                      },
                      sValue: SURBAL013var.CYNH_HI,
                      returnfunc: (String s) {
                        setState(() {
                          SURBAL013var.CYNH_HI = s;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: InkWell(
                        onTap: () {
                          if (SURBAL013var.CYNH_DI != '' &&
                              SURBAL013var.CYNH_HI != '') {
                            double PI = 3.1415;
                            double R = (double.parse(
                                    ConverstStr(SURBAL013var.CYNH_DI)) /
                                2);

                            double H = (double.parse(
                                ConverstStr(SURBAL013var.CYNH_HI)));
                            SURBAL013var.ARAE_ANS =
                                "${((2 * PI * R * H) + (PI * R * R) * 2).toStringAsFixed(4)}";
                            BALANCE_SURBAL013maincontext.read<
                                    TRICKER_SURBAL013_Bloc>()
                                .add(TRICKER_SURBAL013AEAR());
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 400,
                          color: Colors.blue,
                          child: Center(
                            child: Text("SAVE"),
                          ),
                        ),
                      ),
                    ),
                  ],
                  // if (SURBAL013var.SelectAEAR == 'CYWH') ...[
                  if (SURBAL013var.shape == 'tube') ...[
                    Text("Cylinser with hold"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "2*PI*(DIOUT/2)*H + 2*PI*(DIIN/2)*H + (PI*(DIOUT/2)^2 - PI*(DIIN/2)^2)*2"),
                    ),
                    // Text("R1 รัศมีนอก , R2 รัศมีใน , H ความสูง , PI 3.1415"),
                    Text("PI 3.1415"),
                    Text("--------------------------------------"),
                    ComInputText(
                      sLabel: "DIOUT เส้นผ่านศูนย์กลางนอก",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: SURBAL013var.iscontrol,
                      fnContr: (input) {
                        SURBAL013var.iscontrol = input;
                      },
                      sValue: SURBAL013var.CYWH_DIOUT,
                      returnfunc: (String s) {
                        setState(() {
                          SURBAL013var.CYWH_DIOUT = s;
                        });
                      },
                    ),
                    ComInputText(
                      sLabel: "DIIN เส้นผ่านศูนย์กลางใน",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: SURBAL013var.iscontrol,
                      fnContr: (input) {
                        SURBAL013var.iscontrol = input;
                      },
                      sValue: SURBAL013var.CYWH_DIIN,
                      returnfunc: (String s) {
                        setState(() {
                          SURBAL013var.CYWH_DIIN = s;
                        });
                      },
                    ),
                    ComInputText(
                      sLabel: "H ความสูง",
                      height: 40,
                      width: 400,
                      isNumberOnly: true,
                      isContr: SURBAL013var.iscontrol,
                      fnContr: (input) {
                        SURBAL013var.iscontrol = input;
                      },
                      sValue: SURBAL013var.CYWH_HI,
                      returnfunc: (String s) {
                        setState(() {
                          SURBAL013var.CYWH_HI = s;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: InkWell(
                        onTap: () {
                          if (SURBAL013var.CYWH_DIOUT != '' &&
                              SURBAL013var.CYWH_DIIN != '' &&
                              SURBAL013var.CYWH_HI != '') {
                            double PI = 3.1415;
                            double R1 = (double.parse(
                                    ConverstStr(SURBAL013var.CYWH_DIOUT)) /
                                2);
                            double R2 = (double.parse(
                                    ConverstStr(SURBAL013var.CYWH_DIIN)) /
                                2);
                            double H = (double.parse(
                                ConverstStr(SURBAL013var.CYWH_HI)));

                            print(PI);
                            print(R1);
                            print(R2);
                            print(H);

                            SURBAL013var.ARAE_ANS =
                                "${((2 * PI * R1 * H) + (2 * PI * R2 * H) + (R1 * R1 - R2 * R2) * 2 * PI).toStringAsFixed(4)}";
                            BALANCE_SURBAL013maincontext.read<
                                    TRICKER_SURBAL013_Bloc>()
                                .add(TRICKER_SURBAL013AEAR());
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 400,
                          color: Colors.blue,
                          child: Center(
                            child: Text("SAVE"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
