import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

import '../../page/P7SER-MSC-001/SERMSC001main.dart';
import '../../page/P7SER-MSC-001/SERMSC001var.dart';
import '07-01-SERMSC001.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoSERMSC001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_SERMSC001geteachITEM extends TRICKER_Event {}

class TRICKER_SERMSC001geteachGRAPH extends TRICKER_Event {}

class TRICKER_SERMSC001confirmdata extends TRICKER_Event {}

class TRICKER_SERMSC001CLEAR extends TRICKER_Event {}

class TRICKER_SERMSC001RESETVALUE extends TRICKER_Event {}

class TRICKER_SERMSC001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_SERMSC001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_SERMSC001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_SERMSC001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoSERMSC001>((event, emit) {
      return _TRICKER_GETINtoSERMSC001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_SERMSC001geteachITEM>((event, emit) {
      return _TRICKER_SERMSC001geteachITEM('', emit);
    });

    on<TRICKER_SERMSC001confirmdata>((event, emit) {
      return _TRICKER_SERMSC001confirmdata('', emit);
    });

    on<TRICKER_SERMSC001CLEAR>((event, emit) {
      return _TRICKER_SERMSC001CLEAR('', emit);
    });

    on<TRICKER_SERMSC001RESETVALUE>((event, emit) {
      return _TRICKER_SERMSC001RESETVALUE('', emit);
    });

    on<TRICKER_SERMSC001SETZERO>((event, emit) {
      return _TRICKER_SERMSC001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_SERMSC001FINISH>((event, emit) {
      return _TRICKER_SERMSC001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoSERMSC001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoSERMSC001',
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
    MICROSCOPESERMSC001_CONTEXT.read<SERMSC001_Bloc>().add(SERMSC001_READ());
    emit(output);
  }

  Future<void> _TRICKER_SERMSC001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMSC001-geteachITEM',
      data: {
        "ITEMs": SERMSC001var.ItemPickSELECT,
      },
    );
    MICROSCOPESERMSC001_CONTEXT.read<SERMSC001_Bloc>().add(SERMSC001_READ());
    emit('');
  }

  Future<void> _TRICKER_SERMSC001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMSC001-confirmdata',
      data: {},
    );
    MICROSCOPESERMSC001_CONTEXT.read<SERMSC001_Bloc>().add(SERMSC001_READ());
    emit('');
  }

  Future<void> _TRICKER_SERMSC001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMSC001-CLEAR',
      data: {},
    );
    MICROSCOPESERMSC001_CONTEXT.read<SERMSC001_Bloc>().add(SERMSC001_READ());
    emit('');
  }

  Future<void> _TRICKER_SERMSC001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMSC001-RESETVALUE',
      data: {},
    );
    MICROSCOPESERMSC001_CONTEXT.read<SERMSC001_Bloc>().add(SERMSC001_READ());
    emit('');
  }

  Future<void> _TRICKER_SERMSC001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMSC001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_SERMSC001FINISH

  Future<void> _TRICKER_SERMSC001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SERMSC001-FINISH-IMG',
      data: {
        "IMG01": SERMSC001var.base64pic01,
        "IMG02": SERMSC001var.base64pic02,
        "IMG03": SERMSC001var.base64pic03,
        "IMG04": SERMSC001var.base64pic04,
        "IMG01data": SERMSC001var.base64pic01data,
        "IMG02data": SERMSC001var.base64pic02data,
        "IMG03data": SERMSC001var.base64pic03data,
        "IMG04data": SERMSC001var.base64pic04data,
      },
    );
    if (response.statusCode == 200) {
      MICROSCOPESERMSC001_CONTEXT.read<SERMSC001_Bloc>().add(SERMSC001_READ());
    }

    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    MICROSCOPESERMSC001_CONTEXT.read<SERMSC001_Bloc>().add(SERMSC001_READ());
    emit('');
  }
}
