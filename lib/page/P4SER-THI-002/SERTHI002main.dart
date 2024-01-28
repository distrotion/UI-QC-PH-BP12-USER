import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-01-SERTHI002.dart';
import '../../bloc/BlocEvent/04-02-TrickSERTHI002.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'SERTHI002var.dart';

class THICKNESS_SERTHI002main extends StatelessWidget {
  THICKNESS_SERTHI002main({Key? key, this.data}) : super(key: key);
  SERTHI002SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_SERTHI002_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_SERTHI002_BlocBuffer extends StatelessWidget {
  _TRICKER_SERTHI002_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  SERTHI002SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_SERTHI002_Bloc(),
        child: BlocBuilder<TRICKER_SERTHI002_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_SERTHI002body(data: data);
          },
        ));
  }
}

class ROCKWELL_SERTHI002body extends StatefulWidget {
  ROCKWELL_SERTHI002body({Key? key, this.data}) : super(key: key);
  SERTHI002SCHEMA? data;

  @override
  State<ROCKWELL_SERTHI002body> createState() => _ROCKWELL_SERTHI002bodyState();
}

class _ROCKWELL_SERTHI002bodyState extends State<ROCKWELL_SERTHI002body> {
  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
    // context.read<SERTHI002_Bloc>().add(SERTHI002_READ());
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
    SERTHI002var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    SERTHI002var.ItemPickSELECT = '';
    context.read<TRICKER_SERTHI002_Bloc>().add(TRICKER_SERTHI002SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        SERTHI002var.PO = widget.data?.PO ?? '';
        SERTHI002var.CP = widget.data?.CP ?? '';
        SERTHI002var.QTY = widget.data?.QTY ?? '';
        SERTHI002var.PROCESS = widget.data?.PROCESS ?? '';
        SERTHI002var.CUSLOT = widget.data?.CUSLOT ?? '';
        SERTHI002var.TPKLOT = widget.data?.TPKLOT ?? '';
        SERTHI002var.FG = widget.data?.FG ?? '';
        SERTHI002var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        SERTHI002var.PART = widget.data?.PART ?? '';
        SERTHI002var.PARTNAME = widget.data?.PARTNAME ?? '';
        SERTHI002var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        SERTHI002var.ItemPick = widget.data?.ItemPick ?? [''];
        SERTHI002var.PCS = widget.data?.PCS ?? '';
        // SERTHI002var.PCS = '10';
        SERTHI002var.PCSleft = widget.data?.PCSleft ?? '';
        // SERTHI002var.PCSleft = '10';
        SERTHI002var.POINTs = widget.data?.POINTs ?? '';
        // SERTHI002var.POINTs = '10';
        SERTHI002var.UNIT = widget.data?.UNIT ?? '';
        // SERTHI002var.UNIT = 'pcs/lots';
        SERTHI002var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        SERTHI002var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        SERTHI002var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        SERTHI002var.GAP = widget.data?.GAP ?? '';
        SERTHI002var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        SERTHI002var.preview = widget.data?.preview ?? [];
        SERTHI002var.confirmdata = widget.data?.confirmdata ?? [];
        SERTHI002var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        SERTHI002var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (SERTHI002var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<SERTHI002_Bloc>().add(SERTHI002_READ());
      });
      SERTHI002var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "SER-THI-002",
      PO: SERTHI002var.PO,
      CP: SERTHI002var.CP,
      QTY: SERTHI002var.QTY,
      PROCESS: SERTHI002var.PROCESS,
      CUSLOT: SERTHI002var.CUSLOT,
      TPKLOT: SERTHI002var.TPKLOT,
      FG: SERTHI002var.FG,
      CUSTOMER: SERTHI002var.CUSTOMER,
      PART: SERTHI002var.PART,
      PARTNAME: SERTHI002var.PARTNAME,
      MATERIAL: SERTHI002var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        SERTHI002var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_SERTHI002_Bloc>()
            .add(TRICKER_SERTHI002geteachITEM());
      },
      ItemPick: SERTHI002var.ItemPick,
      PCS: SERTHI002var.PCS,
      PCSleft: SERTHI002var.PCSleft,
      POINTs: SERTHI002var.POINTs,
      UNIT: SERTHI002var.UNIT,
      INTERSEC: SERTHI002var.INTERSEC,
      RESULTFORMAT: SERTHI002var.RESULTFORMAT,
      Ghtype: SERTHI002var.GRAPHTYPE,
      GAP: SERTHI002var.GAP,
      GAPnameList: SERTHI002var.GAPnameList,
      GAPname: SERTHI002var.GAPname,
      GAPnamePick: (v) {
        SERTHI002var.GAPname = v;
        context
            .read<TRICKER_SERTHI002_Bloc>()
            .add(TRICKER_SERTHI002geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((SERTHI002var.RESULTFORMAT == 'Graph' &&
                SERTHI002var.GAPname != '') ||
            SERTHI002var.RESULTFORMAT != 'Graph') {
          if (SERTHI002var.PCS != '' &&
              SERTHI002var.POINTs != '' &&
              SERTHI002var.ItemPickSELECT != '') {
            if (int.parse(SERTHI002var.POINTs) >
                SERTHI002var.confirmdata.length) {
              context
                  .read<TRICKER_SERTHI002_Bloc>()
                  .add(TRICKER_SERTHI002confirmdata());
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
        if (SERTHI002var.PCS != '' &&
            SERTHI002var.POINTs != '' &&
            SERTHI002var.ItemPickSELECT != '') {
          if (int.parse(SERTHI002var.POINTs) ==
              SERTHI002var.confirmdata.length) {
            if (int.parse(SERTHI002var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_SERTHI002_Bloc>()
                  .add(TRICKER_SERTHI002FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: SERTHI002var.preview,
      confirmdata: SERTHI002var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_SERTHI002_Bloc>().add(TRICKER_SERTHI002CLEAR());
      },
      BACKPAGE: (v) {
        SERTHI002var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        SERTHI002var.ItemPickSELECT = '';
        context.read<TRICKER_SERTHI002_Bloc>().add(TRICKER_SERTHI002SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_SERTHI002_Bloc>()
            .add(TRICKER_SERTHI002RESETVALUE());
      },
      ITEMleftUNIT: SERTHI002var.ITEMleftUNIT,
      ITEMleftVALUE: SERTHI002var.ITEMleftVALUE,
    );
  }
}
