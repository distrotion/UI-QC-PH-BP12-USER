import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P7SUR-MCS-001/SURMCS001main.dart';
import '../../page/P7SUR-MCS-001/SURMCS001var.dart';
import '07-01-SURMCS001.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoSURMCS001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_SURMCS001geteachITEM extends TRICKER_Event {}

class TRICKER_SURMCS001geteachGRAPH extends TRICKER_Event {}

class TRICKER_SURMCS001confirmdata extends TRICKER_Event {}

class TRICKER_SURMCS001CLEAR extends TRICKER_Event {}

class TRICKER_SURMCS001RESETVALUE extends TRICKER_Event {}

class TRICKER_SURMCS001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_SURMCS001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_SURMCS001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_SURMCS001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoSURMCS001>((event, emit) {
      return _TRICKER_GETINtoSURMCS001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_SURMCS001geteachITEM>((event, emit) {
      return _TRICKER_SURMCS001geteachITEM('', emit);
    });

    on<TRICKER_SURMCS001confirmdata>((event, emit) {
      return _TRICKER_SURMCS001confirmdata('', emit);
    });

    on<TRICKER_SURMCS001CLEAR>((event, emit) {
      return _TRICKER_SURMCS001CLEAR('', emit);
    });

    on<TRICKER_SURMCS001RESETVALUE>((event, emit) {
      return _TRICKER_SURMCS001RESETVALUE('', emit);
    });

    on<TRICKER_SURMCS001SETZERO>((event, emit) {
      return _TRICKER_SURMCS001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_SURMCS001FINISH>((event, emit) {
      return _TRICKER_SURMCS001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoSURMCS001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoSURMCS001',
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
    MICROSCOPESURMCS001_CONTEXT.read<SURMCS001_Bloc>().add(SURMCS001_READ());
    emit(output);
  }

  Future<void> _TRICKER_SURMCS001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURMCS001-geteachITEM',
      data: {
        "ITEMs": SURMCS001var.ItemPickSELECT,
      },
    );
    MICROSCOPESURMCS001_CONTEXT.read<SURMCS001_Bloc>().add(SURMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_SURMCS001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURMCS001-confirmdata',
      data: {},
    );
    MICROSCOPESURMCS001_CONTEXT.read<SURMCS001_Bloc>().add(SURMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_SURMCS001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURMCS001-CLEAR',
      data: {},
    );
    MICROSCOPESURMCS001_CONTEXT.read<SURMCS001_Bloc>().add(SURMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_SURMCS001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURMCS001-RESETVALUE',
      data: {},
    );
    MICROSCOPESURMCS001_CONTEXT.read<SURMCS001_Bloc>().add(SURMCS001_READ());
    emit('');
  }

  Future<void> _TRICKER_SURMCS001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURMCS001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_SURMCS001FINISH

  Future<void> _TRICKER_SURMCS001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURMCS001-FINISH-IMG',
      data: {
        "IMG01": SURMCS001var.base64pic01,
        "IMG02": SURMCS001var.base64pic02,
        "IMG03": SURMCS001var.base64pic03,
        "IMG04": SURMCS001var.base64pic04,
        "IMG01data": SURMCS001var.base64pic01data,
        "IMG02data": SURMCS001var.base64pic02data,
        "IMG03data": SURMCS001var.base64pic03data,
        "IMG04data": SURMCS001var.base64pic04data,
      },
    );
    if (response.statusCode == 200) {
      MICROSCOPESURMCS001_CONTEXT.read<SURMCS001_Bloc>().add(SURMCS001_READ());
    }

    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    MICROSCOPESURMCS001_CONTEXT.read<SURMCS001_Bloc>().add(SURMCS001_READ());
    emit('');
  }
}
