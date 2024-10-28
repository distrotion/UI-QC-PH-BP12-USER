import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P20INCOMING/P20INCOMINGVAR.dart';

//-------------------------------------------------

abstract class INCOMINGGETDATA_Event {}

class INCOMINGGETDATA_GET extends INCOMINGGETDATA_Event {}

class INCOMINGGETDATA_flush extends INCOMINGGETDATA_Event {}

class INCOMINGGETDATA_Bloc
    extends Bloc<INCOMINGGETDATA_Event, INCOMINGGETDATAclass> {
  INCOMINGGETDATA_Bloc() : super(INCOMINGGETDATAclass()) {
    on<INCOMINGGETDATA_GET>((event, emit) {
      return _INCOMINGGETDATA_GET(INCOMINGGETDATAclass(), emit);
    });
    on<INCOMINGGETDATA_flush>((event, emit) {
      return _INCOMINGGETDATA_flush(INCOMINGGETDATAclass(), emit);
    });
  }
  Future<void> _INCOMINGGETDATA_GET(
      INCOMINGGETDATAclass toAdd, Emitter<INCOMINGGETDATAclass> emit) async {
    INCOMINGGETDATAclass output = INCOMINGGETDATAclass();
    final response = await Dio().post(
      GLOserver + "INPROCESS/GETDATATOSEE",
      data: {
        "PO": P20INCOMINGVAR.POIN,
        "MATNR": P20INCOMINGVAR.MATIN,
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff['DATA']);
      if (databuff['DATA'].length > 0) {
        var DATAOITEMS = databuff['DATA'][0]['ListITEM'];
        // print(DATAOITEMS);
        // for (var i = 0; i < DATAOITEMS.length; i++) {
        //   print(DATAOITEMS[i]);
        // }
        if (DATAOITEMS.length > 0) {
          var DATASET = databuff['DATA'][0][DATAOITEMS[0]];
          // print(DATASET);
          if (DATASET['DATASET'].length > 0) {
            if (DATASET['DATASET'][0].length > 0) {
              var DATASETs = DATASET['DATASET'];
              for (var i = 0; i < DATASETs.length; i++) {
                //
                List<String> buffdata = [];
                for (var j = 0; j < DATASETs[i].length; j++) {
                  //
                  buffdata.add(DATASETs[i][j].toString());
                  // print(DATASETs[i][j].toString());
                }
                // print(buffdata);
                output.data.add(buffdata);
              }
            }
          }
        }
        //
      }
    }

    emit(output);
  }

  Future<void> _INCOMINGGETDATA_flush(
      INCOMINGGETDATAclass toAdd, Emitter<INCOMINGGETDATAclass> emit) async {
    INCOMINGGETDATAclass output = INCOMINGGETDATAclass();

    emit(output);
  }
}

class INCOMINGGETDATAclass {
  INCOMINGGETDATAclass({
    this.PO = '',
  });

  String PO;
  List<List<String>> data = [];
}
