import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../model/model.dart';
import '../../page/P11MASTERGRAPH/MASTERGRAPHvar.dart';

//-------------------------------------------------

String server = GLOserver;

abstract class GRAPHMASTER_Event {}

class GRAPHMASTER_READ extends GRAPHMASTER_Event {}

class GRAPHMASTER_WRITE extends GRAPHMASTER_Event {}

class GRAPHMASTER_Bloc extends Bloc<GRAPHMASTER_Event, List<dataset>> {
  GRAPHMASTER_Bloc() : super([]) {
    on<GRAPHMASTER_READ>((event, emit) {
      return _GRAPHMASTER_READ([], emit);
    });
    on<GRAPHMASTER_WRITE>((event, emit) {
      return _GRAPHMASTER_WRITE([], emit);
    });
  }
  Future<void> _GRAPHMASTER_READ(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GRAPH-STD-GET',
      data: {},
    );
    List<dataset> output = [];
    if (response.statusCode == 200) {
      var databuff = response.data;

      // print(databuff);
      for (int i = 0; i < databuff.length; i++) {
        output.add(dataset(
          id: i + 1,
          f01: databuff[i]['UID'] ?? '',
          f02: databuff[i]['NO'] ?? '',
          f03: databuff[i]['GT1'] ?? '',
          f04: databuff[i]['GT2'] ?? '',
          f05: databuff[i]['GT3'] ?? '',
          f06: databuff[i]['GT4'] ?? '',
          f07: databuff[i]['GT5'] ?? '',
          f08: databuff[i]['GT6'] ?? '',
          f09: databuff[i]['GT7'] ?? '',
          f10: databuff[i]['GT8'] ?? '',
          f11: databuff[i]['GT9'] ?? '',
          f12: databuff[i]['GT10'] ?? '',
          f13: databuff[i]['GT11'] ?? '',
          f14: databuff[i]['GT12'] ?? '',
          f15: databuff[i]['GT13'] ?? '',
          f16: databuff[i]['GT14'] ?? '',
          f17: databuff[i]['GT15'] ?? '',
          f18: databuff[i]['GT16'] ?? '',
          f19: databuff[i]['GT17'] ?? '',
          f20: databuff[i]['GT18'] ?? '',
          f21: databuff[i]['GT19'] ?? '',
          f22: databuff[i]['GT20'] ?? '',
        ));
      }
    }
    emit(output);
  }

  Future<void> _GRAPHMASTER_WRITE(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    final response = await Dio().post(
      server + 'FINAL/GRAPH-STD-UPDATE',
      data: {
        "UID": MASTERGRAPHvar.con01,
        "NO": MASTERGRAPHvar.con02,
        "GT1": MASTERGRAPHvar.GAP01,
        "GT2": MASTERGRAPHvar.GAP02,
        "GT3": MASTERGRAPHvar.GAP03,
        "GT4": MASTERGRAPHvar.GAP04,
        "GT5": MASTERGRAPHvar.GAP05,
        "GT6": MASTERGRAPHvar.GAP06,
        "GT7": MASTERGRAPHvar.GAP07,
        "GT8": MASTERGRAPHvar.GAP08,
        "GT9": MASTERGRAPHvar.GAP09,
        "GT10": MASTERGRAPHvar.GAP10,
        "GT11": MASTERGRAPHvar.GAP11,
        "GT12": MASTERGRAPHvar.GAP12,
        "GT13": MASTERGRAPHvar.GAP13,
        "GT14": MASTERGRAPHvar.GAP14,
        "GT15": MASTERGRAPHvar.GAP15,
        "GT16": MASTERGRAPHvar.GAP16,
        "GT17": MASTERGRAPHvar.GAP17,
        "GT18": MASTERGRAPHvar.GAP18,
        "GT19": MASTERGRAPHvar.GAP19,
        "GT20": MASTERGRAPHvar.GAP20,
      },
    );
    //--------

    List<dataset> output = [];
    if (response.statusCode == 200) {
      var databuff = response.data;

      // print(databuff);
      for (int i = 0; i < databuff.length; i++) {
        output.add(dataset(
          id: i + 1,
          f01: databuff[i]['UID'] ?? '',
          f02: databuff[i]['NO'] ?? '',
          f03: databuff[i]['GT1'] ?? '',
          f04: databuff[i]['GT2'] ?? '',
          f05: databuff[i]['GT3'] ?? '',
          f06: databuff[i]['GT4'] ?? '',
          f07: databuff[i]['GT5'] ?? '',
          f08: databuff[i]['GT6'] ?? '',
          f09: databuff[i]['GT7'] ?? '',
          f10: databuff[i]['GT8'] ?? '',
          f11: databuff[i]['GT9'] ?? '',
          f12: databuff[i]['GT10'] ?? '',
          f13: databuff[i]['GT11'] ?? '',
          f14: databuff[i]['GT12'] ?? '',
          f15: databuff[i]['GT13'] ?? '',
          f16: databuff[i]['GT14'] ?? '',
          f17: databuff[i]['GT15'] ?? '',
          f18: databuff[i]['GT16'] ?? '',
          f19: databuff[i]['GT17'] ?? '',
          f20: databuff[i]['GT18'] ?? '',
          f21: databuff[i]['GT19'] ?? '',
          f22: databuff[i]['GT20'] ?? '',
        ));
      }
    }
    emit(output);
  }
}
