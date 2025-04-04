import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

//-------------------------------------------------

String server = GLOserver;

abstract class GetINS_Event {}

class GETINSset extends GetINS_Event {}

class GetINS_Bloc extends Bloc<GetINS_Event, List<String>> {
  GetINS_Bloc() : super([]) {
    on<GETINSset>((event, emit) {
      return _GetINS([], emit);
    });
  }
  Future<void> _GetINS(List<String> toAdd, Emitter<List<String>> emit) async {
    List<String> output = [];
    final response = await Dio().post(
      server + 'FINAL/GETINSset',
      data: {
        "PO": FIRSTUI.POACTIVE,
        "CP": FIRSTUI.CPACTIVE,
      },
    );

    print("------------>${FIRSTUI.POACTIVE}");
    print("------------>${FIRSTUI.CPACTIVE}");
    // print(response);
    FIRSTUI.MODE_IP_FN = 'FN';
    if (response.statusCode == 200) {
      var databuff = response.data;
      // FIRSTUI.MODE_IP_FN = 'IP';
      for (int i = 0; i < databuff.length; i++) {
        output.add(databuff[i].toString());
      }

      // if (databuff.length == 0) {
      //   final responseFN = await Dio().post(
      //     server + 'FINAL/GETINSset',
      //     data: {
      //       "PO": FIRSTUI.POACTIVE,
      //       "CP": FIRSTUI.CPACTIVE,
      //     },
      //   );

      //   if (responseFN.statusCode == 200) {
      //     var databuffFN = responseFN.data;
      //     FIRSTUI.MODE_IP_FN = 'FN';

      //     for (int i = 0; i < databuffFN.length; i++) {
      //       output.add(databuffFN[i].toString());
      //     }
      //   }
      // }
    } else {
      //
    }
    emit(output);
  }
}
