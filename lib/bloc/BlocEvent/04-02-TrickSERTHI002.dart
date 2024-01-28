import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P4SER-THI-002/SERTHI002var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoSERTHI002 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_SERTHI002geteachITEM extends TRICKER_Event {}

class TRICKER_SERTHI002geteachGRAPH extends TRICKER_Event {}

class TRICKER_SERTHI002confirmdata extends TRICKER_Event {}

class TRICKER_SERTHI002CLEAR extends TRICKER_Event {}

class TRICKER_SERTHI002RESETVALUE extends TRICKER_Event {}

class TRICKER_SERTHI002SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_SERTHI002FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_SERTHI002_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_SERTHI002_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoSERTHI002>((event, emit) {
      return _TRICKER_GETINtoSERTHI002('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_SERTHI002geteachITEM>((event, emit) {
      return _TRICKER_SERTHI002geteachITEM('', emit);
    });

    on<TRICKER_SERTHI002geteachGRAPH>((event, emit) {
      return _TRICKER_SERTHI002geteachGRAPH('', emit);
    });

    on<TRICKER_SERTHI002confirmdata>((event, emit) {
      return _TRICKER_SERTHI002confirmdata('', emit);
    });

    on<TRICKER_SERTHI002CLEAR>((event, emit) {
      return _TRICKER_SERTHI002CLEAR('', emit);
    });

    on<TRICKER_SERTHI002RESETVALUE>((event, emit) {
      return _TRICKER_SERTHI002RESETVALUE('', emit);
    });

    on<TRICKER_SERTHI002SETZERO>((event, emit) {
      return _TRICKER_SERTHI002SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_SERTHI002FINISH>((event, emit) {
      return _TRICKER_SERTHI002FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoSERTHI002(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoSERTHI002',
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

  Future<void> _TRICKER_SERTHI002geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERTHI002-geteachITEM',
      data: {
        "ITEMs": SERTHI002var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SERTHI002geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERTHI002-geteachGRAPH',
      data: {
        "GAPname": SERTHI002var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SERTHI002confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERTHI002-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERTHI002CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERTHI002-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERTHI002RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERTHI002-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SERTHI002SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERTHI002-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_SERTHI002FINISH

  Future<void> _TRICKER_SERTHI002FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERTHI002-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
