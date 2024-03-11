import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoAPPPHBP12 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoSURBAL013 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoSURTHI002 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoSURRGH001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoSURMIC001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoSURMCS001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoCTCSEM001 extends TRICKERMASTER_Event {}

//

class TRICKERMASTER_GETINtoHGMCS001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHGHRC002 extends TRICKERMASTER_Event {}

class TRICKERMASTER_FLUSH extends TRICKERMASTER_Event {}

class TRICKERMASTER_Bloc extends Bloc<TRICKERMASTER_Event, String> {
  TRICKERMASTER_Bloc() : super('') {
    on<TRICKERMASTER_GETINtoAPPPHBP12>((event, emit) {
      return _TRICKERMASTER_GETINtoAPPPHBP12('', emit);
    });

    on<TRICKERMASTER_GETINtoSURBAL013>((event, emit) {
      return _TRICKERMASTER_GETINtoSURBAL013('', emit);
    });

    on<TRICKERMASTER_GETINtoSURTHI002>((event, emit) {
      return _TRICKERMASTER_GETINtoSURTHI002('', emit);
    });

    on<TRICKERMASTER_GETINtoSURRGH001>((event, emit) {
      return _TRICKERMASTER_GETINtoSURRGH001('', emit);
    });

    on<TRICKERMASTER_GETINtoHGHRC002>((event, emit) {
      return _TRICKERMASTER_GETINtoHGHRC002('', emit);
    });

    on<TRICKERMASTER_GETINtoHGMCS001>((event, emit) {
      return _TRICKERMASTER_GETINtoHGMCS001('', emit);
    });

    on<TRICKERMASTER_GETINtoSURMIC001>((event, emit) {
      return _TRICKERMASTER_GETINtoSURMIC001('', emit);
    });

    on<TRICKERMASTER_GETINtoSURMCS001>((event, emit) {
      return _TRICKERMASTER_GETINtoSURMCS001('', emit);
    });

    on<TRICKERMASTER_GETINtoCTCSEM001>((event, emit) {
      return _TRICKERMASTER_GETINtoCTCSEM001('', emit);
    });

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

    print(output);
    emit(output);
  }

  Future<void> _TRICKERMASTER_GETINtoSURBAL013(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoSURBAL013',
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

  Future<void> _TRICKERMASTER_GETINtoSURTHI002(
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

  Future<void> _TRICKERMASTER_GETINtoSURRGH001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoSURRGH001',
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

  Future<void> _TRICKERMASTER_GETINtoHGMCS001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGMCS001',
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

  Future<void> _TRICKERMASTER_GETINtoHGHRC002(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHGHRC002',
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

  Future<void> _TRICKERMASTER_GETINtoSURMIC001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoSURMIC001',
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

  //
  Future<void> _TRICKERMASTER_GETINtoSURMCS001(
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
    emit(output);
  }

  Future<void> _TRICKERMASTER_GETINtoCTCSEM001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoCTCSEM001',
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

  Future<void> _TRICKERMASTER_GETINtoAPPGASGW(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoAPPGASGW',
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

  Future<void> _TRICKERMASTER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
