import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P5SUR-RGH-001/SURRGH001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoSURRGH001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_SURRGH001geteachITEM extends TRICKER_Event {}

class TRICKER_SURRGH001geteachGRAPH extends TRICKER_Event {}

class TRICKER_SURRGH001confirmdata extends TRICKER_Event {}

class TRICKER_SURRGH001CLEAR extends TRICKER_Event {}

class TRICKER_SURRGH001RESETVALUE extends TRICKER_Event {}

class TRICKER_SURRGH001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_SURRGH001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_SURRGH001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_SURRGH001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoSURRGH001>((event, emit) {
      return _TRICKER_GETINtoSURRGH001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_SURRGH001geteachITEM>((event, emit) {
      return _TRICKER_SURRGH001geteachITEM('', emit);
    });

    on<TRICKER_SURRGH001geteachGRAPH>((event, emit) {
      return _TRICKER_SURRGH001geteachGRAPH('', emit);
    });

    on<TRICKER_SURRGH001confirmdata>((event, emit) {
      return _TRICKER_SURRGH001confirmdata('', emit);
    });

    on<TRICKER_SURRGH001CLEAR>((event, emit) {
      return _TRICKER_SURRGH001CLEAR('', emit);
    });

    on<TRICKER_SURRGH001RESETVALUE>((event, emit) {
      return _TRICKER_SURRGH001RESETVALUE('', emit);
    });

    on<TRICKER_SURRGH001SETZERO>((event, emit) {
      return _TRICKER_SURRGH001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_SURRGH001FINISH>((event, emit) {
      return _TRICKER_SURRGH001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoSURRGH001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoSURRGH001',
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

  Future<void> _TRICKER_SURRGH001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURRGH001-geteachITEM',
      data: {
        "ITEMs": SURRGH001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SURRGH001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURRGH001-geteachGRAPH',
      data: {
        "GAPname": SURRGH001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SURRGH001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURRGH001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURRGH001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURRGH001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURRGH001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURRGH001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURRGH001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURRGH001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_SURRGH001FINISH

  Future<void> _TRICKER_SURRGH001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURRGH001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
