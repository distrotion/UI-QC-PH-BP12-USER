import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P6SER-MIC-001/SERMIC001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoSERMIC001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_SERMIC001geteachITEM extends TRICKER_Event {}

class TRICKER_SERMIC001geteachGRAPH extends TRICKER_Event {}

class TRICKER_SERMIC001confirmdata extends TRICKER_Event {}

class TRICKER_SERMIC001CLEAR extends TRICKER_Event {}

class TRICKER_SERMIC001RESETVALUE extends TRICKER_Event {}

class TRICKER_SERMIC001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_SERMIC001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_SERMIC001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_SERMIC001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoSERMIC001>((event, emit) {
      return _TRICKER_GETINtoSERMIC001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_SERMIC001geteachITEM>((event, emit) {
      return _TRICKER_SERMIC001geteachITEM('', emit);
    });

    on<TRICKER_SERMIC001geteachGRAPH>((event, emit) {
      return _TRICKER_SERMIC001geteachGRAPH('', emit);
    });

    on<TRICKER_SERMIC001confirmdata>((event, emit) {
      return _TRICKER_SERMIC001confirmdata('', emit);
    });

    on<TRICKER_SERMIC001CLEAR>((event, emit) {
      return _TRICKER_SERMIC001CLEAR('', emit);
    });

    on<TRICKER_SERMIC001RESETVALUE>((event, emit) {
      return _TRICKER_SERMIC001RESETVALUE('', emit);
    });

    on<TRICKER_SERMIC001SETZERO>((event, emit) {
      return _TRICKER_SERMIC001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_SERMIC001FINISH>((event, emit) {
      return _TRICKER_SERMIC001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoSERMIC001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoSERMIC001',
      data: {
        "PO": FIRSTUI.POACTIVE,
        "CP": FIRSTUI.CPACTIVE,
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

  Future<void> _TRICKER_SERMIC001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMIC001-geteachITEM',
      data: {
        "ITEMs": SERMIC001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SERMIC001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMIC001-geteachGRAPH',
      data: {
        "GAPname": SERMIC001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SERMIC001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMIC001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERMIC001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMIC001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERMIC001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMIC001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERMIC001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMIC001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_SERMIC001FINISH

  Future<void> _TRICKER_SERMIC001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMIC001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
