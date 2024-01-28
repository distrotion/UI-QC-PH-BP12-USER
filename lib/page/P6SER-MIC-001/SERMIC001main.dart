import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/06-01-SERMIC001.dart';
import '../../bloc/BlocEvent/06-02-TrickSERMIC001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'SERMIC001var.dart';

class MICROSC_SERMIC001main extends StatelessWidget {
  MICROSC_SERMIC001main({Key? key, this.data}) : super(key: key);
  SERMIC001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_SERMIC001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_SERMIC001_BlocBuffer extends StatelessWidget {
  _TRICKER_SERMIC001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  SERMIC001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_SERMIC001_Bloc(),
        child: BlocBuilder<TRICKER_SERMIC001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_SERMIC001body(data: data);
          },
        ));
  }
}

class ROCKWELL_SERMIC001body extends StatefulWidget {
  ROCKWELL_SERMIC001body({Key? key, this.data}) : super(key: key);
  SERMIC001SCHEMA? data;

  @override
  State<ROCKWELL_SERMIC001body> createState() => _ROCKWELL_SERMIC001bodyState();
}

class _ROCKWELL_SERMIC001bodyState extends State<ROCKWELL_SERMIC001body> {
  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
    // context.read<SERMIC001_Bloc>().add(SERMIC001_READ());
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
    SERMIC001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    SERMIC001var.ItemPickSELECT = '';
    context.read<TRICKER_SERMIC001_Bloc>().add(TRICKER_SERMIC001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        SERMIC001var.PO = widget.data?.PO ?? '';
        SERMIC001var.CP = widget.data?.CP ?? '';
        SERMIC001var.QTY = widget.data?.QTY ?? '';
        SERMIC001var.PROCESS = widget.data?.PROCESS ?? '';
        SERMIC001var.CUSLOT = widget.data?.CUSLOT ?? '';
        SERMIC001var.TPKLOT = widget.data?.TPKLOT ?? '';
        SERMIC001var.FG = widget.data?.FG ?? '';
        SERMIC001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        SERMIC001var.PART = widget.data?.PART ?? '';
        SERMIC001var.PARTNAME = widget.data?.PARTNAME ?? '';
        SERMIC001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        SERMIC001var.ItemPick = widget.data?.ItemPick ?? [''];
        SERMIC001var.PCS = widget.data?.PCS ?? '';
        // SERMIC001var.PCS = '10';
        SERMIC001var.PCSleft = widget.data?.PCSleft ?? '';
        // SERMIC001var.PCSleft = '10';
        SERMIC001var.POINTs = widget.data?.POINTs ?? '';
        // SERMIC001var.POINTs = '10';
        SERMIC001var.UNIT = widget.data?.UNIT ?? '';
        // SERMIC001var.UNIT = 'pcs/lots';
        SERMIC001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        SERMIC001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        SERMIC001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        SERMIC001var.GAP = widget.data?.GAP ?? '';
        SERMIC001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        SERMIC001var.preview = widget.data?.preview ?? [];
        SERMIC001var.confirmdata = widget.data?.confirmdata ?? [];
        SERMIC001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        SERMIC001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (SERMIC001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<SERMIC001_Bloc>().add(SERMIC001_READ());
      });
      SERMIC001var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "SER-MIC-001",
      PO: SERMIC001var.PO,
      CP: SERMIC001var.CP,
      QTY: SERMIC001var.QTY,
      PROCESS: SERMIC001var.PROCESS,
      CUSLOT: SERMIC001var.CUSLOT,
      TPKLOT: SERMIC001var.TPKLOT,
      FG: SERMIC001var.FG,
      CUSTOMER: SERMIC001var.CUSTOMER,
      PART: SERMIC001var.PART,
      PARTNAME: SERMIC001var.PARTNAME,
      MATERIAL: SERMIC001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        SERMIC001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_SERMIC001_Bloc>()
            .add(TRICKER_SERMIC001geteachITEM());
      },
      ItemPick: SERMIC001var.ItemPick,
      PCS: SERMIC001var.PCS,
      PCSleft: SERMIC001var.PCSleft,
      POINTs: SERMIC001var.POINTs,
      UNIT: SERMIC001var.UNIT,
      INTERSEC: SERMIC001var.INTERSEC,
      RESULTFORMAT: SERMIC001var.RESULTFORMAT,
      Ghtype: SERMIC001var.GRAPHTYPE,
      GAP: SERMIC001var.GAP,
      GAPnameList: SERMIC001var.GAPnameList,
      GAPname: SERMIC001var.GAPname,
      GAPnamePick: (v) {
        SERMIC001var.GAPname = v;
        context
            .read<TRICKER_SERMIC001_Bloc>()
            .add(TRICKER_SERMIC001geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((SERMIC001var.RESULTFORMAT == 'Graph' &&
                SERMIC001var.GAPname != '') ||
            SERMIC001var.RESULTFORMAT != 'Graph') {
          if (SERMIC001var.PCS != '' &&
              SERMIC001var.POINTs != '' &&
              SERMIC001var.ItemPickSELECT != '') {
            if (int.parse(SERMIC001var.POINTs) >
                SERMIC001var.confirmdata.length) {
              context
                  .read<TRICKER_SERMIC001_Bloc>()
                  .add(TRICKER_SERMIC001confirmdata());
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
        if (SERMIC001var.PCS != '' &&
            SERMIC001var.POINTs != '' &&
            SERMIC001var.ItemPickSELECT != '') {
          if (int.parse(SERMIC001var.POINTs) ==
              SERMIC001var.confirmdata.length) {
            if (int.parse(SERMIC001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_SERMIC001_Bloc>()
                  .add(TRICKER_SERMIC001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: SERMIC001var.preview,
      confirmdata: SERMIC001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_SERMIC001_Bloc>().add(TRICKER_SERMIC001CLEAR());
      },
      BACKPAGE: (v) {
        SERMIC001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        SERMIC001var.ItemPickSELECT = '';
        context.read<TRICKER_SERMIC001_Bloc>().add(TRICKER_SERMIC001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_SERMIC001_Bloc>()
            .add(TRICKER_SERMIC001RESETVALUE());
      },
      ITEMleftUNIT: SERMIC001var.ITEMleftUNIT,
      ITEMleftVALUE: SERMIC001var.ITEMleftVALUE,
    );
  }
}
