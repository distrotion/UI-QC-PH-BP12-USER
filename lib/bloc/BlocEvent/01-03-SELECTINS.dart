import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoAPPPHBP12 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHGHMV001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHGHMV002 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHGHMV003 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHGVHT001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHIMICM001 extends TRICKERMASTER_Event {}

//

class TRICKERMASTER_GETINtoHGMSC001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHGHRC002 extends TRICKERMASTER_Event {}

class TRICKERMASTER_FLUSH extends TRICKERMASTER_Event {}

class TRICKERMASTER_Bloc extends Bloc<TRICKERMASTER_Event, String> {
  TRICKERMASTER_Bloc() : super('') {
    on<TRICKERMASTER_GETINtoAPPPHBP12>((event, emit) {
      return _TRICKERMASTER_GETINtoAPPPHBP12('', emit);
    });

    on<TRICKERMASTER_GETINtoHGHMV001>((event, emit) {
      return _TRICKERMASTER_GETINtoHGHMV001('', emit);
    });

    on<TRICKERMASTER_GETINtoHGHMV002>((event, emit) {
      return _TRICKERMASTER_GETINtoHGHMV002('', emit);
    });

    on<TRICKERMASTER_GETINtoHGHMV003>((event, emit) {
      return _TRICKERMASTER_GETINtoHGHMV003('', emit);
    });

    on<TRICKERMASTER_GETINtoHGHRC002>((event, emit) {
      return _TRICKERMASTER_GETINtoHGHRC002('', emit);
    });

    on<TRICKERMASTER_GETINtoHGMSC001>((event, emit) {
      return _TRICKERMASTER_GETINtoHGMSC001('', emit);
    });

    on<TRICKERMASTER_GETINtoHGVHT001>((event, emit) {
      return _TRICKERMASTER_GETINtoHGVHT001('', emit);
    });

    // on<TRICKERMASTER_GETINtoHIMICM001>((event, emit) {
    //   return _TRICKERMASTER_GETINtoHIMICM001('', emit);
    // });

    on<TRICKERMASTER_FLUSH>((event, emit) {
      return _TRICKERMASTER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKERMASTER_GETINtoAPPPHBP12(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoAPPPHBP12',
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

    print(output);
    emit(output);
  }

  Future<void> _TRICKERMASTER_GETINtoHGHMV001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGHMV001',
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

  Future<void> _TRICKERMASTER_GETINtoHGHMV002(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGHMV002',
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

  Future<void> _TRICKERMASTER_GETINtoHGHMV003(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGHMV003',
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

  Future<void> _TRICKERMASTER_GETINtoHGMSC001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGMSC001',
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

  Future<void> _TRICKERMASTER_GETINtoHGHRC002(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGHRC002',
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

  Future<void> _TRICKERMASTER_GETINtoHGVHT001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGVHT001',
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

  //
  Future<void> _TRICKERMASTER_GETINtoHIMICM001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHIMICM001',
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

  Future<void> _TRICKERMASTER_GETINtoAPPGASGW(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoAPPGASGW',
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

  Future<void> _TRICKERMASTER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
