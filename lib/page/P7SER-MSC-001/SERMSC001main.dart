import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/07-01-SERMSC001.dart';
import '../../bloc/BlocEvent/07-02-TrickSERMSC001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTIMG/SINGLESHOTIMGwidget.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/imgset.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'SERMSC001var.dart';

late BuildContext MICROSCOPESERMSC001_CONTEXT;

class MICROSCOPE_SERMSC001main extends StatelessWidget {
  MICROSCOPE_SERMSC001main({Key? key, this.data}) : super(key: key);
  SERMSC001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_SERMSC001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_SERMSC001_BlocBuffer extends StatelessWidget {
  _TRICKER_SERMSC001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  SERMSC001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_SERMSC001_Bloc(),
        child: BlocBuilder<TRICKER_SERMSC001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_SERMSC001body(data: data);
          },
        ));
  }
}

class ROCKWELL_SERMSC001body extends StatefulWidget {
  ROCKWELL_SERMSC001body({Key? key, this.data}) : super(key: key);
  SERMSC001SCHEMA? data;

  @override
  State<ROCKWELL_SERMSC001body> createState() => _ROCKWELL_SERMSC001bodyState();
}

class _ROCKWELL_SERMSC001bodyState extends State<ROCKWELL_SERMSC001body> {
  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
    // context.read<SERMSC001_Bloc>().add(SERMSC001_READ());
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
    SERMSC001var.base64pic01 = imgw;
    SERMSC001var.base64pic02 = imgw;
    SERMSC001var.base64pic03 = imgw;
    SERMSC001var.base64pic04 = imgw;
    SERMSC001var.base64pic01data = '';
    SERMSC001var.base64pic02data = '';
    SERMSC001var.base64pic03data = '';
    SERMSC001var.base64pic04data = '';
    // SERMSC001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    SERMSC001var.ItemPickSELECT = '';
    context.read<TRICKER_SERMSC001_Bloc>().add(TRICKER_SERMSC001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 6;
    // print(widget.data?.UPDATE);
    MICROSCOPESERMSC001_CONTEXT = context;

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        SERMSC001var.PO = widget.data?.PO ?? '';
        SERMSC001var.CP = widget.data?.CP ?? '';
        SERMSC001var.QTY = widget.data?.QTY ?? '';
        SERMSC001var.PROCESS = widget.data?.PROCESS ?? '';
        SERMSC001var.CUSLOT = widget.data?.CUSLOT ?? '';
        SERMSC001var.TPKLOT = widget.data?.TPKLOT ?? '';
        SERMSC001var.FG = widget.data?.FG ?? '';
        SERMSC001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        SERMSC001var.PART = widget.data?.PART ?? '';
        SERMSC001var.PARTNAME = widget.data?.PARTNAME ?? '';
        SERMSC001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        SERMSC001var.ItemPick = widget.data?.ItemPick ?? [''];
        SERMSC001var.PCS = widget.data?.PCS ?? '';
        // SERMSC001var.PCS = '10';
        SERMSC001var.PCSleft = widget.data?.PCSleft ?? '';
        // SERMSC001var.PCSleft = '10';
        SERMSC001var.POINTs = widget.data?.POINTs ?? '';
        // SERMSC001var.POINTs = '10';
        SERMSC001var.UNIT = widget.data?.UNIT ?? '';
        // SERMSC001var.UNIT = 'pcs/lots';
        SERMSC001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        SERMSC001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        SERMSC001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        SERMSC001var.GAP = widget.data?.GAP ?? '';
        //
        SERMSC001var.preview = widget.data?.preview ?? [];
        SERMSC001var.confirmdata = widget.data?.confirmdata ?? [];
        SERMSC001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        SERMSC001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (SERMSC001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // Timer timer = Timer(const Duration(seconds: 1), () {
      //   context.read<SERMSC001_Bloc>().add(SERMSC001_READ());
      // });
      // SERMSC001var.DHtimer = timer;
    }
    return SINGLESHOTIMGmain(
      //------ Left
      LABEL: "SER-MCS-001",
      PO: SERMSC001var.PO,
      CP: SERMSC001var.CP,
      QTY: SERMSC001var.QTY,
      PROCESS: SERMSC001var.PROCESS,
      CUSLOT: SERMSC001var.CUSLOT,
      TPKLOT: SERMSC001var.TPKLOT,
      FG: SERMSC001var.FG,
      CUSTOMER: SERMSC001var.CUSTOMER,
      PART: SERMSC001var.PART,
      PARTNAME: SERMSC001var.PARTNAME,
      MATERIAL: SERMSC001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        SERMSC001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_SERMSC001_Bloc>()
            .add(TRICKER_SERMSC001geteachITEM());
        SERMSC001var.base64pic01 = imgw;
        SERMSC001var.base64pic02 = imgw;
        SERMSC001var.base64pic03 = imgw;
        SERMSC001var.base64pic04 = imgw;
        SERMSC001var.iscontrol = true;
        SERMSC001var.base64pic01data = '';
        SERMSC001var.base64pic02data = '';
        SERMSC001var.base64pic03data = '';
        SERMSC001var.base64pic04data = '';
        context.read<SERMSC001_Bloc>().add(SERMSC001_READ());
      },
      ItemPick: SERMSC001var.ItemPick,
      PCS: SERMSC001var.PCS,
      PCSleft: SERMSC001var.PCSleft,
      POINTs: SERMSC001var.POINTs,
      UNIT: SERMSC001var.UNIT,
      INTERSEC: SERMSC001var.INTERSEC,
      RESULTFORMAT: SERMSC001var.RESULTFORMAT,
      Ghtype: SERMSC001var.GRAPHTYPE,

      //------- Bottom
      ACCEPT: (v) {
        if (SERMSC001var.PCS != '' &&
            SERMSC001var.POINTs != '' &&
            SERMSC001var.ItemPickSELECT != '') {
          onLoadingFAKEintTIME(context, 3);
          if (int.parse(SERMSC001var.PCSleft) > 0) {
            context
                .read<TRICKER_SERMSC001_Bloc>()
                .add(TRICKER_SERMSC001FINISH());
            Timer(const Duration(seconds: 3), () {
              context.read<SERMSC001_Bloc>().add(SERMSC001_READ());
            });
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      FINISH: (v) {},
      preview: SERMSC001var.preview,
      confirmdata: SERMSC001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {},
      BACKPAGE: (v) {
        SERMSC001var.base64pic01 = imgw;
        SERMSC001var.base64pic02 = imgw;
        SERMSC001var.base64pic03 = imgw;
        SERMSC001var.base64pic04 = imgw;
        SERMSC001var.base64pic01data = '';
        SERMSC001var.base64pic02data = '';
        SERMSC001var.base64pic03data = '';
        SERMSC001var.base64pic04data = '';
        // SERMSC001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        SERMSC001var.ItemPickSELECT = '';
        context.read<TRICKER_SERMSC001_Bloc>().add(TRICKER_SERMSC001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {},
      ITEMleftUNIT: SERMSC001var.ITEMleftUNIT,
      ITEMleftVALUE: SERMSC001var.ITEMleftVALUE,
      wchild: Column(
        children: [
          FileUploadButton01(),
          FileUploadButton02(),
          FileUploadButton03(),
          FileUploadButton04(),
        ],
      ),
    );
  }
}

class FileUploadButton01 extends StatefulWidget {
  const FileUploadButton01({Key? key}) : super(key: key);

  @override
  State<FileUploadButton01> createState() => _FileUploadButton01State();
}

class _FileUploadButton01State extends State<FileUploadButton01> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: SERMSC001var.iscontrol,
            fnContr: (input) {
              setState(() {
                SERMSC001var.iscontrol = input;
              });
            },
            sValue: SERMSC001var.base64pic01data,
            returnfunc: (String s) {
              SERMSC001var.base64pic01data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: SERMSC001var.base64pic01,
          ),
          IMGbutton(
            base64pic: SERMSC001var.base64pic01,
            setimg: (img) {
              SERMSC001var.base64pic01 = img;
              context.read<SERMSC001_Bloc>().add(SERMSC001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton02 extends StatefulWidget {
  const FileUploadButton02({Key? key}) : super(key: key);

  @override
  State<FileUploadButton02> createState() => _FileUploadButton02State();
}

class _FileUploadButton02State extends State<FileUploadButton02> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: SERMSC001var.iscontrol,
            fnContr: (input) {
              setState(() {
                SERMSC001var.iscontrol = input;
              });
            },
            sValue: SERMSC001var.base64pic02data,
            returnfunc: (String s) {
              SERMSC001var.base64pic02data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: SERMSC001var.base64pic02,
          ),
          IMGbutton(
            base64pic: SERMSC001var.base64pic02,
            setimg: (img) {
              SERMSC001var.base64pic02 = img;
              context.read<SERMSC001_Bloc>().add(SERMSC001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton03 extends StatefulWidget {
  const FileUploadButton03({Key? key}) : super(key: key);

  @override
  State<FileUploadButton03> createState() => _FileUploadButton03State();
}

class _FileUploadButton03State extends State<FileUploadButton03> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: SERMSC001var.iscontrol,
            fnContr: (input) {
              setState(() {
                SERMSC001var.iscontrol = input;
              });
            },
            sValue: SERMSC001var.base64pic03data,
            returnfunc: (String s) {
              SERMSC001var.base64pic03data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: SERMSC001var.base64pic03,
          ),
          IMGbutton(
            base64pic: SERMSC001var.base64pic03,
            setimg: (img) {
              SERMSC001var.base64pic03 = img;
              context.read<SERMSC001_Bloc>().add(SERMSC001_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton04 extends StatefulWidget {
  const FileUploadButton04({Key? key}) : super(key: key);

  @override
  State<FileUploadButton04> createState() => _FileUploadButton04State();
}

class _FileUploadButton04State extends State<FileUploadButton04> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isContr: SERMSC001var.iscontrol,
            fnContr: (input) {
              setState(() {
                SERMSC001var.iscontrol = input;
              });
            },
            sValue: SERMSC001var.base64pic04data,
            returnfunc: (String s) {
              SERMSC001var.base64pic04data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: SERMSC001var.base64pic04,
          ),
          IMGbutton(
            base64pic: SERMSC001var.base64pic04,
            setimg: (img) {
              SERMSC001var.base64pic04 = img;
              context.read<SERMSC001_Bloc>().add(SERMSC001_READ());
            },
          ),
        ],
      ),
    );
  }
}
