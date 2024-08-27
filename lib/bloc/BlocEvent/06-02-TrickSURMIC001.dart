import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P6SUR-MIC-001/SURMIC001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoSURMIC001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_SURMIC001geteachITEM extends TRICKER_Event {}

class TRICKER_SURMIC001geteachGRAPH extends TRICKER_Event {}

class TRICKER_SURMIC001confirmdata extends TRICKER_Event {}

class TRICKER_SURMIC001CLEAR extends TRICKER_Event {}

class TRICKER_SURMIC001RESETVALUE extends TRICKER_Event {}

class TRICKER_SURMIC001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_SURMIC001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_SURMIC001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_SURMIC001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoSURMIC001>((event, emit) {
      return _TRICKER_GETINtoSURMIC001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_SURMIC001geteachITEM>((event, emit) {
      return _TRICKER_SURMIC001geteachITEM('', emit);
    });

    on<TRICKER_SURMIC001geteachGRAPH>((event, emit) {
      return _TRICKER_SURMIC001geteachGRAPH('', emit);
    });

    on<TRICKER_SURMIC001confirmdata>((event, emit) {
      return _TRICKER_SURMIC001confirmdata('', emit);
    });

    on<TRICKER_SURMIC001CLEAR>((event, emit) {
      return _TRICKER_SURMIC001CLEAR('', emit);
    });

    on<TRICKER_SURMIC001RESETVALUE>((event, emit) {
      return _TRICKER_SURMIC001RESETVALUE('', emit);
    });

    on<TRICKER_SURMIC001SETZERO>((event, emit) {
      return _TRICKER_SURMIC001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_SURMIC001FINISH>((event, emit) {
      return _TRICKER_SURMIC001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoSURMIC001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoSURMIC001',
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

  Future<void> _TRICKER_SURMIC001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURMIC001-geteachITEM',
      data: {
        "ITEMs": SURMIC001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SURMIC001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURMIC001-geteachGRAPH',
      data: {
        "GAPname": SURMIC001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SURMIC001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURMIC001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURMIC001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURMIC001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURMIC001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURMIC001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURMIC001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURMIC001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_SURMIC001FINISH

  Future<void> _TRICKER_SURMIC001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURMIC001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
