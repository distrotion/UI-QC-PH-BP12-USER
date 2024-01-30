import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/07-01-SURMCS001.dart';
import '../../bloc/BlocEvent/07-02-TrickSURMCS001.dart';
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
import 'SURMCS001var.dart';

late BuildContext MICROSCOPESURMCS001_CONTEXT;

class MICROSCOPE_SURMCS001main extends StatelessWidget {
  MICROSCOPE_SURMCS001main({Key? key, this.data}) : super(key: key);
  SURMCS001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_SURMCS001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_SURMCS001_BlocBuffer extends StatelessWidget {
  _TRICKER_SURMCS001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  SURMCS001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_SURMCS001_Bloc(),
        child: BlocBuilder<TRICKER_SURMCS001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_SURMCS001body(data: data);
          },
        ));
  }
}

class ROCKWELL_SURMCS001body extends StatefulWidget {
  ROCKWELL_SURMCS001body({Key? key, this.data}) : super(key: key);
  SURMCS001SCHEMA? data;

  @override
  State<ROCKWELL_SURMCS001body> createState() => _ROCKWELL_SURMCS001bodyState();
}

class _ROCKWELL_SURMCS001bodyState extends State<ROCKWELL_SURMCS001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<SURMCS001_Bloc>().add(SURMCS001_READ());
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
    SURMCS001var.base64pic01 = imgw;
    SURMCS001var.base64pic02 = imgw;
    SURMCS001var.base64pic03 = imgw;
    SURMCS001var.base64pic04 = imgw;
    SURMCS001var.base64pic01data = '';
    SURMCS001var.base64pic02data = '';
    SURMCS001var.base64pic03data = '';
    SURMCS001var.base64pic04data = '';
    // SURMCS001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    SURMCS001var.ItemPickSELECT = '';
    context.read<TRICKER_SURMCS001_Bloc>().add(TRICKER_SURMCS001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 6;
    // print(widget.data?.UPDATE);
    MICROSCOPESURMCS001_CONTEXT = context;

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        SURMCS001var.PO = widget.data?.PO ?? '';
        SURMCS001var.CP = widget.data?.CP ?? '';
        SURMCS001var.QTY = widget.data?.QTY ?? '';
        SURMCS001var.PROCESS = widget.data?.PROCESS ?? '';
        SURMCS001var.CUSLOT = widget.data?.CUSLOT ?? '';
        SURMCS001var.TPKLOT = widget.data?.TPKLOT ?? '';
        SURMCS001var.FG = widget.data?.FG ?? '';
        SURMCS001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        SURMCS001var.PART = widget.data?.PART ?? '';
        SURMCS001var.PARTNAME = widget.data?.PARTNAME ?? '';
        SURMCS001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        SURMCS001var.ItemPick = widget.data?.ItemPick ?? [''];
        SURMCS001var.PCS = widget.data?.PCS ?? '';
        // SURMCS001var.PCS = '10';
        SURMCS001var.PCSleft = widget.data?.PCSleft ?? '';
        // SURMCS001var.PCSleft = '10';
        SURMCS001var.POINTs = widget.data?.POINTs ?? '';
        // SURMCS001var.POINTs = '10';
        SURMCS001var.UNIT = widget.data?.UNIT ?? '';
        // SURMCS001var.UNIT = 'pcs/lots';
        SURMCS001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        SURMCS001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        SURMCS001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        SURMCS001var.GAP = widget.data?.GAP ?? '';
        //
        SURMCS001var.preview = widget.data?.preview ?? [];
        SURMCS001var.confirmdata = widget.data?.confirmdata ?? [];
        SURMCS001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        SURMCS001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (SURMCS001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // Timer timer = Timer(const Duration(seconds: 1), () {
      //   context.read<SURMCS001_Bloc>().add(SURMCS001_READ());
      // });
      // SURMCS001var.DHtimer = timer;
    }
    return SINGLESHOTIMGmain(
      //------ Left
      LABEL: "SER-MCS-001",
      PO: SURMCS001var.PO,
      CP: SURMCS001var.CP,
      QTY: SURMCS001var.QTY,
      PROCESS: SURMCS001var.PROCESS,
      CUSLOT: SURMCS001var.CUSLOT,
      TPKLOT: SURMCS001var.TPKLOT,
      FG: SURMCS001var.FG,
      CUSTOMER: SURMCS001var.CUSTOMER,
      PART: SURMCS001var.PART,
      PARTNAME: SURMCS001var.PARTNAME,
      MATERIAL: SURMCS001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        SURMCS001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_SURMCS001_Bloc>()
            .add(TRICKER_SURMCS001geteachITEM());
        SURMCS001var.base64pic01 = imgw;
        SURMCS001var.base64pic02 = imgw;
        SURMCS001var.base64pic03 = imgw;
        SURMCS001var.base64pic04 = imgw;
        SURMCS001var.iscontrol = true;
        SURMCS001var.base64pic01data = '';
        SURMCS001var.base64pic02data = '';
        SURMCS001var.base64pic03data = '';
        SURMCS001var.base64pic04data = '';
        context.read<SURMCS001_Bloc>().add(SURMCS001_READ());
      },
      ItemPick: SURMCS001var.ItemPick,
      PCS: SURMCS001var.PCS,
      PCSleft: SURMCS001var.PCSleft,
      POINTs: SURMCS001var.POINTs,
      UNIT: SURMCS001var.UNIT,
      INTERSEC: SURMCS001var.INTERSEC,
      RESULTFORMAT: SURMCS001var.RESULTFORMAT,
      Ghtype: SURMCS001var.GRAPHTYPE,

      //------- Bottom
      ACCEPT: (v) {
        if (SURMCS001var.PCS != '' &&
            SURMCS001var.POINTs != '' &&
            SURMCS001var.ItemPickSELECT != '') {
          onLoadingFAKEintTIME(context, 3);
          if (int.parse(SURMCS001var.PCSleft) > 0) {
            print(".......>");
            context
                .read<TRICKER_SURMCS001_Bloc>()
                .add(TRICKER_SURMCS001FINISH());
            Timer(const Duration(seconds: 3), () {
              context.read<SURMCS001_Bloc>().add(SURMCS001_READ());
            });
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      FINISH: (v) {},
      preview: SURMCS001var.preview,
      confirmdata: SURMCS001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {},
      BACKPAGE: (v) {
        SURMCS001var.base64pic01 = imgw;
        SURMCS001var.base64pic02 = imgw;
        SURMCS001var.base64pic03 = imgw;
        SURMCS001var.base64pic04 = imgw;
        SURMCS001var.base64pic01data = '';
        SURMCS001var.base64pic02data = '';
        SURMCS001var.base64pic03data = '';
        SURMCS001var.base64pic04data = '';
        // SURMCS001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        SURMCS001var.ItemPickSELECT = '';
        context.read<TRICKER_SURMCS001_Bloc>().add(TRICKER_SURMCS001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {},
      ITEMleftUNIT: SURMCS001var.ITEMleftUNIT,
      ITEMleftVALUE: SURMCS001var.ITEMleftVALUE,
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
            isContr: SURMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                SURMCS001var.iscontrol = input;
              });
            },
            sValue: SURMCS001var.base64pic01data,
            returnfunc: (String s) {
              SURMCS001var.base64pic01data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: SURMCS001var.base64pic01,
          ),
          IMGbutton(
            base64pic: SURMCS001var.base64pic01,
            setimg: (img) {
              SURMCS001var.base64pic01 = img;
              context.read<SURMCS001_Bloc>().add(SURMCS001_READ());
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
            isContr: SURMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                SURMCS001var.iscontrol = input;
              });
            },
            sValue: SURMCS001var.base64pic02data,
            returnfunc: (String s) {
              SURMCS001var.base64pic02data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: SURMCS001var.base64pic02,
          ),
          IMGbutton(
            base64pic: SURMCS001var.base64pic02,
            setimg: (img) {
              SURMCS001var.base64pic02 = img;
              context.read<SURMCS001_Bloc>().add(SURMCS001_READ());
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
            isContr: SURMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                SURMCS001var.iscontrol = input;
              });
            },
            sValue: SURMCS001var.base64pic03data,
            returnfunc: (String s) {
              SURMCS001var.base64pic03data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: SURMCS001var.base64pic03,
          ),
          IMGbutton(
            base64pic: SURMCS001var.base64pic03,
            setimg: (img) {
              SURMCS001var.base64pic03 = img;
              context.read<SURMCS001_Bloc>().add(SURMCS001_READ());
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
            isContr: SURMCS001var.iscontrol,
            fnContr: (input) {
              setState(() {
                SURMCS001var.iscontrol = input;
              });
            },
            sValue: SURMCS001var.base64pic04data,
            returnfunc: (String s) {
              SURMCS001var.base64pic04data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: SURMCS001var.base64pic04,
          ),
          IMGbutton(
            base64pic: SURMCS001var.base64pic04,
            setimg: (img) {
              SURMCS001var.base64pic04 = img;
              context.read<SURMCS001_Bloc>().add(SURMCS001_READ());
            },
          ),
        ],
      ),
    );
  }
}
