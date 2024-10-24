import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/05-01-SURRGH001.dart';
import '../../bloc/BlocEvent/05-02-TrickSURRGH001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'SURRGH001var.dart';

class ROUGHNESS_SURRGH001main extends StatelessWidget {
  ROUGHNESS_SURRGH001main({Key? key, this.data}) : super(key: key);
  SURRGH001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_SURRGH001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_SURRGH001_BlocBuffer extends StatelessWidget {
  _TRICKER_SURRGH001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  SURRGH001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_SURRGH001_Bloc(),
        child: BlocBuilder<TRICKER_SURRGH001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_SURRGH001body(data: data);
          },
        ));
  }
}

class ROCKWELL_SURRGH001body extends StatefulWidget {
  ROCKWELL_SURRGH001body({Key? key, this.data}) : super(key: key);
  SURRGH001SCHEMA? data;

  @override
  State<ROCKWELL_SURRGH001body> createState() => _ROCKWELL_SURRGH001bodyState();
}

class _ROCKWELL_SURRGH001bodyState extends State<ROCKWELL_SURRGH001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<SURRGH001_Bloc>().add(SURRGH001_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
    SURRGH001var.DHtimer.cancel();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    SURRGH001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    SURRGH001var.ItemPickSELECT = '';
    context.read<TRICKER_SURRGH001_Bloc>().add(TRICKER_SURRGH001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 4;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        SURRGH001var.PO = widget.data?.PO ?? '';
        SURRGH001var.CP = widget.data?.CP ?? '';
        SURRGH001var.QTY = widget.data?.QTY ?? '';
        SURRGH001var.PROCESS = widget.data?.PROCESS ?? '';
        SURRGH001var.CUSLOT = widget.data?.CUSLOT ?? '';
        SURRGH001var.TPKLOT = widget.data?.TPKLOT ?? '';
        SURRGH001var.FG = widget.data?.FG ?? '';
        SURRGH001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        SURRGH001var.PART = widget.data?.PART ?? '';
        SURRGH001var.PARTNAME = widget.data?.PARTNAME ?? '';
        SURRGH001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        SURRGH001var.ItemPick = widget.data?.ItemPick ?? [''];
        SURRGH001var.PCS = widget.data?.PCS ?? '';
        // SURRGH001var.PCS = '10';
        SURRGH001var.PCSleft = widget.data?.PCSleft ?? '';
        // SURRGH001var.PCSleft = '10';
        SURRGH001var.POINTs = widget.data?.POINTs ?? '';
        // SURRGH001var.POINTs = '10';
        SURRGH001var.UNIT = widget.data?.UNIT ?? '';
        // SURRGH001var.UNIT = 'pcs/lots';
        SURRGH001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        SURRGH001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        SURRGH001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        SURRGH001var.GAP = widget.data?.GAP ?? '';
        SURRGH001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        SURRGH001var.preview = widget.data?.preview ?? [];
        SURRGH001var.confirmdata = widget.data?.confirmdata ?? [];
        SURRGH001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        SURRGH001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        SURRGH001var.REFLOT = widget.data?.REFLOT ?? '';

        if (SURRGH001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<SURRGH001_Bloc>().add(SURRGH001_READ());
      });
      SURRGH001var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "SER-RGH-001",
      PO: SURRGH001var.PO,
      CP: SURRGH001var.CP,
      QTY: SURRGH001var.QTY,
      PROCESS: SURRGH001var.PROCESS,
      CUSLOT: SURRGH001var.CUSLOT,
      TPKLOT: SURRGH001var.TPKLOT,
      FG: SURRGH001var.FG,
      CUSTOMER: SURRGH001var.CUSTOMER,
      PART: SURRGH001var.PART,
      PARTNAME: SURRGH001var.PARTNAME,
      MATERIAL: SURRGH001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        SURRGH001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_SURRGH001_Bloc>()
            .add(TRICKER_SURRGH001geteachITEM());
      },
      ItemPick: SURRGH001var.ItemPick,
      PCS: SURRGH001var.PCS,
      PCSleft: SURRGH001var.PCSleft,
      POINTs: SURRGH001var.POINTs,
      UNIT: SURRGH001var.UNIT,
      INTERSEC: SURRGH001var.INTERSEC,
      RESULTFORMAT: SURRGH001var.RESULTFORMAT,
      Ghtype: SURRGH001var.GRAPHTYPE,
      GAP: SURRGH001var.GAP,
      GAPnameList: SURRGH001var.GAPnameList,
      GAPname: SURRGH001var.GAPname,
      GAPnamePick: (v) {
        SURRGH001var.GAPname = v;
        context
            .read<TRICKER_SURRGH001_Bloc>()
            .add(TRICKER_SURRGH001geteachGRAPH());
      },
      //------- Bottom
      REFLOT: SURRGH001var.REFLOT,
      REFLOTfn: (v) {
        if (SURRGH001var.REFLOT != '') {
          context.read<TRICKER_SURRGH001_Bloc>().add(TRICKER_SURRGH001REFER());
        }
      },
      ACCEPT: (v) {
        if ((SURRGH001var.RESULTFORMAT == 'Graph' &&
                SURRGH001var.GAPname != '') ||
            SURRGH001var.RESULTFORMAT != 'Graph') {
          if (SURRGH001var.PCS != '' &&
              SURRGH001var.POINTs != '' &&
              SURRGH001var.ItemPickSELECT != '') {
            if (int.parse(SURRGH001var.POINTs) >
                SURRGH001var.confirmdata.length) {
              context
                  .read<TRICKER_SURRGH001_Bloc>()
                  .add(TRICKER_SURRGH001confirmdata());
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
        if (SURRGH001var.PCS != '' &&
            SURRGH001var.POINTs != '' &&
            SURRGH001var.ItemPickSELECT != '') {
          if (int.parse(SURRGH001var.POINTs) ==
              SURRGH001var.confirmdata.length) {
            if (int.parse(SURRGH001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_SURRGH001_Bloc>()
                  .add(TRICKER_SURRGH001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: SURRGH001var.preview,
      confirmdata: SURRGH001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_SURRGH001_Bloc>().add(TRICKER_SURRGH001CLEAR());
      },
      BACKPAGE: (v) {
        SURRGH001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        SURRGH001var.ItemPickSELECT = '';
        context.read<TRICKER_SURRGH001_Bloc>().add(TRICKER_SURRGH001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_SURRGH001_Bloc>()
            .add(TRICKER_SURRGH001RESETVALUE());
      },
      ITEMleftUNIT: SURRGH001var.ITEMleftUNIT,
      ITEMleftVALUE: SURRGH001var.ITEMleftVALUE,
    );
  }
}
