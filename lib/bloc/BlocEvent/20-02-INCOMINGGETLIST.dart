import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P20INCOMING/P20INCOMINGMAIN_CONSOLEbox.dart';
import '../../page/P20INCOMING/P20INCOMINGVAR.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------

List<String> _ITEMLIST = [];

abstract class INCOMINGGETLIST_Event {}

class INCOMINGGETLIST_GET extends INCOMINGGETLIST_Event {}

class INCOMINGGETLIST_SET extends INCOMINGGETLIST_Event {}

class INCOMINGGETLIST_Bloc
    extends Bloc<INCOMINGGETLIST_Event, List<INCOMINGGETLISTclass>> {
  INCOMINGGETLIST_Bloc() : super([]) {
    on<INCOMINGGETLIST_GET>((event, emit) {
      return _INCOMINGGETLIST_GET([], emit);
    });
    on<INCOMINGGETLIST_SET>((event, emit) {
      return _INCOMINGGETLIST_SET([], emit);
    });
  }
  Future<void> _INCOMINGGETLIST_GET(List<INCOMINGGETLISTclass> toAdd,
      Emitter<List<INCOMINGGETLISTclass>> emit) async {
    List<INCOMINGGETLISTclass> output = [];
    print(P20INCOMINGVAR.MATIN);
    final response = await Dio().post(
      GLOserver + "INPROCESS/GETDATA",
      data: {
        "MATNR": P20INCOMINGVAR.MATIN,
      },
    );

    List<INCOMINGGETLISTclass> stateoutput = [];
    if (response.statusCode == 200) {
      // Navigator.pop(P04INCOMING_BP12PHmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      // print(databuff);
      if (databuff['PATTERN'] != null) {
        if (databuff['PATTERN'].length > 0) {
          // print(databuff['PATTERN'][0]['INCOMMING']['SPECIFICATIONve']);
          // print(databuff['PATTERN'][0]['INCOMMING'].length);
          var ITEMnamelist = databuff['ITEMS'];
          var INCOMMINGlist = databuff['PATTERN'][0]['INPROCESS'];

          // print(ITEMnamelist);
          if (INCOMMINGlist.length > 0) {
            stateoutput
                .add(INCOMINGGETLISTclass(ITEMname: "Ready", ITEMcode: "-"));
          } else {
            stateoutput.add(
                INCOMINGGETLISTclass(ITEMname: "NO PATTERN", ITEMcode: "-"));
          }
          List<String> listitemss = [];
          for (var i = 0; i < INCOMMINGlist.length; i++) {
            listitemss.add(INCOMMINGlist[i]['ITEMs']);

            // print(INCOMMINGlist[i]['ITEMs']);
            //ITEMs-5f2699c943e7cf2b40d84587
          }

          _ITEMLIST = listitemss;

          for (var i = 0; i < INCOMMINGlist.length; i++) {
            for (var j = 0; j < ITEMnamelist.length; j++) {
              if (ITEMnamelist[j]['masterID'].toString() ==
                  INCOMMINGlist[i]['ITEMs']) {
                // print(ITEMnamelist[j]['ITEMs']);
                // print(ITEMnamelist[j]['masterID']);
                // print(INCOMMINGlist[i]['PCS']);
                // print(INCOMMINGlist[i]['FREQUENCY']);
                stateoutput.add(INCOMINGGETLISTclass(
                  ITEMname: ITEMnamelist[j]['ITEMs'],
                  ITEMcode: ITEMnamelist[j]['masterID'],
                  point: INCOMMINGlist[i]['POINT'],
                  pcs: INCOMMINGlist[i]['PCS'],
                  fre: INCOMMINGlist[i]['FREQUENCY'],
                  RESULTFORMAT: INCOMMINGlist[i]['RESULTFORMAT'],
                ));
              }
            }
          }
        }
      }

      //stateoutput = data_test
      output = stateoutput;
    }

    emit(output);
  }

  Future<void> _INCOMINGGETLIST_SET(List<INCOMINGGETLISTclass> toAdd,
      Emitter<List<INCOMINGGETLISTclass>> emit) async {
    List<INCOMINGGETLISTclass> output = [];
    List<List<String>> DATAOUT = [];

    for (var i = 0;
        i < P20INCOMINGVAR_INPROCESSBOX.setofdatainlist.length;
        i++) {
      DATAOUT.add([]);
      for (var j = 0;
          j < P20INCOMINGVAR_INPROCESSBOX.setofdatainlist[i].length;
          j++) {
        DATAOUT[i].add(P20INCOMINGVAR_INPROCESSBOX.setofdatainlist[i][j].VALUE);
      }
    }

    ///INPROCESS/SETgoodandDATA
    ///

    final response = await Dio().post(
      GLOserver + "INPROCESS/SETgoodandDATA",
      data: {
        "PO": P20INCOMINGVAR.ORDER,
        "MATNR": P20INCOMINGVAR.MATIN,
        "CHARG": "",
        "MBLNR": "",
        "BWART": "",
        "MENGE": "",
        "MEINS": "",
        "MAT_FG": "",
        "KUNNR": "",
        "SORTL": "",
        "NAME1": "",
        "CUST_LOT": "",
        "PART_NM": "",
        "PART_NO": "",
        "PROCESS": "",
        "OLDMAT_CP": "",
        "STATUS": "",
        "UserNO": "",
        //
        "ITEMcode": P20INCOMINGVAR_INPROCESSBOX
            .itemlistbuffer[P20INCOMINGVAR.ItemNow].ITEMcode,
        "ITEM": P20INCOMINGVAR_INPROCESSBOX
            .itemlistbuffer[P20INCOMINGVAR.ItemNow].ITEMname,
        "ListITEM": _ITEMLIST,
        "DATAINPUT": "",
        "ITEMstatus": "GOOD",
        "ITEMspecialAccStatus": '',
        "ITEMspecialAccCOMMENT": '',
        "ITEMspecialAccPic": '',
        "ITEMspecialAccPic01": '',
        "ITEMspecialAccPic02": '',
        "ITEMspecialAccPic03": '',
        "ITEMspecialAccPic04": '',
        "ITEMspecialAccPic05": '',
        "ITEMsPiecesSelected": '',
        "DATASET": DATAOUT
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      print(databuff);
      if (databuff['status'].toString() == 'OK') {
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "COMPLETE", "UPDATE COMPLETE", enumNotificationlist.Success);
        Navigator.pop(P20INCOMINGMAINmaincontextbox);
      }
    }

    emit(output);
  }
}

class INCOMINGGETLISTclass {
  INCOMINGGETLISTclass({
    this.ITEMname = '',
    this.ITEMcode = '',
    this.pcs = '',
    this.point = '',
    this.fre = '',
    this.PIC = '',
    this.RESULTFORMAT = '',
  });
  String ITEMname;
  String ITEMcode;
  String pcs;
  String point;
  String fre;
  String PIC;
  String RESULTFORMAT;
}
