import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/05-01-SERRGH001.dart';
import '../../bloc/BlocEvent/05-02-TrickSERRGH001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'SERRGH001var.dart';

class ROUGHNESS_SERRGH001main extends StatelessWidget {
  ROUGHNESS_SERRGH001main({Key? key, this.data}) : super(key: key);
  SERRGH001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_SERRGH001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_SERRGH001_BlocBuffer extends StatelessWidget {
  _TRICKER_SERRGH001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  SERRGH001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_SERRGH001_Bloc(),
        child: BlocBuilder<TRICKER_SERRGH001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_SERRGH001body(data: data);
          },
        ));
  }
}

class ROCKWELL_SERRGH001body extends StatefulWidget {
  ROCKWELL_SERRGH001body({Key? key, this.data}) : super(key: key);
  SERRGH001SCHEMA? data;

  @override
  State<ROCKWELL_SERRGH001body> createState() => _ROCKWELL_SERRGH001bodyState();
}

class _ROCKWELL_SERRGH001bodyState extends State<ROCKWELL_SERRGH001body> {
  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
    // context.read<SERRGH001_Bloc>().add(SERRGH001_READ());
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
    SERRGH001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    SERRGH001var.ItemPickSELECT = '';
    context.read<TRICKER_SERRGH001_Bloc>().add(TRICKER_SERRGH001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        SERRGH001var.PO = widget.data?.PO ?? '';
        SERRGH001var.CP = widget.data?.CP ?? '';
        SERRGH001var.QTY = widget.data?.QTY ?? '';
        SERRGH001var.PROCESS = widget.data?.PROCESS ?? '';
        SERRGH001var.CUSLOT = widget.data?.CUSLOT ?? '';
        SERRGH001var.TPKLOT = widget.data?.TPKLOT ?? '';
        SERRGH001var.FG = widget.data?.FG ?? '';
        SERRGH001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        SERRGH001var.PART = widget.data?.PART ?? '';
        SERRGH001var.PARTNAME = widget.data?.PARTNAME ?? '';
        SERRGH001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        SERRGH001var.ItemPick = widget.data?.ItemPick ?? [''];
        SERRGH001var.PCS = widget.data?.PCS ?? '';
        // SERRGH001var.PCS = '10';
        SERRGH001var.PCSleft = widget.data?.PCSleft ?? '';
        // SERRGH001var.PCSleft = '10';
        SERRGH001var.POINTs = widget.data?.POINTs ?? '';
        // SERRGH001var.POINTs = '10';
        SERRGH001var.UNIT = widget.data?.UNIT ?? '';
        // SERRGH001var.UNIT = 'pcs/lots';
        SERRGH001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        SERRGH001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        SERRGH001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        SERRGH001var.GAP = widget.data?.GAP ?? '';
        SERRGH001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        SERRGH001var.preview = widget.data?.preview ?? [];
        SERRGH001var.confirmdata = widget.data?.confirmdata ?? [];
        SERRGH001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        SERRGH001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (SERRGH001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<SERRGH001_Bloc>().add(SERRGH001_READ());
      });
      SERRGH001var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "SER-RGH-001",
      PO: SERRGH001var.PO,
      CP: SERRGH001var.CP,
      QTY: SERRGH001var.QTY,
      PROCESS: SERRGH001var.PROCESS,
      CUSLOT: SERRGH001var.CUSLOT,
      TPKLOT: SERRGH001var.TPKLOT,
      FG: SERRGH001var.FG,
      CUSTOMER: SERRGH001var.CUSTOMER,
      PART: SERRGH001var.PART,
      PARTNAME: SERRGH001var.PARTNAME,
      MATERIAL: SERRGH001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        SERRGH001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_SERRGH001_Bloc>()
            .add(TRICKER_SERRGH001geteachITEM());
      },
      ItemPick: SERRGH001var.ItemPick,
      PCS: SERRGH001var.PCS,
      PCSleft: SERRGH001var.PCSleft,
      POINTs: SERRGH001var.POINTs,
      UNIT: SERRGH001var.UNIT,
      INTERSEC: SERRGH001var.INTERSEC,
      RESULTFORMAT: SERRGH001var.RESULTFORMAT,
      Ghtype: SERRGH001var.GRAPHTYPE,
      GAP: SERRGH001var.GAP,
      GAPnameList: SERRGH001var.GAPnameList,
      GAPname: SERRGH001var.GAPname,
      GAPnamePick: (v) {
        SERRGH001var.GAPname = v;
        context
            .read<TRICKER_SERRGH001_Bloc>()
            .add(TRICKER_SERRGH001geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((SERRGH001var.RESULTFORMAT == 'Graph' &&
                SERRGH001var.GAPname != '') ||
            SERRGH001var.RESULTFORMAT != 'Graph') {
          if (SERRGH001var.PCS != '' &&
              SERRGH001var.POINTs != '' &&
              SERRGH001var.ItemPickSELECT != '') {
            if (int.parse(SERRGH001var.POINTs) >
                SERRGH001var.confirmdata.length) {
              context
                  .read<TRICKER_SERRGH001_Bloc>()
                  .add(TRICKER_SERRGH001confirmdata());
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
        if (SERRGH001var.PCS != '' &&
            SERRGH001var.POINTs != '' &&
            SERRGH001var.ItemPickSELECT != '') {
          if (int.parse(SERRGH001var.POINTs) ==
              SERRGH001var.confirmdata.length) {
            if (int.parse(SERRGH001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_SERRGH001_Bloc>()
                  .add(TRICKER_SERRGH001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: SERRGH001var.preview,
      confirmdata: SERRGH001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_SERRGH001_Bloc>().add(TRICKER_SERRGH001CLEAR());
      },
      BACKPAGE: (v) {
        SERRGH001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        SERRGH001var.ItemPickSELECT = '';
        context.read<TRICKER_SERRGH001_Bloc>().add(TRICKER_SERRGH001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_SERRGH001_Bloc>()
            .add(TRICKER_SERRGH001RESETVALUE());
      },
      ITEMleftUNIT: SERRGH001var.ITEMleftUNIT,
      ITEMleftVALUE: SERRGH001var.ITEMleftVALUE,
    );
  }
}
