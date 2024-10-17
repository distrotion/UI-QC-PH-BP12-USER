import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../page/P20INCOMING/P20INCOMINGMAIN.dart';
import '../../page/P20INCOMING/P20INCOMINGMAIN_CONSOLEbox.dart';
import '../../page/P20INCOMING/P20INCOMINGVAR.dart';
import '../../widget/common/Safty.dart';
import '20-02-INCOMINGGETLIST.dart';

//-------------------------------------------------

abstract class INCOMINGGETPO_Event {}

class INCOMINGGETPO_GET extends INCOMINGGETPO_Event {}

class INCOMINGGETPO_flush extends INCOMINGGETPO_Event {}

class INCOMINGGETPO_Bloc extends Bloc<INCOMINGGETPO_Event, INCOMINGGETPOclass> {
  INCOMINGGETPO_Bloc() : super(INCOMINGGETPOclass()) {
    on<INCOMINGGETPO_GET>((event, emit) {
      return _INCOMINGGETPO_GET(INCOMINGGETPOclass(), emit);
    });
    on<INCOMINGGETPO_flush>((event, emit) {
      return _INCOMINGGETPO_flush(INCOMINGGETPOclass(), emit);
    });
  }
  Future<void> _INCOMINGGETPO_GET(
      INCOMINGGETPOclass toAdd, Emitter<INCOMINGGETPOclass> emit) async {
    INCOMINGGETPOclass output = INCOMINGGETPOclass();
    print(P20INCOMINGVAR.ORDER);
    final response = await Dio().post(
      "http://172.23.10.40:16700/" + 'RAWDATA/sapget',
      data: {
        "ORDER": P20INCOMINGVAR.ORDER,
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);
      if (databuff.length > 0) {
        //
        output.PO = P20INCOMINGVAR.ORDER;
        output.SEQ = databuff[0]['SEQ'].toString();
        output.CPMAT = databuff[0]['CPMAT'].toString();
        output.FGMAT = databuff[0]['FGMAT'].toString();
        output.QTYT = databuff[0]['QTYT'].toString();
        output.UNIT = databuff[0]['UNIT'].toString();
        output.CUSTNA = databuff[0]['CUSTNA'].toString();
        output.PARTNA = databuff[0]['PARTNA'].toString();
        output.PARTNO = databuff[0]['PARTNO'].toString();
        output.PROC = databuff[0]['PROC'].toString();
        output.CUSLOTNO = databuff[0]['CUSLOTNO'].toString();
        output.FG_CHARG = databuff[0]['FG_CHARG'].toString();
        output.CUST_FULLNM = databuff[0]['CUST_FULLNM'].toString();
      }

      P20INCOMINGVAR.MATIN = int.parse(ConverstStr(output.CPMAT)).toString();

      P20INCOMINGVAR.SEQ = output.SEQ;
      P20INCOMINGVAR.FGMAT = int.parse(ConverstStr(output.FGMAT)).toString();
      P20INCOMINGVAR.CPMAT = int.parse(ConverstStr(output.CPMAT)).toString();
      P20INCOMINGVAR.QTYT = output.QTYT;
      P20INCOMINGVAR.UNIT = output.UNIT;
      P20INCOMINGVAR.CUSTNA = output.CUSTNA;
      P20INCOMINGVAR.PARTNA = output.PARTNA;
      P20INCOMINGVAR.PARTNO = output.PARTNO;
      P20INCOMINGVAR.PROC = output.PROC;
      P20INCOMINGVAR.CUSLOTNO = output.CUSLOTNO;
      P20INCOMINGVAR.FG_CHARG = output.FG_CHARG;
      P20INCOMINGVAR.FG_CHARG = output.FG_CHARG;
      P20INCOMINGVAR.CUST_FULLNM = output.CUST_FULLNM;

      P20INCONINGMAINcontext.read<INCOMINGGETLIST_Bloc>()
          .add(INCOMINGGETLIST_GET());
    } else {
      //
    }
    emit(output);
  }

  Future<void> _INCOMINGGETPO_flush(
      INCOMINGGETPOclass toAdd, Emitter<INCOMINGGETPOclass> emit) async {
    INCOMINGGETPOclass output = INCOMINGGETPOclass();

    emit(output);
  }
}

class INCOMINGGETPOclass {
  INCOMINGGETPOclass({
    this.PO = '',
    this.SEQ = '',
    this.CPMAT = '',
    this.FGMAT = '',
    this.QTYT = '',
    this.UNIT = '',
    this.CUSTNA = '',
    this.PARTNA = '',
    this.PARTNO = '',
    this.PROC = '',
    this.CUSLOTNO = '',
    this.FG_CHARG = '',
    this.CUST_FULLNM = '',
  });

  String PO;
  String SEQ;
  String CPMAT;
  String FGMAT;
  String QTYT;
  String UNIT;
  String CUSTNA;
  String PARTNA;
  String PARTNO;
  String PROC;
  String CUSLOTNO;
  String FG_CHARG;
  String CUST_FULLNM;
}

//16700

class listdataincomming {
  listdataincomming({
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
