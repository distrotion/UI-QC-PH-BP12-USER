import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P3SUR-BAL-013/SURBAL013main.dart';
import '../../page/P3SUR-BAL-013/SURBAL013var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoSURBAL013 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_SURBAL013geteachITEM extends TRICKER_Event {}

class TRICKER_SURBAL013geteachGRAPH extends TRICKER_Event {}

class TRICKER_SURBAL013confirmdata extends TRICKER_Event {}

class TRICKER_SURBAL013CLEAR extends TRICKER_Event {}

class TRICKER_SURBAL013RESETVALUE extends TRICKER_Event {}

class TRICKER_SURBAL013SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_SURBAL013REFER extends TRICKER_Event {}

class TRICKER_SURBAL013FINISH extends TRICKER_Event {}

class TRICKER_SURBAL013AEAR extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_SURBAL013_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_SURBAL013_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoSURBAL013>((event, emit) {
      return _TRICKER_GETINtoSURBAL013('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_SURBAL013geteachITEM>((event, emit) {
      return _TRICKER_SURBAL013geteachITEM('', emit);
    });

    on<TRICKER_SURBAL013geteachGRAPH>((event, emit) {
      return _TRICKER_SURBAL013geteachGRAPH('', emit);
    });

    on<TRICKER_SURBAL013confirmdata>((event, emit) {
      return _TRICKER_SURBAL013confirmdata('', emit);
    });

    on<TRICKER_SURBAL013CLEAR>((event, emit) {
      return _TRICKER_SURBAL013CLEAR('', emit);
    });

    on<TRICKER_SURBAL013RESETVALUE>((event, emit) {
      return _TRICKER_SURBAL013RESETVALUE('', emit);
    });

    on<TRICKER_SURBAL013SETZERO>((event, emit) {
      return _TRICKER_SURBAL013SETZERO('', emit);
    });

    on<TRICKER_SURBAL013AEAR>((event, emit) {
      return _TRICKER_SURBAL013AEAR('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_SURBAL013REFER>((event, emit) {
      return _TRICKER_SURBAL013REFER('', emit);
    });

    on<TRICKER_SURBAL013FINISH>((event, emit) {
      return _TRICKER_SURBAL013FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoSURBAL013(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GETINtoSURBAL013',
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

  Future<void> _TRICKER_SURBAL013geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURBAL013-geteachITEM',
      data: {
        "ITEMs": SURBAL013var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SURBAL013geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURBAL013-geteachGRAPH',
      data: {
        "GAPname": SURBAL013var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_SURBAL013confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURBAL013-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURBAL013CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURBAL013-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURBAL013RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURBAL013-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURBAL013SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURBAL013-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_SURBAL013FINISH

  Future<void> _TRICKER_SURBAL013REFER(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURBAL013-REFLOT',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_SURBAL013FINISH(
      String toAdd, Emitter<String> emit) async {
    if (SURBAL013var.RESULTFORMAT == 'CAL1') {
      final response = await Dio().post(
        server + 'FINAL/SURBAL013-FINISH-CAL1',
        data: {},
      );
    } else if (SURBAL013var.RESULTFORMAT == 'CAL2') {
      final response = await Dio().post(
        server + 'FINAL/SURBAL013-FINISH-CAL2',
        data: {},
      );
    }

    emit('');
  }

  Future<void> _TRICKER_SURBAL013AEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'FINAL/SURBAL013-preview-aear',
      data: [
        {"AEAR": SURBAL013var.ARAE_ANS}
      ],
    );
    Navigator.pop(BALANCE_SURBAL013maincontext);
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
