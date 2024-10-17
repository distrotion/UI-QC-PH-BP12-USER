import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/02-01-APPPHBP12.dart';

import '../../bloc/BlocEvent/02-02-TrickAPPPHBP12.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTAPR/SINGLESHOTAPRwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'APPPHBP12var.dart';

class APPEARANCE_APPPHBP12main extends StatelessWidget {
  APPEARANCE_APPPHBP12main({Key? key, this.data}) : super(key: key);
  APPPHBP12SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_APPPHBP12_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_APPPHBP12_BlocBuffer extends StatelessWidget {
  _TRICKER_APPPHBP12_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  APPPHBP12SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_APPPHBP12_Bloc(),
        child: BlocBuilder<TRICKER_APPPHBP12_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_APPPHBP12body(data: data, trick: trick);
          },
        ));
  }
}

class ROCKWELL_APPPHBP12body extends StatefulWidget {
  ROCKWELL_APPPHBP12body({Key? key, this.data, this.trick}) : super(key: key);
  APPPHBP12SCHEMA? data;
  String? trick;

  @override
  State<ROCKWELL_APPPHBP12body> createState() => _ROCKWELL_APPPHBP12bodyState();
}

class _ROCKWELL_APPPHBP12bodyState extends State<ROCKWELL_APPPHBP12body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<APPPHBP12_Bloc>().add(APPPHBP12_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);

    super.dispose();
    APPPHBP12var.DHtimer.cancel();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    APPPHBP12var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    APPPHBP12var.ItemPickSELECT = '';
    context.read<TRICKER_APPPHBP12_Bloc>().add(TRICKER_APPPHBP12SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 8;
    // print(widget.data?.UPDATE);

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        APPPHBP12var.PO = widget.data?.PO ?? '';
        APPPHBP12var.CP = widget.data?.CP ?? '';
        APPPHBP12var.QTY = widget.data?.QTY ?? '';
        APPPHBP12var.PROCESS = widget.data?.PROCESS ?? '';
        APPPHBP12var.CUSLOT = widget.data?.CUSLOT ?? '';
        APPPHBP12var.TPKLOT = widget.data?.TPKLOT ?? '';
        APPPHBP12var.FG = widget.data?.FG ?? '';
        APPPHBP12var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        APPPHBP12var.PART = widget.data?.PART ?? '';
        APPPHBP12var.PARTNAME = widget.data?.PARTNAME ?? '';
        APPPHBP12var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        APPPHBP12var.ItemPick = widget.data?.ItemPick ?? [''];
        APPPHBP12var.PCS = widget.data?.PCS ?? '';
        // APPPHBP12var.PCS = '10';
        APPPHBP12var.PCSleft = widget.data?.PCSleft ?? '';
        // APPPHBP12var.PCSleft = '10';
        APPPHBP12var.POINTs = widget.data?.POINTs ?? '';
        // APPPHBP12var.POINTs = '10';
        // if (APPPHBP12var.ItemPickSELECT != "") {
        //   //
        //   if (APPPHBP12var.POINTs == "") {
        //     //
        //     APPPHBP12var.POINTs == "0";
        //   }
        // }
        APPPHBP12var.UNIT = widget.data?.UNIT ?? '';
        // APPPHBP12var.UNIT = 'pcs/lots';
        APPPHBP12var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        APPPHBP12var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        APPPHBP12var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        APPPHBP12var.GAP = widget.data?.GAP ?? '';
        //
        APPPHBP12var.preview = widget.data?.preview ?? [];
        APPPHBP12var.confirmdata = widget.data?.confirmdata ?? [];
        APPPHBP12var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        APPPHBP12var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        APPPHBP12var.PICs = widget.data?.Pic ?? '';

        if (APPPHBP12var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // if (widget.trick == 'OK' &&
      //     APPPHBP12var.PCSleft != '0' &&
      //     APPPHBP12var.PCS != '' &&
      //     APPPHBP12var.PCSleft != '' &&
      //     (int.parse(APPPHBP12var.PCSleft) < int.parse(APPPHBP12var.PCS))) {
      //   widget.trick = '';
      //   context.read<TRICKER_APPPHBP12_Bloc>().add(TRICKER_APPPHBP12FINISH());
      // }

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<APPPHBP12_Bloc>().add(APPPHBP12_READ());
      });
      APPPHBP12var.DHtimer = timer;
    }
    return SINGLESHOTAPRmain(
      //------ Left
      LABEL: "APP-PHBP12",
      PO: APPPHBP12var.PO,
      CP: APPPHBP12var.CP,
      QTY: APPPHBP12var.QTY,
      PROCESS: APPPHBP12var.PROCESS,
      CUSLOT: APPPHBP12var.CUSLOT,
      TPKLOT: APPPHBP12var.TPKLOT,
      FG: APPPHBP12var.FG,
      CUSTOMER: APPPHBP12var.CUSTOMER,
      PART: APPPHBP12var.PART,
      PARTNAME: APPPHBP12var.PARTNAME,
      MATERIAL: APPPHBP12var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        APPPHBP12var.ItemPickSELECT = v;

        context
            .read<TRICKER_APPPHBP12_Bloc>()
            .add(TRICKER_APPPHBP12geteachITEM());
      },
      ItemPick: APPPHBP12var.ItemPick,
      PCS: APPPHBP12var.PCS,
      PCSleft: APPPHBP12var.PCSleft,
      POINTs: APPPHBP12var.POINTs,
      UNIT: APPPHBP12var.UNIT,
      INTERSEC: APPPHBP12var.INTERSEC,
      RESULTFORMAT: APPPHBP12var.RESULTFORMAT,
      Ghtype: APPPHBP12var.GRAPHTYPE,
      //------- Bottom
      GOOD: (v) {
        if (APPPHBP12var.PCS != '') {
          APPPHBP12var.APPEARANCE = 'Good';
          if (APPPHBP12var.PCS != '' &&
              APPPHBP12var.POINTs != '' &&
              APPPHBP12var.ItemPickSELECT != '') {
            if (int.parse(APPPHBP12var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_APPPHBP12_Bloc>()
                  .add(TRICKER_APPPHBP12FINISH());
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      NOGOOD: (v) {
        if (APPPHBP12var.PCS != '') {
          if (APPPHBP12var.PCS != '' &&
              APPPHBP12var.POINTs != '' &&
              APPPHBP12var.ItemPickSELECT != '') {
            if (int.parse(APPPHBP12var.PCSleft) > 0) {
              APPPHBP12var.APPEARANCE = 'no Good';
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        }
      },
      preview: APPPHBP12var.preview,
      confirmdata: APPPHBP12var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_APPPHBP12_Bloc>().add(TRICKER_APPPHBP12CLEAR());
      },
      BACKPAGE: (v) {
        APPPHBP12var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        APPPHBP12var.ItemPickSELECT = '';
        context.read<TRICKER_APPPHBP12_Bloc>().add(TRICKER_APPPHBP12SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_APPPHBP12_Bloc>()
            .add(TRICKER_APPPHBP12RESETVALUE());
      },
      ITEMleftUNIT: APPPHBP12var.ITEMleftUNIT,
      ITEMleftVALUE: APPPHBP12var.ITEMleftVALUE,
      PICB64: APPPHBP12var.PICs,
    );
  }
}
