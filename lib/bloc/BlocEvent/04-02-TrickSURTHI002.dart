import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P4SUR-THI-002/SURTHI002var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoSURTHI002 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_SURTHI002geteachITEM extends TRICKER_Event {}

class TRICKER_SURTHI002geteachGRAPH extends TRICKER_Event {}

class TRICKER_SURTHI002confirmdata extends TRICKER_Event {}

class TRICKER_SURTHI002CLEAR extends TRICKER_Event {}

class TRICKER_SURTHI002RESETVALUE extends TRICKER_Event {}

class TRICKER_SURTHI002SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_SURTHI002FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_SURTHI002_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_SURTHI002_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoSURTHI002>((event, emit) {
      return _TRICKER_GETINtoSURTHI002('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_SURTHI002geteachITEM>((event, emit) {
      return _TRICKER_SURTHI002geteachITEM('', emit);
    });

    on<TRICKER_SURTHI002geteachGRAPH>((event, emit) {
      return _TRICKER_SURTHI002geteachGRAPH('', emit);
    });

    on<TRICKER_SURTHI002confirmdata>((event, emit) {
      return _TRICKER_SURTHI002confirmdata('', emit);
    });

    on<TRICKER_SURTHI002CLEAR>((event, emit) {
      return _TRICKER_SURTHI002CLEAR('', emit);
    });

    on<TRICKER_SURTHI002RESETVALUE>((event, emit) {
      return _TRICKER_SURTHI002RESETVALUE('', emit);
    });

    on<TRICKER_SURTHI002SETZERO>((event, emit) {
      return _TRICKER_SURTHI002SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_SURTHI002FINISH>((event, emit) {
      return _TRICKER_SURTHI002FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoSURTHI002(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoSURTHI002',
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

  Future<void> _TRICKER_SURTHI002geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURTHI002-geteachITEM',
      data: {
        "ITEMs": SURTHI002var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SURTHI002geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURTHI002-geteachGRAPH',
      data: {
        "GAPname": SURTHI002var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SURTHI002confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURTHI002-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURTHI002CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURTHI002-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURTHI002RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURTHI002-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURTHI002SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURTHI002-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_SURTHI002FINISH

  Future<void> _TRICKER_SURTHI002FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'SURTHI002-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
