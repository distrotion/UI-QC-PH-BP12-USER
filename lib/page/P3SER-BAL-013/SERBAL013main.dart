import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/03-01-SERBAL013.dart';
import '../../bloc/BlocEvent/03-02-TrickSERBAL013.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTCW/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'SERBAL013var.dart';

class BALANCE_SERBAL013main extends StatelessWidget {
  BALANCE_SERBAL013main({Key? key, this.data}) : super(key: key);
  SERBAL013SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_SERBAL013_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_SERBAL013_BlocBuffer extends StatelessWidget {
  _TRICKER_SERBAL013_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  SERBAL013SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_SERBAL013_Bloc(),
        child: BlocBuilder<TRICKER_SERBAL013_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_SERBAL013body(data: data);
          },
        ));
  }
}

class ROCKWELL_SERBAL013body extends StatefulWidget {
  ROCKWELL_SERBAL013body({Key? key, this.data}) : super(key: key);
  SERBAL013SCHEMA? data;

  @override
  State<ROCKWELL_SERBAL013body> createState() => _ROCKWELL_SERBAL013bodyState();
}

class _ROCKWELL_SERBAL013bodyState extends State<ROCKWELL_SERBAL013body> {
  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
    // context.read<SERBAL013_Bloc>().add(SERBAL013_READ());
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
    SERBAL013var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    SERBAL013var.ItemPickSELECT = '';
    context.read<TRICKER_SERBAL013_Bloc>().add(TRICKER_SERBAL013SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        SERBAL013var.PO = widget.data?.PO ?? '';
        SERBAL013var.CP = widget.data?.CP ?? '';
        SERBAL013var.QTY = widget.data?.QTY ?? '';
        SERBAL013var.PROCESS = widget.data?.PROCESS ?? '';
        SERBAL013var.CUSLOT = widget.data?.CUSLOT ?? '';
        SERBAL013var.TPKLOT = widget.data?.TPKLOT ?? '';
        SERBAL013var.FG = widget.data?.FG ?? '';
        SERBAL013var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        SERBAL013var.PART = widget.data?.PART ?? '';
        SERBAL013var.PARTNAME = widget.data?.PARTNAME ?? '';
        SERBAL013var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        SERBAL013var.ItemPick = widget.data?.ItemPick ?? [''];
        SERBAL013var.PCS = widget.data?.PCS ?? '';
        // SERBAL013var.PCS = '10';
        SERBAL013var.PCSleft = widget.data?.PCSleft ?? '';
        // SERBAL013var.PCSleft = '10';
        SERBAL013var.POINTs = widget.data?.POINTs ?? '';
        // SERBAL013var.POINTs = '10';
        SERBAL013var.UNIT = widget.data?.UNIT ?? '';
        // SERBAL013var.UNIT = 'pcs/lots';
        SERBAL013var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        SERBAL013var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        SERBAL013var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        SERBAL013var.GAP = widget.data?.GAP ?? '';
        SERBAL013var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        SERBAL013var.preview = widget.data?.preview ?? [];
        SERBAL013var.confirmdata = widget.data?.confirmdata ?? [];
        SERBAL013var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        SERBAL013var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (SERBAL013var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<SERBAL013_Bloc>().add(SERBAL013_READ());
      });
      SERBAL013var.DHtimer = timer;
    }
    return SINGLESHOTCWmain(
      //------ Left
      LABEL: "SER-BAL-002",
      PO: SERBAL013var.PO,
      CP: SERBAL013var.CP,
      QTY: SERBAL013var.QTY,
      PROCESS: SERBAL013var.PROCESS,
      CUSLOT: SERBAL013var.CUSLOT,
      TPKLOT: SERBAL013var.TPKLOT,
      FG: SERBAL013var.FG,
      CUSTOMER: SERBAL013var.CUSTOMER,
      PART: SERBAL013var.PART,
      PARTNAME: SERBAL013var.PARTNAME,
      MATERIAL: SERBAL013var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        SERBAL013var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_SERBAL013_Bloc>()
            .add(TRICKER_SERBAL013geteachITEM());
      },
      ItemPick: SERBAL013var.ItemPick,
      PCS: SERBAL013var.PCS,
      PCSleft: SERBAL013var.PCSleft,
      POINTs: SERBAL013var.POINTs,
      UNIT: SERBAL013var.UNIT,
      INTERSEC: SERBAL013var.INTERSEC,
      RESULTFORMAT: SERBAL013var.RESULTFORMAT,
      Ghtype: SERBAL013var.GRAPHTYPE,
      GAP: SERBAL013var.GAP,
      GAPnameList: SERBAL013var.GAPnameList,
      GAPname: SERBAL013var.GAPname,
      GAPnamePick: (v) {
        SERBAL013var.GAPname = v;
        context
            .read<TRICKER_SERBAL013_Bloc>()
            .add(TRICKER_SERBAL013geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((SERBAL013var.RESULTFORMAT == 'Graph' &&
                SERBAL013var.GAPname != '') ||
            SERBAL013var.RESULTFORMAT != 'Graph') {
          if (SERBAL013var.PCS != '' &&
              SERBAL013var.POINTs != '' &&
              SERBAL013var.ItemPickSELECT != '') {
            if (int.parse(SERBAL013var.POINTs) >
                SERBAL013var.confirmdata.length) {
              context
                  .read<TRICKER_SERBAL013_Bloc>()
                  .add(TRICKER_SERBAL013confirmdata());
            } else {
              WORNINGpop(context, "Have completed POINTs");
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        } else {
          WORNINGpop(context, "Please select GRAPH");
        }
      },
      FINISH: (v) {
        if (SERBAL013var.PCS != '' &&
            SERBAL013var.POINTs != '' &&
            SERBAL013var.ItemPickSELECT != '') {
          if (int.parse(SERBAL013var.POINTs) ==
              SERBAL013var.confirmdata.length) {
            if (int.parse(SERBAL013var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_SERBAL013_Bloc>()
                  .add(TRICKER_SERBAL013FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: SERBAL013var.preview,
      confirmdata: SERBAL013var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_SERBAL013_Bloc>().add(TRICKER_SERBAL013CLEAR());
      },
      BACKPAGE: (v) {
        SERBAL013var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        SERBAL013var.ItemPickSELECT = '';
        context.read<TRICKER_SERBAL013_Bloc>().add(TRICKER_SERBAL013SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_SERBAL013_Bloc>()
            .add(TRICKER_SERBAL013RESETVALUE());
      },
      ITEMleftUNIT: SERBAL013var.ITEMleftUNIT,
      ITEMleftVALUE: SERBAL013var.ITEMleftVALUE,
    );
  }
}
