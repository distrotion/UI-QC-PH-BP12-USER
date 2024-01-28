import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P3SER-BAL-013/SERBAL013var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoSERBAL013 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_SERBAL013geteachITEM extends TRICKER_Event {}

class TRICKER_SERBAL013geteachGRAPH extends TRICKER_Event {}

class TRICKER_SERBAL013confirmdata extends TRICKER_Event {}

class TRICKER_SERBAL013CLEAR extends TRICKER_Event {}

class TRICKER_SERBAL013RESETVALUE extends TRICKER_Event {}

class TRICKER_SERBAL013SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_SERBAL013FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_SERBAL013_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_SERBAL013_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoSERBAL013>((event, emit) {
      return _TRICKER_GETINtoSERBAL013('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_SERBAL013geteachITEM>((event, emit) {
      return _TRICKER_SERBAL013geteachITEM('', emit);
    });

    on<TRICKER_SERBAL013geteachGRAPH>((event, emit) {
      return _TRICKER_SERBAL013geteachGRAPH('', emit);
    });

    on<TRICKER_SERBAL013confirmdata>((event, emit) {
      return _TRICKER_SERBAL013confirmdata('', emit);
    });

    on<TRICKER_SERBAL013CLEAR>((event, emit) {
      return _TRICKER_SERBAL013CLEAR('', emit);
    });

    on<TRICKER_SERBAL013RESETVALUE>((event, emit) {
      return _TRICKER_SERBAL013RESETVALUE('', emit);
    });

    on<TRICKER_SERBAL013SETZERO>((event, emit) {
      return _TRICKER_SERBAL013SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_SERBAL013FINISH>((event, emit) {
      return _TRICKER_SERBAL013FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoSERBAL013(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoSERBAL013',
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

  Future<void> _TRICKER_SERBAL013geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERBAL013-geteachITEM',
      data: {
        "ITEMs": SERBAL013var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SERBAL013geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERBAL013-geteachGRAPH',
      data: {
        "GAPname": SERBAL013var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SERBAL013confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERBAL013-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERBAL013CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERBAL013-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERBAL013RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERBAL013-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERBAL013SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERBAL013-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_SERBAL013FINISH

  Future<void> _TRICKER_SERBAL013FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERBAL013-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
