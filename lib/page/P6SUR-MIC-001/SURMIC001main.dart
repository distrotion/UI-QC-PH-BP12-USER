import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/06-01-SURMIC001.dart';
import '../../bloc/BlocEvent/06-02-TrickSURMIC001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'SURMIC001var.dart';

class MICROSC_SURMIC001main extends StatelessWidget {
  MICROSC_SURMIC001main({Key? key, this.data}) : super(key: key);
  SURMIC001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_SURMIC001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_SURMIC001_BlocBuffer extends StatelessWidget {
  _TRICKER_SURMIC001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  SURMIC001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_SURMIC001_Bloc(),
        child: BlocBuilder<TRICKER_SURMIC001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_SURMIC001body(data: data);
          },
        ));
  }
}

class ROCKWELL_SURMIC001body extends StatefulWidget {
  ROCKWELL_SURMIC001body({Key? key, this.data}) : super(key: key);
  SURMIC001SCHEMA? data;

  @override
  State<ROCKWELL_SURMIC001body> createState() => _ROCKWELL_SURMIC001bodyState();
}

class _ROCKWELL_SURMIC001bodyState extends State<ROCKWELL_SURMIC001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<SURMIC001_Bloc>().add(SURMIC001_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
    SURMIC001var.DHtimer.cancel();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    SURMIC001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    SURMIC001var.ItemPickSELECT = '';
    context.read<TRICKER_SURMIC001_Bloc>().add(TRICKER_SURMIC001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        SURMIC001var.PO = widget.data?.PO ?? '';
        SURMIC001var.CP = widget.data?.CP ?? '';
        SURMIC001var.QTY = widget.data?.QTY ?? '';
        SURMIC001var.PROCESS = widget.data?.PROCESS ?? '';
        SURMIC001var.CUSLOT = widget.data?.CUSLOT ?? '';
        SURMIC001var.TPKLOT = widget.data?.TPKLOT ?? '';
        SURMIC001var.FG = widget.data?.FG ?? '';
        SURMIC001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        SURMIC001var.PART = widget.data?.PART ?? '';
        SURMIC001var.PARTNAME = widget.data?.PARTNAME ?? '';
        SURMIC001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        SURMIC001var.ItemPick = widget.data?.ItemPick ?? [''];
        SURMIC001var.PCS = widget.data?.PCS ?? '';
        // SURMIC001var.PCS = '10';
        SURMIC001var.PCSleft = widget.data?.PCSleft ?? '';
        // SURMIC001var.PCSleft = '10';
        SURMIC001var.POINTs = widget.data?.POINTs ?? '';
        // SURMIC001var.POINTs = '10';
        SURMIC001var.UNIT = widget.data?.UNIT ?? '';
        // SURMIC001var.UNIT = 'pcs/lots';
        SURMIC001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        SURMIC001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        SURMIC001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        SURMIC001var.GAP = widget.data?.GAP ?? '';
        SURMIC001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        SURMIC001var.preview = widget.data?.preview ?? [];
        SURMIC001var.confirmdata = widget.data?.confirmdata ?? [];
        SURMIC001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        SURMIC001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        SURMIC001var.REFLOT = widget.data?.REFLOT ?? '';

        if (SURMIC001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<SURMIC001_Bloc>().add(SURMIC001_READ());
      });
      SURMIC001var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "SER-MIC-001",
      PO: SURMIC001var.PO,
      CP: SURMIC001var.CP,
      QTY: SURMIC001var.QTY,
      PROCESS: SURMIC001var.PROCESS,
      CUSLOT: SURMIC001var.CUSLOT,
      TPKLOT: SURMIC001var.TPKLOT,
      FG: SURMIC001var.FG,
      CUSTOMER: SURMIC001var.CUSTOMER,
      PART: SURMIC001var.PART,
      PARTNAME: SURMIC001var.PARTNAME,
      MATERIAL: SURMIC001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        SURMIC001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_SURMIC001_Bloc>()
            .add(TRICKER_SURMIC001geteachITEM());
      },
      ItemPick: SURMIC001var.ItemPick,
      PCS: SURMIC001var.PCS,
      PCSleft: SURMIC001var.PCSleft,
      POINTs: SURMIC001var.POINTs,
      UNIT: SURMIC001var.UNIT,
      INTERSEC: SURMIC001var.INTERSEC,
      RESULTFORMAT: SURMIC001var.RESULTFORMAT,
      Ghtype: SURMIC001var.GRAPHTYPE,
      GAP: SURMIC001var.GAP,
      GAPnameList: SURMIC001var.GAPnameList,
      GAPname: SURMIC001var.GAPname,
      GAPnamePick: (v) {
        SURMIC001var.GAPname = v;
        context
            .read<TRICKER_SURMIC001_Bloc>()
            .add(TRICKER_SURMIC001geteachGRAPH());
      },
      //------- Bottom
      REFLOT: SURMIC001var.REFLOT,
      REFLOTfn: (v) {
        if (SURMIC001var.REFLOT != '') {
          context.read<TRICKER_SURMIC001_Bloc>().add(TRICKER_SURMIC001REFER());
        }
      },
      ACCEPT: (v) {
        if ((SURMIC001var.RESULTFORMAT == 'Graph' &&
                SURMIC001var.GAPname != '') ||
            SURMIC001var.RESULTFORMAT != 'Graph') {
          if (SURMIC001var.PCS != '' &&
              SURMIC001var.POINTs != '' &&
              SURMIC001var.ItemPickSELECT != '') {
            if (int.parse(SURMIC001var.POINTs) >
                SURMIC001var.confirmdata.length) {
              context
                  .read<TRICKER_SURMIC001_Bloc>()
                  .add(TRICKER_SURMIC001confirmdata());
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
        if (SURMIC001var.PCS != '' &&
            SURMIC001var.POINTs != '' &&
            SURMIC001var.ItemPickSELECT != '') {
          if (int.parse(SURMIC001var.POINTs) ==
              SURMIC001var.confirmdata.length) {
            if (int.parse(SURMIC001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_SURMIC001_Bloc>()
                  .add(TRICKER_SURMIC001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: SURMIC001var.preview,
      confirmdata: SURMIC001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_SURMIC001_Bloc>().add(TRICKER_SURMIC001CLEAR());
      },
      BACKPAGE: (v) {
        SURMIC001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        SURMIC001var.ItemPickSELECT = '';
        context.read<TRICKER_SURMIC001_Bloc>().add(TRICKER_SURMIC001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_SURMIC001_Bloc>()
            .add(TRICKER_SURMIC001RESETVALUE());
      },
      ITEMleftUNIT: SURMIC001var.ITEMleftUNIT,
      ITEMleftVALUE: SURMIC001var.ITEMleftVALUE,
    );
  }
}
