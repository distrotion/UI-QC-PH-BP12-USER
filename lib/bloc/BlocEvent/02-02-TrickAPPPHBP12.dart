import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

import '../../page/P2APP-PHBP12/APPPHBP12var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoAPPPHBP12 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_APPPHBP12geteachITEM extends TRICKER_Event {}

class TRICKER_APPPHBP12confirmdata extends TRICKER_Event {}

class TRICKER_APPPHBP12CLEAR extends TRICKER_Event {}

class TRICKER_APPPHBP12RESETVALUE extends TRICKER_Event {}

class TRICKER_APPPHBP12SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_APPPHBP12FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_APPPHBP12_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_APPPHBP12_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoAPPPHBP12>((event, emit) {
      return _TRICKER_GETINtoAPPPHBP12('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_APPPHBP12geteachITEM>((event, emit) {
      return _TRICKER_APPPHBP12geteachITEM('', emit);
    });

    on<TRICKER_APPPHBP12confirmdata>((event, emit) {
      return _TRICKER_APPPHBP12confirmdata('', emit);
    });

    on<TRICKER_APPPHBP12CLEAR>((event, emit) {
      return _TRICKER_APPPHBP12CLEAR('', emit);
    });

    on<TRICKER_APPPHBP12RESETVALUE>((event, emit) {
      return _TRICKER_APPPHBP12RESETVALUE('', emit);
    });

    on<TRICKER_APPPHBP12SETZERO>((event, emit) {
      return _TRICKER_APPPHBP12SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_APPPHBP12FINISH>((event, emit) {
      return _TRICKER_APPPHBP12FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoAPPPHBP12(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoAPPPHBP12',
      data: {
        "PO": FIRSTUI.POACTIVE,
        "CP": FIRSTUI.CPACTIVE,
        "USER": USERDATA.NAME,
        "USERID": USERDATA.ID,
      },
    );
    String output = '';
    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff.toString() == 'OK') {
        output = 'OK';
      } else {
        output = 'NOK';
      }
    } else {
      //
    }
    emit(output);
  }

  Future<void> _TRICKER_APPPHBP12geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/APPPHBP12-geteachITEM',
      data: {
        "ITEMs": APPPHBP12var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_APPPHBP12confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/APPPHBP12-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPPHBP12CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/APPPHBP12-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPPHBP12RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/APPPHBP12-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPPHBP12SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/APPPHBP12-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_APPPHBP12FINISH

  Future<void> _TRICKER_APPPHBP12FINISH(
      String toAdd, Emitter<String> emit) async {
    print("=============");
    final response = await Dio().post(
      server + 'FINAL/APPPHBP12-FINISH-APR',
      data: {
        "APRitem": APPPHBP12var.ItemPickSELECT,
        "APRre": APPPHBP12var.APPEARANCE,
      },
    );
    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
