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
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'SURBAL013var.dart';

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
    SURBAL013var.ANS = '';
    context.read<SURBAL013_Bloc>().add(SURBAL013_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
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
        SURBAL013var.AearI = widget.data?.AearI ?? '';
        SURBAL013var.FORMULAI = widget.data?.FORMULAI ?? '';

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

    if (SURBAL013var.ANS == '') {
      if (SURBAL013var.PCS != '' &&
          SURBAL013var.POINTs != '' &&
          SURBAL013var.ItemPickSELECT != '') {
        if (SURBAL013var.FORMULAI != '' &&
            SURBAL013var.VAL1 != '' &&
            SURBAL013var.VAL2 != '' &&
            SURBAL013var.AearI != '') {
          SURBAL013var.PREANS = SURBAL013var.FORMULAI
              .replaceAll("X", SURBAL013var.VAL1)
              .replaceAll("Y", SURBAL013var.VAL2)
              .replaceAll("K1", SURBAL013var.AearI);
          // print(SURBAL013var.PREANS.interpret().toString());
          setState(() {
            SURBAL013var.ANS =
                SURBAL013var.PREANS.interpret().toStringAsFixed(4);
          });
        }
      }
    }
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
        //
        context
            .read<TRICKER_SURBAL013_Bloc>()
            .add(TRICKER_SURBAL013geteachITEM());
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
      },
      FINISH: (v) {
        // num testou = test.interpret();
        // print(testou);

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
      ITEMleftUNIT: SURBAL013var.ITEMleftUNIT,
      ITEMleftVALUE: SURBAL013var.ITEMleftVALUE,
      VAL1: SURBAL013var.VAL1,
      VAL2: SURBAL013var.VAL2,
      Aear: SURBAL013var.AearI,
      FORMULA: SURBAL013var.FORMULA,
      FORMULAI: SURBAL013var.FORMULAI,
      ANS: SURBAL013var.ANS,
    );
  }
}
