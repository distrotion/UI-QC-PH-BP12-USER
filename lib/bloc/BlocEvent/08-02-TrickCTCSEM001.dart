import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P8CTC-SEM-001/CTCSEM001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoCTCSEM001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_CTCSEM001geteachITEM extends TRICKER_Event {}

class TRICKER_CTCSEM001geteachGRAPH extends TRICKER_Event {}

class TRICKER_CTCSEM001preview extends TRICKER_Event {}

class TRICKER_CTCSEM001confirmdata extends TRICKER_Event {}

class TRICKER_CTCSEM001CLEAR extends TRICKER_Event {}

class TRICKER_CTCSEM001RESETVALUE extends TRICKER_Event {}

class TRICKER_CTCSEM001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_CTCSEM001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_CTCSEM001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_CTCSEM001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoCTCSEM001>((event, emit) {
      return _TRICKER_GETINtoCTCSEM001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_CTCSEM001geteachITEM>((event, emit) {
      return _TRICKER_CTCSEM001geteachITEM('', emit);
    });

    on<TRICKER_CTCSEM001geteachGRAPH>((event, emit) {
      return _TRICKER_CTCSEM001geteachGRAPH('', emit);
    });

    on<TRICKER_CTCSEM001preview>((event, emit) {
      return _TRICKER_CTCSEM001preview('', emit);
    });

    on<TRICKER_CTCSEM001confirmdata>((event, emit) {
      return _TRICKER_CTCSEM001confirmdata('', emit);
    });

    on<TRICKER_CTCSEM001CLEAR>((event, emit) {
      return _TRICKER_CTCSEM001CLEAR('', emit);
    });

    on<TRICKER_CTCSEM001RESETVALUE>((event, emit) {
      return _TRICKER_CTCSEM001RESETVALUE('', emit);
    });

    on<TRICKER_CTCSEM001SETZERO>((event, emit) {
      return _TRICKER_CTCSEM001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_CTCSEM001FINISH>((event, emit) {
      return _TRICKER_CTCSEM001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoCTCSEM001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoCTCSEM001',
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

  Future<void> _TRICKER_CTCSEM001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCSEM001-geteachITEM',
      data: {
        "ITEMs": CTCSEM001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_CTCSEM001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCSEM001-geteachGRAPH',
      data: {
        "GAPname": CTCSEM001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_CTCSEM001preview(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCSEM001-preview',
      data: [
        {"V1": "SEM", "V2": CTCSEM001var.SINGLEINPUT}
      ],
    );
    if (response.statusCode == 200) {
      final response = await Dio().post(
        server + 'CTCSEM001-confirmdata',
        data: {},
      );
    }
    CTCSEM001var.SINGLEINPUT = '';
    emit('');
  }

  Future<void> _TRICKER_CTCSEM001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCSEM001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_CTCSEM001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCSEM001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_CTCSEM001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCSEM001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_CTCSEM001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCSEM001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_CTCSEM001FINISH

  Future<void> _TRICKER_CTCSEM001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'CTCSEM001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
