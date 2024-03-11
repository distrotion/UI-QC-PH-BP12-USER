import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/08-01-CTCSEM001.dart';
import '../../bloc/BlocEvent/08-02-TrickCTCSEM001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';

import '../../widget/QCWIDGET/W1SINGLESHOTKEY/SINGLESHOTKEYwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'CTCSEM001var.dart';

class MICROVICKER_CTCSEM001main extends StatelessWidget {
  MICROVICKER_CTCSEM001main({Key? key, this.data}) : super(key: key);
  CTCSEM001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_CTCSEM001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_CTCSEM001_BlocBuffer extends StatelessWidget {
  _TRICKER_CTCSEM001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  CTCSEM001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_CTCSEM001_Bloc(),
        child: BlocBuilder<TRICKER_CTCSEM001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_CTCSEM001body(data: data);
          },
        ));
  }
}

class ROCKWELL_CTCSEM001body extends StatefulWidget {
  ROCKWELL_CTCSEM001body({Key? key, this.data}) : super(key: key);
  CTCSEM001SCHEMA? data;

  @override
  State<ROCKWELL_CTCSEM001body> createState() => _ROCKWELL_CTCSEM001bodyState();
}

class _ROCKWELL_CTCSEM001bodyState extends State<ROCKWELL_CTCSEM001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<CTCSEM001_Bloc>().add(CTCSEM001_READ());
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
    CTCSEM001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    CTCSEM001var.ItemPickSELECT = '';
    // CTCSEM001var.SINGLEINPUT = '';
    context.read<TRICKER_CTCSEM001_Bloc>().add(TRICKER_CTCSEM001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 5;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        CTCSEM001var.PO = widget.data?.PO ?? '';
        CTCSEM001var.CP = widget.data?.CP ?? '';
        CTCSEM001var.QTY = widget.data?.QTY ?? '';
        CTCSEM001var.PROCESS = widget.data?.PROCESS ?? '';
        CTCSEM001var.CUSLOT = widget.data?.CUSLOT ?? '';
        CTCSEM001var.TPKLOT = widget.data?.TPKLOT ?? '';
        CTCSEM001var.FG = widget.data?.FG ?? '';
        CTCSEM001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        CTCSEM001var.PART = widget.data?.PART ?? '';
        CTCSEM001var.PARTNAME = widget.data?.PARTNAME ?? '';
        CTCSEM001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        CTCSEM001var.ItemPick = widget.data?.ItemPick ?? [''];
        CTCSEM001var.PCS = widget.data?.PCS ?? '';
        // CTCSEM001var.PCS = '10';
        CTCSEM001var.PCSleft = widget.data?.PCSleft ?? '';
        // CTCSEM001var.PCSleft = '10';
        CTCSEM001var.POINTs = widget.data?.POINTs ?? '';
        // CTCSEM001var.POINTs = '10';
        // if (CTCSEM001var.ItemPickSELECT != "") {
        //   //
        //   if (CTCSEM001var.POINTs == "") {
        //     //
        //     CTCSEM001var.POINTs == "0";
        //   }
        // }
        CTCSEM001var.UNIT = widget.data?.UNIT ?? '';
        // CTCSEM001var.UNIT = 'pcs/lots';
        CTCSEM001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        CTCSEM001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        CTCSEM001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        CTCSEM001var.GAP = widget.data?.GAP ?? '';
        CTCSEM001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        CTCSEM001var.preview = widget.data?.preview ?? [];
        CTCSEM001var.confirmdata = widget.data?.confirmdata ?? [];
        CTCSEM001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        CTCSEM001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (CTCSEM001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<CTCSEM001_Bloc>().add(CTCSEM001_READ());
      });
      CTCSEM001var.DHtimer = timer;
    }
    return SINGLESHOTKEYmain(
      //------ Left
      LABEL: "CTC-SEM-001",
      PO: CTCSEM001var.PO,
      CP: CTCSEM001var.CP,
      QTY: CTCSEM001var.QTY,
      PROCESS: CTCSEM001var.PROCESS,
      CUSLOT: CTCSEM001var.CUSLOT,
      TPKLOT: CTCSEM001var.TPKLOT,
      FG: CTCSEM001var.FG,
      CUSTOMER: CTCSEM001var.CUSTOMER,
      PART: CTCSEM001var.PART,
      PARTNAME: CTCSEM001var.PARTNAME,
      MATERIAL: CTCSEM001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        CTCSEM001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_CTCSEM001_Bloc>()
            .add(TRICKER_CTCSEM001geteachITEM());
      },
      ItemPick: CTCSEM001var.ItemPick,
      PCS: CTCSEM001var.PCS,
      PCSleft: CTCSEM001var.PCSleft,
      POINTs: CTCSEM001var.POINTs,
      UNIT: CTCSEM001var.UNIT,
      INTERSEC: CTCSEM001var.INTERSEC,
      RESULTFORMAT: CTCSEM001var.RESULTFORMAT,
      Ghtype: CTCSEM001var.GRAPHTYPE,
      GAP: CTCSEM001var.GAP,
      GAPnameList: CTCSEM001var.GAPnameList,
      GAPname: CTCSEM001var.GAPname,
      GAPnamePick: (v) {
        CTCSEM001var.GAPname = v;
        context
            .read<TRICKER_CTCSEM001_Bloc>()
            .add(TRICKER_CTCSEM001geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((CTCSEM001var.RESULTFORMAT == 'Graph' &&
                CTCSEM001var.GAPname != '') ||
            CTCSEM001var.RESULTFORMAT != 'Graph') {
          if (CTCSEM001var.PCS != '' &&
              CTCSEM001var.POINTs != '' &&
              CTCSEM001var.ItemPickSELECT != '' &&
              CTCSEM001var.SINGLEINPUT != '') {
            if (int.parse(CTCSEM001var.POINTs) >
                CTCSEM001var.confirmdata.length) {
              // context
              //     .read<TRICKER_CTCSEM001_Bloc>()
              //     .add(TRICKER_CTCSEM001confirmdata());
              context
                  .read<TRICKER_CTCSEM001_Bloc>()
                  .add(TRICKER_CTCSEM001preview());
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
        if (CTCSEM001var.PCS != '' &&
            CTCSEM001var.POINTs != '' &&
            CTCSEM001var.ItemPickSELECT != '') {
          if (int.parse(CTCSEM001var.POINTs) ==
              CTCSEM001var.confirmdata.length) {
            if (int.parse(CTCSEM001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_CTCSEM001_Bloc>()
                  .add(TRICKER_CTCSEM001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      READ: (v) {
        print(v);
        if (CTCSEM001var.SINGLEINPUT != '') {
          context
              .read<TRICKER_CTCSEM001_Bloc>()
              .add(TRICKER_CTCSEM001preview());
        }
      },
      preview: CTCSEM001var.preview,
      iscon01: CTCSEM001var.iscon01,
      input: CTCSEM001var.SINGLEINPUT,
      inputFN: (v) {
        CTCSEM001var.SINGLEINPUT = v;
      },
      confirmdata: CTCSEM001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_CTCSEM001_Bloc>().add(TRICKER_CTCSEM001CLEAR());
      },
      BACKPAGE: (v) {
        CTCSEM001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        CTCSEM001var.ItemPickSELECT = '';
        // CTCSEM001var.SINGLEINPUT = '';
        context.read<TRICKER_CTCSEM001_Bloc>().add(TRICKER_CTCSEM001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_CTCSEM001_Bloc>()
            .add(TRICKER_CTCSEM001RESETVALUE());
      },
      ITEMleftUNIT: CTCSEM001var.ITEMleftUNIT,
      ITEMleftVALUE: CTCSEM001var.ITEMleftVALUE,
      NATAP: (v) {
        CTCSEM001var.SINGLEINPUT = '0';
        if (CTCSEM001var.PCS != '' &&
            CTCSEM001var.POINTs != '' &&
            CTCSEM001var.ItemPickSELECT != '' &&
            CTCSEM001var.SINGLEINPUT != '') {
          if (int.parse(CTCSEM001var.POINTs) >
              CTCSEM001var.confirmdata.length) {
            // context
            //     .read<TRICKER_CTCSEM001_Bloc>()
            //     .add(TRICKER_CTCSEM001confirmdata());
            CTCSEM001var.iscon01 = true;
            context
                .read<TRICKER_CTCSEM001_Bloc>()
                .add(TRICKER_CTCSEM001preview());
          } else {
            WORNINGpop(context, "Have completed POINTs");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
    );
  }
}
