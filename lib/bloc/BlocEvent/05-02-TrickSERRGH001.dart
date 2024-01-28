import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P5SER-RGH-001/SERRGH001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoSERRGH001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_SERRGH001geteachITEM extends TRICKER_Event {}

class TRICKER_SERRGH001geteachGRAPH extends TRICKER_Event {}

class TRICKER_SERRGH001confirmdata extends TRICKER_Event {}

class TRICKER_SERRGH001CLEAR extends TRICKER_Event {}

class TRICKER_SERRGH001RESETVALUE extends TRICKER_Event {}

class TRICKER_SERRGH001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_SERRGH001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_SERRGH001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_SERRGH001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoSERRGH001>((event, emit) {
      return _TRICKER_GETINtoSERRGH001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_SERRGH001geteachITEM>((event, emit) {
      return _TRICKER_SERRGH001geteachITEM('', emit);
    });

    on<TRICKER_SERRGH001geteachGRAPH>((event, emit) {
      return _TRICKER_SERRGH001geteachGRAPH('', emit);
    });

    on<TRICKER_SERRGH001confirmdata>((event, emit) {
      return _TRICKER_SERRGH001confirmdata('', emit);
    });

    on<TRICKER_SERRGH001CLEAR>((event, emit) {
      return _TRICKER_SERRGH001CLEAR('', emit);
    });

    on<TRICKER_SERRGH001RESETVALUE>((event, emit) {
      return _TRICKER_SERRGH001RESETVALUE('', emit);
    });

    on<TRICKER_SERRGH001SETZERO>((event, emit) {
      return _TRICKER_SERRGH001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_SERRGH001FINISH>((event, emit) {
      return _TRICKER_SERRGH001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoSERRGH001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoSERRGH001',
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

  Future<void> _TRICKER_SERRGH001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERRGH001-geteachITEM',
      data: {
        "ITEMs": SERRGH001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SERRGH001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERRGH001-geteachGRAPH',
      data: {
        "GAPname": SERRGH001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SERRGH001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERRGH001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERRGH001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERRGH001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERRGH001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERRGH001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERRGH001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERRGH001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_SERRGH001FINISH

  Future<void> _TRICKER_SERRGH001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERRGH001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
