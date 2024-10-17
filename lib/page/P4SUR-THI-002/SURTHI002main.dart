import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-01-SURTHI002.dart';
import '../../bloc/BlocEvent/04-02-TrickSURTHI002.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'SURTHI002var.dart';

class THICKNESS_SURTHI002main extends StatelessWidget {
  THICKNESS_SURTHI002main({Key? key, this.data}) : super(key: key);
  SURTHI002SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_SURTHI002_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_SURTHI002_BlocBuffer extends StatelessWidget {
  _TRICKER_SURTHI002_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  SURTHI002SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_SURTHI002_Bloc(),
        child: BlocBuilder<TRICKER_SURTHI002_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_SURTHI002body(data: data);
          },
        ));
  }
}

class ROCKWELL_SURTHI002body extends StatefulWidget {
  ROCKWELL_SURTHI002body({Key? key, this.data}) : super(key: key);
  SURTHI002SCHEMA? data;

  @override
  State<ROCKWELL_SURTHI002body> createState() => _ROCKWELL_SURTHI002bodyState();
}

class _ROCKWELL_SURTHI002bodyState extends State<ROCKWELL_SURTHI002body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<SURTHI002_Bloc>().add(SURTHI002_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
    SURTHI002var.DHtimer.cancel();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    SURTHI002var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    SURTHI002var.ItemPickSELECT = '';
    context.read<TRICKER_SURTHI002_Bloc>().add(TRICKER_SURTHI002SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        SURTHI002var.PO = widget.data?.PO ?? '';
        SURTHI002var.CP = widget.data?.CP ?? '';
        SURTHI002var.QTY = widget.data?.QTY ?? '';
        SURTHI002var.PROCESS = widget.data?.PROCESS ?? '';
        SURTHI002var.CUSLOT = widget.data?.CUSLOT ?? '';
        SURTHI002var.TPKLOT = widget.data?.TPKLOT ?? '';
        SURTHI002var.FG = widget.data?.FG ?? '';
        SURTHI002var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        SURTHI002var.PART = widget.data?.PART ?? '';
        SURTHI002var.PARTNAME = widget.data?.PARTNAME ?? '';
        SURTHI002var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        SURTHI002var.ItemPick = widget.data?.ItemPick ?? [''];
        SURTHI002var.PCS = widget.data?.PCS ?? '';
        // SURTHI002var.PCS = '10';
        SURTHI002var.PCSleft = widget.data?.PCSleft ?? '';
        // SURTHI002var.PCSleft = '10';
        SURTHI002var.POINTs = widget.data?.POINTs ?? '';
        // SURTHI002var.POINTs = '10';
        SURTHI002var.UNIT = widget.data?.UNIT ?? '';
        // SURTHI002var.UNIT = 'pcs/lots';
        SURTHI002var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        SURTHI002var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        SURTHI002var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        SURTHI002var.GAP = widget.data?.GAP ?? '';
        SURTHI002var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        SURTHI002var.preview = widget.data?.preview ?? [];
        SURTHI002var.confirmdata = widget.data?.confirmdata ?? [];
        SURTHI002var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        SURTHI002var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (SURTHI002var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<SURTHI002_Bloc>().add(SURTHI002_READ());
      });
      SURTHI002var.DHtimer = timer;
      print("--");
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "SER-THI-002",
      PO: SURTHI002var.PO,
      CP: SURTHI002var.CP,
      QTY: SURTHI002var.QTY,
      PROCESS: SURTHI002var.PROCESS,
      CUSLOT: SURTHI002var.CUSLOT,
      TPKLOT: SURTHI002var.TPKLOT,
      FG: SURTHI002var.FG,
      CUSTOMER: SURTHI002var.CUSTOMER,
      PART: SURTHI002var.PART,
      PARTNAME: SURTHI002var.PARTNAME,
      MATERIAL: SURTHI002var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        SURTHI002var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_SURTHI002_Bloc>()
            .add(TRICKER_SURTHI002geteachITEM());
      },
      ItemPick: SURTHI002var.ItemPick,
      PCS: SURTHI002var.PCS,
      PCSleft: SURTHI002var.PCSleft,
      POINTs: SURTHI002var.POINTs,
      UNIT: SURTHI002var.UNIT,
      INTERSEC: SURTHI002var.INTERSEC,
      RESULTFORMAT: SURTHI002var.RESULTFORMAT,
      Ghtype: SURTHI002var.GRAPHTYPE,
      GAP: SURTHI002var.GAP,
      GAPnameList: SURTHI002var.GAPnameList,
      GAPname: SURTHI002var.GAPname,
      GAPnamePick: (v) {
        SURTHI002var.GAPname = v;
        context
            .read<TRICKER_SURTHI002_Bloc>()
            .add(TRICKER_SURTHI002geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((SURTHI002var.RESULTFORMAT == 'Graph' &&
                SURTHI002var.GAPname != '') ||
            SURTHI002var.RESULTFORMAT != 'Graph') {
          if (SURTHI002var.PCS != '' &&
              SURTHI002var.POINTs != '' &&
              SURTHI002var.ItemPickSELECT != '') {
            if (int.parse(SURTHI002var.POINTs) >
                SURTHI002var.confirmdata.length) {
              context
                  .read<TRICKER_SURTHI002_Bloc>()
                  .add(TRICKER_SURTHI002confirmdata());
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
        if (SURTHI002var.PCS != '' &&
            SURTHI002var.POINTs != '' &&
            SURTHI002var.ItemPickSELECT != '') {
          if (int.parse(SURTHI002var.POINTs) ==
              SURTHI002var.confirmdata.length) {
            if (int.parse(SURTHI002var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_SURTHI002_Bloc>()
                  .add(TRICKER_SURTHI002FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: SURTHI002var.preview,
      confirmdata: SURTHI002var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_SURTHI002_Bloc>().add(TRICKER_SURTHI002CLEAR());
      },
      BACKPAGE: (v) {
        SURTHI002var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        SURTHI002var.ItemPickSELECT = '';
        context.read<TRICKER_SURTHI002_Bloc>().add(TRICKER_SURTHI002SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_SURTHI002_Bloc>()
            .add(TRICKER_SURTHI002RESETVALUE());
      },
      ITEMleftUNIT: SURTHI002var.ITEMleftUNIT,
      ITEMleftVALUE: SURTHI002var.ITEMleftVALUE,
    );
  }
}
