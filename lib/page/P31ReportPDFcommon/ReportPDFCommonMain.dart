import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/Cubit/31-ReportPDFCommoncubit.dart';
import '../../data/global.dart';
import '../../widget/GRAPH/LineGraph01.dart';
import '../../widget/ReportComponent/CommonReport.dart';
import '../../widget/ReportComponent/PicSlot.dart';
import '../../widget/ReportComponent/SignSide.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/ErrorPopup.dart';
import '../../widget/common/Error_NO_Popup.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/common/imgset.dart';
import '../../widget/common/popup.dart';
import '../../widget/function/helper.dart';
import '../P303QMMASTERQC/P303QMMASTERQCVAR.dart';
import '../page303.dart';
import 'ReportPDFCommonvar.dart';

late BuildContext ReportPDFCommoncontext;

class ReportPDFCommon extends StatefulWidget {
  ReportPDFCommon({
    Key? key,
    this.dataCommon,
  }) : super(key: key);
  CommonReportOutput? dataCommon;
  @override
  State<ReportPDFCommon> createState() => _ReportPDFCommonState();
}

class _ReportPDFCommonState extends State<ReportPDFCommon> {
  @override
  void initState() {
    if (ReportPDFCommonvar.PO != '') {
      ReportPDFCommonvar.canf = false;
      context
          .read<ReportPDFCommon_Cubit>()
          .ReportPDFCommonCubit(ReportPDFCommonvar.PO);

      ReportPDFCommonvar.TPKLOTEDIT = '';
      ReportPDFCommonvar.QTYEDIT = '';
      ReportPDFCommonvar.INCresult = '';
      ReportPDFCommonvar.MATERIALEDIT = '';
      ReportPDFCommonvar.HIDEDATA = false;
      ReportPDFCommonvar.HIDEDATAPIC = false;
    }
    super.initState();
  }

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ReportPDFCommoncontext = context;

    CommonReportOutput _dataCOMMON = widget.dataCommon ??
        CommonReportOutput(
          databasic: BasicCommonDATA(),
          CAL2datadata: CAL2data(),
        );
    int HardnessNO = 1;
    int CoreNO = 1;
    int GraphNO = 1;
    int CompoundNO = 1;
    int RoughnessNO = 1;
    int lengthdata = 0;

    if (_dataCOMMON.datain.isNotEmpty) {
      //
      ReportPDFCommonvar.STATUS = 'REPORT READY';
      ReportPDFCommonvar.CUSTOMER = _dataCOMMON.databasic.CUSTOMER;
      ReportPDFCommonvar.PROCESS = _dataCOMMON.databasic.PROCESS;
      ReportPDFCommonvar.PARTNAME = _dataCOMMON.databasic.PARTNAME;
      ReportPDFCommonvar.PARTNO = _dataCOMMON.databasic.PARTNO;
      ReportPDFCommonvar.PARTNO_s = _dataCOMMON.databasic.PARTNO_s;
      ReportPDFCommonvar.CUSLOT = _dataCOMMON.databasic.CUSLOT;
      ReportPDFCommonvar.TPKLOT = _dataCOMMON.databasic.TPKLOT;
      ReportPDFCommonvar.MATERIAL = _dataCOMMON.databasic.MATERIAL;
      if (_dataCOMMON.databasic.UNITSAP.toUpperCase() != 'KG') {
        ReportPDFCommonvar.QTY =
            '${double.parse(ConverstStr(_dataCOMMON.databasic.QTY)).toStringAsFixed(0)} ${_dataCOMMON.databasic.UNITSAP}';
      } else {
        ReportPDFCommonvar.QTY =
            '${double.parse(ConverstStr(_dataCOMMON.databasic.QTY)).toStringAsFixed(1)} ${_dataCOMMON.databasic.UNITSAP}';
      }

      ReportPDFCommonvar.PIC01 = _dataCOMMON.databasic.PIC01;
      ReportPDFCommonvar.PIC02 = _dataCOMMON.databasic.PIC02;
      ReportPDFCommonvar.PICstd = _dataCOMMON.databasic.PICstd;

      ReportPDFCommonvar.PASS = _dataCOMMON.databasic.PASS;
      ReportPDFCommonvar.remark = '';
      if (_dataCOMMON.databasic.PARTNAMEref != '') {
        // ReportPDFCommonvar.remark =
        //     'Reference data from\n${_dataCOMMON.databasic.PARTNAMEref}\n${_dataCOMMON.databasic.PARTref}';
        ReportPDFCommonvar.remark =
            'Reference data from TP LOT NO. ${_dataCOMMON.databasic.TPKLOTref}';

        //TPKLOTref
      }

      ReportPDFCommonvar.INC01 = _dataCOMMON.databasic.INC01;
      ReportPDFCommonvar.INC02 = _dataCOMMON.databasic.INC02;
      ReportPDFCommonvar.INSBY = _dataCOMMON.databasic.INSBY;
      ReportPDFCommonvar.CHECKBY = _dataCOMMON.databasic.CHECKBY;
      ReportPDFCommonvar.APPBY = _dataCOMMON.databasic.APPBY;

      // _dataCOMMON.datain[i].ITEMname
      //remark
      // print(_dataCOMMON.datain[0]);
      // print(_dataCOMMON.datain.length);
      // ReportPDFCommonvar.rawlistDATA[0] = [];
      ReportPDFCommonvar.rawlistCompound = [];
      ReportPDFCommonvar.rawlistRoughness = [];
      ReportPDFCommonvar.rawlistCORE = [];

      ReportPDFCommonvar.rawlistDATA = [];

      ReportPDFCommonvar.graphupper = [];
      ReportPDFCommonvar.graphdata = [];
      ReportPDFCommonvar.graphdata2 = [];
      ReportPDFCommonvar.graphdata3 = [];
      ReportPDFCommonvar.graphdata4 = [];
      ReportPDFCommonvar.graphunder = [];
      ReportPDFCommonvar.Listitemname = [];

      for (var i = 0; i < _dataCOMMON.datain_IC.length; i++) {
        ReportPDFCommonvar.datalist_ic[i].ITEMname =
            " ${_dataCOMMON.datain_IC[i].ITEMname}";
        ReportPDFCommonvar.datalist_ic[i].SCMARK =
            _dataCOMMON.datain_IC[i].SCMARK;
        ReportPDFCommonvar.datalist_ic[i].METHODname =
            _dataCOMMON.datain_IC[i].METHODname;
        ReportPDFCommonvar.datalist_ic[i].FREQ = _dataCOMMON.datain_IC[i].FREQ;
        ReportPDFCommonvar.datalist_ic[i].SPECIFICATIONname =
            _dataCOMMON.datain_IC[i].SPECIFICATION;
        ReportPDFCommonvar.datalist_ic[i].RESULT =
            _dataCOMMON.datain_IC[i].RESULT;
        ReportPDFCommonvar.datalist_ic[i].REMARK =
            _dataCOMMON.datain_IC[i].Remark;
      }

      for (var i = 0; i < _dataCOMMON.datain.length; i++) {
        String Loadin = '';
        if (_dataCOMMON.datain[i].LOAD != '' &&
            _dataCOMMON.datain[i].LOAD != '-') {
          Loadin = "( Load ${_dataCOMMON.datain[i].LOAD} )";
        }

        ReportPDFCommonvar.datalist[i].ITEMname =
            " ${_dataCOMMON.datain[i].ITEMname} ${Loadin}";
        ReportPDFCommonvar.datalist[i].SCMARK = _dataCOMMON.datain[i].SCMARK;
        ReportPDFCommonvar.datalist[i].METHODname =
            _dataCOMMON.datain[i].METHODname;
        ReportPDFCommonvar.datalist[i].FREQ = _dataCOMMON.datain[i].FREQ;
        ReportPDFCommonvar.datalist[i].SPECIFICATIONname =
            _dataCOMMON.datain[i].SPECIFICATION;
        ReportPDFCommonvar.datalist[i].RESULT = _dataCOMMON.datain[i].RESULT;
        ReportPDFCommonvar.datalist[i].REMARK = _dataCOMMON.datain[i].Remark;
        //print(ReportPDFCommonvar.datalist[i].RESULT.length);
        //Surface Hardness

        // if (_dataCOMMON.datain[i].TYPE == 'Number') {
        if (_dataCOMMON.datain[i].TYPE == 'Number' ||
            (_dataCOMMON.datain[i].TYPE == 'CAL1' &&
                _dataCOMMON.datain[i].datapackset.isNotEmpty) ||
            _dataCOMMON.datain[i].TYPE == 'CAL2') {
          if (_dataCOMMON.datain[i].SRAWDATA != 'NO') {
            ReportPDFCommonvar.Listitemname.add(_dataCOMMON.datain[i].ITEMname);

            lengthdata = ReportPDFCommonvar.Listitemname.length - 1;
            ReportPDFCommonvar.rawlistDATA.add([]);
          }
          // if (_dataCOMMON.datain[i].ITEMname
          //         .toUpperCase()
          //         .contains('HARDNESS') &&
          //     _dataCOMMON.datain[i].ITEMname.toUpperCase().contains('CORE') ==
          //         false) {
          if (_dataCOMMON.datain[i].SRAWDATA != 'NO') {
            for (var li = 0;
                li < _dataCOMMON.datain[i].datapackset.length;
                li++) {
              // print(_dataCOMMON.datain[i].datapackset[li].dimensionX);
              print(_dataCOMMON.datain[i].datapackset[li]);
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX == 0) {}
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 1) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '1',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA01 == '0' ||
                          _dataCOMMON.datain[i].datapackset[li].DATA01 ==
                              '0.0' ||
                          _dataCOMMON.datain[i].datapackset[li].DATA01 == '0.00'
                      ? "N/A"
                      : _dataCOMMON.datain[i].datapackset[li].DATA01,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '2',
                  // DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA02 == '0' ||
                          _dataCOMMON.datain[i].datapackset[li].DATA02 ==
                              '0.0' ||
                          _dataCOMMON.datain[i].datapackset[li].DATA02 == '0.00'
                      ? "N/A"
                      : _dataCOMMON.datain[i].datapackset[li].DATA02,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '3',
                  // DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA03 == '0' ||
                          _dataCOMMON.datain[i].datapackset[li].DATA03 ==
                              '0.0' ||
                          _dataCOMMON.datain[i].datapackset[li].DATA03 == '0.00'
                      ? "N/A"
                      : _dataCOMMON.datain[i].datapackset[li].DATA03,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '4',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '5',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '6',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '7',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '8',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '9',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '10',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '11',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '12',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '13',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '14',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '15',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '16',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '17',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '18',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '19',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
                ReportPDFCommonvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '20',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
                ));
              }
              HardnessNO++;
              // print('>>${HardnessNO}');
            }
          }
          //  CoreNO++;
        }

        if (_dataCOMMON.datain[i].TYPE == 'Graph') {
          ReportPDFCommonvar.rawlistGraph = [];
          if (_dataCOMMON.datain[i].ITEMname.contains('Hardness') ||
                  _dataCOMMON.datain[i].ITEMname.contains('hardness') ||
                  _dataCOMMON.datain[i].ITEMname.contains('(Graph)')

              //
              ) {
            for (var li = 0;
                li < _dataCOMMON.datain[i].datapackset.length;
                li++) {
              // print(_dataCOMMON.datain[i].datapackset[li].dimensionX);

              if (_dataCOMMON.datain[i].datapackset[li].dimensionX == 0) {}
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 1) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA01p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA01p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA01))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA02p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA02p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA02))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA03p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA03p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA03))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA04p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA04p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA04))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA05p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA05p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA05))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA06p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA06p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA06))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA07p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA07p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA07))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA08p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA08p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA08))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA09p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA09p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA09))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA10p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA10p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA10))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA11p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA11p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA11))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA12p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA12p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA12))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA13p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA13p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA13))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA14p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA14p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA14))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA15p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA15p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA15))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA16p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA16p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA16))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA17p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA17p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA17))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA18p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA18p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA18))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA19p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA19p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA19))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
                ReportPDFCommonvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA20p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
                ));

                ReportPDFCommonvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA20p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA20))),
                );
              }
              GraphNO++;
              // print('>>${HardnessNO}');
            }
          }

          // ReportPDFCommonvar.rawlistGraphCore = rawlist(
          //   DATAPCS: "Core",
          //   DATA: ReportPDFCommonvar
          //       .rawlistGraph[ReportPDFCommonvar.rawlistGraph.length - 1].DATA,
          // );
          // print(">>>${ReportPDFCommonvar.rawlistGraph.length}");
          // ReportPDFCommonvar.rawlistGraph.removeLast();
          if (ReportPDFCommonvar.rawlistGraph.length > 2) {
            ReportPDFCommonvar.rawlistGraphCore = rawlist(
              DATAPCS: "Core",
              DATA: ReportPDFCommonvar
                  .rawlistGraph[ReportPDFCommonvar.rawlistGraph.length - 1]
                  .DATA,
            );
            // print(">>>${ReportPDFCommonvar.rawlistGraph.length}");

            ReportPDFCommonvar.rawlistGraph
                .removeAt(ReportPDFCommonvar.rawlistGraph.length - 1);
          }

          ReportPDFCommonvar.graphupper = [
            FlSpot(ReportPDFCommonvar.graphdata[0].x, 1000),
            FlSpot(
                ReportPDFCommonvar
                    .graphdata[ReportPDFCommonvar.graphdata.length - 2].x,
                1000)
          ];
          ReportPDFCommonvar.graphdata2 = [
            FlSpot(ReportPDFCommonvar.graphdata[0].x,
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross))),
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)),
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross)))
          ];

          ReportPDFCommonvar.graphdata3 = [
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)),
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross))),
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)), 0)
          ];

          ReportPDFCommonvar.graphdata4 = [
            FlSpot(ReportPDFCommonvar.graphdata[0].x, 1000),
            FlSpot(ReportPDFCommonvar.graphdata[0].x, 0)
          ];

          ReportPDFCommonvar.graphunder = [
            FlSpot(ReportPDFCommonvar.graphdata[0].x, 0),
            FlSpot(
                ReportPDFCommonvar
                    .graphdata[ReportPDFCommonvar.graphdata.length - 2].x,
                0)
          ];
        }

        if (ReportPDFCommonvar.graphupper.length > 1) {
          ReportPDFCommonvar.graphupper;
        }

        if (ReportPDFCommonvar.graphdata2.length > 1) {
          ReportPDFCommonvar.graphdata2;
        }
        if (ReportPDFCommonvar.graphdata3.length > 1) {
          ReportPDFCommonvar.graphdata3;
        }
        if (ReportPDFCommonvar.graphdata4.length > 1) {
          ReportPDFCommonvar.graphdata4;
        }
        if (ReportPDFCommonvar.graphunder.length > 1) {
          ReportPDFCommonvar.graphunder;
        }

        //Compound Layer

        // Roughness
      }
      if (ReportPDFCommonvar.graphdata.length > 1) {
        ReportPDFCommonvar.graphdata.removeLast();
        //     .removeAt(ReportPDFCommonvar.graphdata.length - 1);
      }

      // print(ReportPDFCommonvar.datalist);
    } else {
      ReportPDFCommonvar.STATUS = 'WATTING or NO-DATA';

      ReportPDFCommonvar.QTYEDIT = '';
      ReportPDFCommonvar.INCresult = '';
      ReportPDFCommonvar.CUSTOMER = '';
      ReportPDFCommonvar.PROCESS = '';
      ReportPDFCommonvar.PARTNAME = '';
      ReportPDFCommonvar.PARTNO = '';
      ReportPDFCommonvar.PARTNO_s = '';
      ReportPDFCommonvar.CUSLOT = '';
      ReportPDFCommonvar.TPKLOT = '';
      ReportPDFCommonvar.MATERIAL = '';
      ReportPDFCommonvar.QTY = '';

      ReportPDFCommonvar.PICstd = '';
      ReportPDFCommonvar.PIC01 = '';
      ReportPDFCommonvar.PIC02 = '';

      ReportPDFCommonvar.rawlistDATA = [];
      ReportPDFCommonvar.rawlistCompound = [];
      ReportPDFCommonvar.rawlistRoughness = [];
      ReportPDFCommonvar.rawlistCORE = [];
      ReportPDFCommonvar.INC01 = '';
      ReportPDFCommonvar.INC02 = '';
      ReportPDFCommonvar.remark = '';

      ReportPDFCommonvar.datalist_ic = [
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
      ];

      ReportPDFCommonvar.datalist = [
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
        ReportPDFCommonlist(),
      ];

      ReportPDFCommonvar.rawlistGraphCore = rawlist();

      ReportPDFCommonvar.rawlistGraph = [];
      ReportPDFCommonvar.graphupper = [];
      ReportPDFCommonvar.graphdata = [];
      ReportPDFCommonvar.graphdata2 = [];
      ReportPDFCommonvar.graphdata3 = [];
      ReportPDFCommonvar.graphdata4 = [];
      ReportPDFCommonvar.graphunder = [];
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: ComInputText(
                  height: 40,
                  width: 200,
                  isContr: ReportPDFCommonvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFCommonvar.iscontrol = input;
                    });
                  },
                  isEnabled: ReportPDFCommonvar.canf,
                  sValue: ReportPDFCommonvar.PO,
                  returnfunc: (String s) {
                    ReportPDFCommonvar.PO = s;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    if (ReportPDFCommonvar.PO != '') {
                      context
                          .read<ReportPDFCommon_Cubit>()
                          .ReportPDFCommonCubit(ReportPDFCommonvar.PO);
                    }
                  },
                  child: Container(
                    color: Colors.black,
                    height: 40,
                    width: 40,
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    context.read<ReportPDFCommon_Cubit>().Flush();
                    ReportPDFCommonvar.canf = true;
                    ReportPDFCommonvar.iscontrol = true;
                    ReportPDFCommonvar.PO = '';
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.red,
                    height: 40,
                    width: 100,
                    child: const Center(
                      child: Text("CLEAR"),
                    ),
                  ),
                ),
              ),
              InkWell(
                onLongPress: () {
                  if (ReportPDFCommonvar.HIDEDATA) {
                    ReportPDFCommonvar.HIDEDATA = false;
                  } else {
                    ReportPDFCommonvar.HIDEDATA = true;
                  }
                  setState(() {});
                },
                onDoubleTap: () {
                  //  ReportPDFCommonvar.HIDEDATAPIC
                  if (ReportPDFCommonvar.HIDEDATAPIC) {
                    ReportPDFCommonvar.HIDEDATAPIC = false;
                  } else {
                    ReportPDFCommonvar.HIDEDATAPIC = true;
                  }
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    color: ReportPDFCommonvar.STATUS == 'REPORT READY'
                        ? Colors.green
                        : Colors.yellow,
                    height: 40,
                    width: 100,
                    child: Center(
                      child: Text(ReportPDFCommonvar.STATUS),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 30),
              //   child: SizedBox(
              //     height: 40,
              //     width: 150,
              //     child: AdvanceDropDown(
              //       imgpath: 'assets/icons/icon-down_4@3x.png',
              //       listdropdown: const [
              //         MapEntry("-", "-"),
              //         MapEntry("General", "1"),
              //         MapEntry("JTEKT", "2"),
              //         MapEntry("NTN", "3"),
              //         MapEntry("TBKK", "4"),
              //         MapEntry("GKN", "5"),
              //       ],
              //       onChangeinside: (d, v) {
              //         // print(d);
              //         ReportPDFCommonvar.TYPE = d;
              //         if (d == '1') {
              //           setState(() {
              //             ReportPDFCommonvar.SCMASKTYPE = imgGeneral;
              //             ReportPDFCommonvar.SCMASKTYPEonTop = '';
              //           });
              //         } else if (d == '2') {
              //           setState(() {
              //             ReportPDFCommonvar.SCMASKTYPE = imgJTEKT;
              //             ReportPDFCommonvar.SCMASKTYPEonTop = '';
              //           });
              //         } else if (d == '3') {
              //           setState(() {
              //             ReportPDFCommonvar.SCMASKTYPE = imgNTN;
              //             ReportPDFCommonvar.SCMASKTYPEonTop = imgNTNonH;
              //           });
              //         } else if (d == '4') {
              //           setState(() {
              //             ReportPDFCommonvar.SCMASKTYPE = imgTBKK;
              //             ReportPDFCommonvar.SCMASKTYPEonTop = '';
              //           });
              //         } else if (d == '5') {
              //           setState(() {
              //             ReportPDFCommonvar.SCMASKTYPE = imgGKN;
              //             ReportPDFCommonvar.SCMASKTYPEonTop = '';
              //           });
              //         } else {
              //           setState(() {
              //             ReportPDFCommonvar.SCMASKTYPE = imgGeneral;
              //             ReportPDFCommonvar.SCMASKTYPEonTop = '';
              //           });
              //         }
              //       },
              //       value: ReportPDFCommonvar.TYPE,
              //       height: 40,
              //       width: 100,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 60),
              //   child: ComInputText(
              //     height: 40,
              //     width: 200,
              //     isContr: ReportPDFCommonvar.iscontrol,
              //     fnContr: (input) {
              //       setState(() {
              //         ReportPDFCommonvar.iscontrol = input;
              //       });
              //     },
              //     sPlaceholder: "Inspected By",
              //     sValue: ReportPDFCommonvar.SignInsBy,
              //     returnfunc: (String s) {
              //       setState(() {
              //         ReportPDFCommonvar.SignInsBy = s;
              //       });
              //     },
              //   ),
              // ),
              //
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       ReportPDFCommonvar.QTY = ReportPDFCommonvar.QTYEDIT;
              //     });
              //   },
              //   child: Container(
              //     height: 40,
              //     width: 40,
              //     color: Colors.blue,
              //     child: Center(child: Text("SET")),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ComInputText(
                  height: 40,
                  width: 150,
                  isContr: ReportPDFCommonvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFCommonvar.iscontrol = input;
                    });
                  },
                  sPlaceholder: "QTY EDIT",
                  sValue: ReportPDFCommonvar.QTYEDIT,
                  returnfunc: (String s) {
                    setState(() {
                      ReportPDFCommonvar.QTYEDIT = s;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ComInputText(
                  height: 40,
                  width: 150,
                  isContr: ReportPDFCommonvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFCommonvar.iscontrol = input;
                    });
                  },
                  sPlaceholder: "TPK.LOT EDIT",
                  sValue: ReportPDFCommonvar.TPKLOTEDIT,
                  returnfunc: (String s) {
                    setState(() {
                      ReportPDFCommonvar.TPKLOTEDIT = s;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ComInputText(
                  height: 40,
                  width: 150,
                  isContr: ReportPDFCommonvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFCommonvar.iscontrol = input;
                    });
                  },
                  sPlaceholder: "NAME",
                  sValue: ReportPDFCommonvar.NAMEEDIT,
                  returnfunc: (String s) {
                    setState(() {
                      ReportPDFCommonvar.NAMEEDIT = s;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ComInputText(
                  height: 40,
                  width: 150,
                  isContr: ReportPDFCommonvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFCommonvar.iscontrol = input;
                    });
                  },
                  sPlaceholder: "REMARK",
                  sValue: ReportPDFCommonvar.REMARKEDIT,
                  returnfunc: (String s) {
                    setState(() {
                      ReportPDFCommonvar.REMARKEDIT = s;
                    });
                  },
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       ReportPDFCommonvar.datalist_ic[2].RESULT =
              //           ReportPDFCommonvar.INCresult;
              //     });
              //   },
              //   child: Container(
              //     height: 40,
              //     width: 40,
              //     color: Colors.blue,
              //     child: Center(child: Text("SET")),
              //   ),
              // ),
              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    PDFloader(context);
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      // capture(
                      captureToback(
                        // capture(
                        _globalKey,
                        ReportPDFCommonvar.PO,
                      ).then((value) {
                        print(value);

                        Navigator.pop(context);
                      });
                    });
                  },
                  child: Container(
                    color: Colors.yellow,
                    height: 50,
                    width: 100,
                    child: const Center(
                      child: Text("Print"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 60),
          //       child: ComInputText(
          //         sLabel: "Remark",
          //         height: 40,
          //         width: 500,
          //         nLimitedChar: 500,
          //         isContr: ReportPDFCommonvar.iscontrol,
          //         fnContr: (input) {
          //           setState(() {
          //             ReportPDFCommonvar.iscontrol = input;
          //           });
          //         },
          //         // isEnabled: ReportPDFCommonvar.canf,
          //         sValue: ReportPDFCommonvar.remark,
          //         returnfunc: (String s) {
          //           setState(() {
          //             ReportPDFCommonvar.remark = s;
          //           });
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                onTap: () {
                  P303QMMASTERQCVAR.SETDAY = 'OK';
                  P303QMMASTERQCVAR.SEARCH = ReportPDFCommonvar.PO;
                  var now = DateTime.now().subtract(Duration(days: 25));
                  P303QMMASTERQCVAR.day = DateFormat('dd').format(now);
                  P303QMMASTERQCVAR.month = DateFormat('MM').format(now);
                  P303QMMASTERQCVAR.year = DateFormat('yyyy').format(now);
                  STDreport2(context);
                },
                child: Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text("UD and QCFN"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                onTap: () {
                  //ReportPDFCommonvar.PO
                  QCFN(context);
                },
                child: Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text("_QCFN"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ComInputText(
                height: 40,
                width: 150,
                isContr: ReportPDFCommonvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    ReportPDFCommonvar.iscontrol = input;
                  });
                },
                sPlaceholder: "MATERIAL",
                sValue: ReportPDFCommonvar.MATERIALEDIT,
                returnfunc: (String s) {
                  setState(() {
                    ReportPDFCommonvar.MATERIALEDIT = s;
                  });
                },
              ),
            ),
          ]),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                RepaintBoundary(
                  key: _globalKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // const SizedBox(
                          //   width: 50,
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              height: 2000,
                              width: 1364,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3),
                                // color: Colors.red,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(0)),
                              ),
                              child: Column(
                                children: [
                                  HEAD3SLOT(
                                    ListFlex: const [5, 4, 1],
                                    widget01: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Container(
                                            height: 120,
                                            width: 230,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/images/logoonly_tpkpng.png",
                                                ),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // PicShow(
                                        //     width: 120, height: 230, base64: tpklogo),
                                        const SizedBox(
                                          height: 120,
                                          width: 400,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 20,
                                                ),
                                                child: Text(
                                                  "THAI PARKERIZING CO.,LTD.",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 40,
                                                ),
                                                child: Text(
                                                  "Heat & Surface Treatment Division",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    widget02: Column(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 120,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black,
                                                    width: 3,
                                                    style: BorderStyle.solid),
                                              ),
                                            ),
                                            child: const Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 20,
                                                        ),
                                                        child: Text(
                                                          "Quality Testing Report",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                      //
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 6,
                                                        ),
                                                        child: Text(
                                                          "for Surface treatment",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 7,
                                                                bottom: 5),
                                                        child: Text(
                                                          "(ใบรายงานผลการตรวจสอบผลิตภัณฑ์สำหรับกระบวนการ Surface treatment)",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 60,
                                            child: Center(
                                              child: Text(
                                                "FR-HQC-03/020-01-18/10/24",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    widget03: const Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 40,
                                                ),
                                                child: Text(
                                                  "PAGE",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 30, bottom: 10),
                                                child: Text(
                                                  "1/1",
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  HEAD4SLOT(
                                    ListFlex: [3, 10, 3, 5],
                                    widget01: const Center(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 6),
                                            child: Text(
                                              "Customer name",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    widget02: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          ReportPDFCommonvar.CUSTOMER,
                                          style: const TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget03: const Center(
                                      child: Text(
                                        "Process",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        // ReportPDFCommonvar.PROCESS,
                                        "Phosphate",
                                        style: const TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ),

                                  BODY4SLOT(
                                    ListFlex: [3, 10, 3, 5],
                                    widget01: const Center(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 6),
                                            child: Text(
                                              "Part Name",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    widget02: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          ReportPDFCommonvar.PARTNAME,
                                          style: const TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget03: const Center(
                                      child: Text(
                                        "Part No.",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.PARTNO.contains("|")
                                            ? ReportPDFCommonvar.PARTNO
                                                .split("|")[1]
                                            : ReportPDFCommonvar.PARTNO == ''
                                                ? ReportPDFCommonvar.PARTNO_s
                                                : ReportPDFCommonvar.PARTNO,
                                        style: TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY2SLOT(
                                    ListFlex: [3, 18],
                                    widget01: const Center(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 6),
                                            child: Text(
                                              "Customer Lot No.",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    widget02: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          ReportPDFCommonvar.CUSLOT == ''
                                              ? '-'
                                              : ReportPDFCommonvar.CUSLOT,
                                          style: TextStyle(
                                            fontSize: ReportPDFCommonvar
                                                        .CUSLOT.length >
                                                    30
                                                ? 18
                                                : 22,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY6SLOT(
                                    ListFlex: const [3, 9, 2, 3, 1, 3],
                                    widget01: const Center(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 6),
                                            child: Text(
                                              "TPK. Lot No.",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    widget02: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          ReportPDFCommonvar.TPKLOTEDIT == ''
                                              ? ReportPDFCommonvar.TPKLOT
                                              : ReportPDFCommonvar.TPKLOTEDIT,
                                          style: TextStyle(
                                            fontSize: ReportPDFCommonvar
                                                        .TPKLOT.length >
                                                    30
                                                ? 18
                                                : 22,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget03: const Center(
                                      child: Text(
                                        "Material",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget04: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (ReportPDFCommonvar
                                                .SCMASKTYPEonTop !=
                                            '') ...[
                                          PicShow(
                                              width: 42,
                                              height: 42,
                                              base64: ReportPDFCommonvar
                                                  .SCMASKTYPEonTop),
                                        ],
                                        Text(
                                          // ReportPDFCommonvar.MATERIAL,
                                          ReportPDFCommonvar.MATERIALEDIT == ''
                                              ? ReportPDFCommonvar.MATERIAL
                                              : ReportPDFCommonvar.MATERIALEDIT,
                                          style: const TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                    widget05: const Center(
                                      child: Text(
                                        "Qty.",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.QTYEDIT == ''
                                            ? ReportPDFCommonvar.QTY
                                            : ReportPDFCommonvar.QTYEDIT,
                                        style: const TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                  HEAD1SLOT(
                                    widget01: const Center(
                                      child: Text(
                                        "INCOMING INSPECTION",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  HEAD7SLOT(
                                    ListFlex: const [
                                      40,
                                      10,
                                      20,
                                      20,
                                      20,
                                      30,
                                      30
                                    ],
                                    widget01: const Center(
                                      child: Text(
                                        "Item",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget02: const Center(
                                      child: Text(
                                        "SC",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget03: const Center(
                                      child: Text(
                                        "Method",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget04: const Center(
                                      child: Text(
                                        "Frequency",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget05: const Center(
                                      child: Text(
                                        "Specification",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget06: const Center(
                                      child: Text(
                                        "Result",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget07: const Center(
                                      child: Text(
                                        "Remark",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY7SLOT(
                                    ListFlex: const [
                                      40,
                                      10,
                                      20,
                                      20,
                                      20,
                                      30,
                                      30
                                    ],
                                    widget01: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          ReportPDFCommonvar
                                              .datalist_ic[0].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget02: const Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist_ic[0].METHODname,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist_ic[0].FREQ,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist_ic[0].SPECIFICATIONname,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist_ic[0].RESULT,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: const Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY7SLOT(
                                    ListFlex: const [
                                      40,
                                      10,
                                      20,
                                      20,
                                      20,
                                      30,
                                      30
                                    ],
                                    widget01: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          ReportPDFCommonvar
                                              .datalist_ic[1].ITEMname,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget02: const Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist_ic[1].METHODname,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist_ic[1].FREQ,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist_ic[1].SPECIFICATIONname,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist_ic[1].RESULT,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: const Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY7SLOT(
                                    ListFlex: [40, 10, 20, 20, 20, 30, 30],
                                    widget01: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          ReportPDFCommonvar
                                              .datalist_ic[2].ITEMname,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INC02 != ''
                                            ? ""
                                            : "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist_ic[2].METHODname,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist_ic[2].FREQ,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist_ic[2].SPECIFICATIONname,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: Text(
                                        ReportPDFCommonvar.INCresult == ''
                                            ? ReportPDFCommonvar
                                                .datalist_ic[2].RESULT
                                            : ReportPDFCommonvar.INCresult,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget07: const Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  HEAD1SLOT(
                                    widget01: const Center(
                                      child: Text(
                                        "FINAL INSPECTION",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),

                                  HEAD7SLOT(
                                    ListFlex: [40, 10, 20, 20, 20, 30, 30],
                                    widget01: const Center(
                                      child: Text(
                                        "Item",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget02: const Center(
                                      child: Text(
                                        "SC",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget03: const Center(
                                      child: Text(
                                        "Method",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget04: const Center(
                                      child: Text(
                                        "Frequency",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget05: const Center(
                                      child: Text(
                                        "Specification",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget06: const Center(
                                      child: Text(
                                        "Result",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    widget07: const Center(
                                      child: Text(
                                        "Remark",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY7SLOT(
                                    ListFlex: [40, 10, 20, 20, 20, 30, 30],
                                    widget01: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          ReportPDFCommonvar
                                              .datalist[0].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: ReportPDFCommonvar
                                                  .datalist[0].SCMARK ==
                                              'YES'
                                          ? PicShow(
                                              width: 38,
                                              height: 38,
                                              base64:
                                                  ReportPDFCommonvar.SCMASKTYPE)
                                          : const Text(
                                              "",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist[0].METHODname,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].FREQ,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].FREQ ==
                                                '100% Check'
                                            ? "100%"
                                            : ReportPDFCommonvar
                                                .datalist[0].SPECIFICATIONname,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .SPECIFICATIONname
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: ReportPDFCommonvar.datalist[0].FREQ
                                              .contains("/6M")
                                          ? Text(
                                              ReportPDFCommonvar.HIDEDATA
                                                  ? "-"
                                                  : ReportPDFCommonvar
                                                      .datalist[0].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[0]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            )
                                          : Text(
                                              ReportPDFCommonvar.datalist[0]
                                                              .RESULT ==
                                                          '0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[0]
                                                              .RESULT ==
                                                          '0.0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[0]
                                                              .RESULT ==
                                                          '0.00'
                                                  ? "N/A"
                                                  : ReportPDFCommonvar
                                                      .datalist[0].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[0]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[0].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[0]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY7SLOT(
                                    ListFlex: [40, 10, 20, 20, 20, 30, 30],
                                    widget01: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          ReportPDFCommonvar
                                              .datalist[1].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: ReportPDFCommonvar
                                                  .datalist[1].SCMARK ==
                                              'YES'
                                          ? PicShow(
                                              width: 38,
                                              height: 38,
                                              base64:
                                                  ReportPDFCommonvar.SCMASKTYPE)
                                          : const Text(
                                              "",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist[1].METHODname,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[1].FREQ,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[1].FREQ ==
                                                '100% Check'
                                            ? "100%"
                                            : ReportPDFCommonvar
                                                .datalist[1].SPECIFICATIONname,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[1]
                                                      .SPECIFICATIONname
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: ReportPDFCommonvar.datalist[1].FREQ
                                              .contains("/6M")
                                          ? Text(
                                              ReportPDFCommonvar.HIDEDATA
                                                  ? "-"
                                                  : ReportPDFCommonvar
                                                      .datalist[1].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[1]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            )
                                          : Text(
                                              ReportPDFCommonvar.datalist[1]
                                                              .RESULT ==
                                                          '0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[1]
                                                              .RESULT ==
                                                          '0.0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[1]
                                                              .RESULT ==
                                                          '0.00'
                                                  ? "N/A"
                                                  : ReportPDFCommonvar
                                                      .datalist[1].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[1]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[1].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[1]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY7SLOT(
                                    ListFlex: [40, 10, 20, 20, 20, 30, 30],
                                    widget01: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          ReportPDFCommonvar
                                              .datalist[2].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: ReportPDFCommonvar
                                                  .datalist[2].SCMARK ==
                                              'YES'
                                          ? PicShow(
                                              width: 38,
                                              height: 38,
                                              base64:
                                                  ReportPDFCommonvar.SCMASKTYPE)
                                          : const Text(
                                              "",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist[2].METHODname,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[2].FREQ,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[2].FREQ ==
                                                '100% Check'
                                            ? "100%"
                                            : ReportPDFCommonvar
                                                .datalist[2].SPECIFICATIONname,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[2]
                                                      .SPECIFICATIONname
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: ReportPDFCommonvar.datalist[2].FREQ
                                              .contains("/6M")
                                          ? Text(
                                              ReportPDFCommonvar.HIDEDATA
                                                  ? "-"
                                                  : ReportPDFCommonvar
                                                      .datalist[2].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[2]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            )
                                          : Text(
                                              ReportPDFCommonvar.datalist[2]
                                                              .RESULT ==
                                                          '0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[2]
                                                              .RESULT ==
                                                          '0.0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[2]
                                                              .RESULT ==
                                                          '0.00'
                                                  ? "N/A"
                                                  : ReportPDFCommonvar
                                                      .datalist[2].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[2]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[2].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[2]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY7SLOT(
                                    ListFlex: [40, 10, 20, 20, 20, 30, 30],
                                    widget01: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          ReportPDFCommonvar
                                              .datalist[3].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: ReportPDFCommonvar
                                                  .datalist[3].SCMARK ==
                                              'YES'
                                          ? PicShow(
                                              width: 38,
                                              height: 38,
                                              base64:
                                                  ReportPDFCommonvar.SCMASKTYPE)
                                          : const Text(
                                              "",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist[3].METHODname,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[3].FREQ,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[3].FREQ ==
                                                '100% Check'
                                            ? "100%"
                                            : ReportPDFCommonvar
                                                .datalist[3].SPECIFICATIONname,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[3]
                                                      .SPECIFICATIONname
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: ReportPDFCommonvar.datalist[3].FREQ
                                              .contains("/6M")
                                          ? Text(
                                              ReportPDFCommonvar.HIDEDATA
                                                  ? "-"
                                                  : ReportPDFCommonvar
                                                      .datalist[3].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[3]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            )
                                          : Text(
                                              ReportPDFCommonvar.datalist[3]
                                                              .RESULT ==
                                                          '0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[3]
                                                              .RESULT ==
                                                          '0.0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[3]
                                                              .RESULT ==
                                                          '0.00'
                                                  ? "N/A"
                                                  : ReportPDFCommonvar
                                                      .datalist[3].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[3]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[3].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[3]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY7SLOT(
                                    ListFlex: [40, 10, 20, 20, 20, 30, 30],
                                    widget01: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          ReportPDFCommonvar
                                              .datalist[4].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: ReportPDFCommonvar
                                                  .datalist[4].SCMARK ==
                                              'YES'
                                          ? PicShow(
                                              width: 38,
                                              height: 38,
                                              base64:
                                                  ReportPDFCommonvar.SCMASKTYPE)
                                          : const Text(
                                              "",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist[4].METHODname,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[4].FREQ,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[4].FREQ ==
                                                '100% Check'
                                            ? "100%"
                                            : ReportPDFCommonvar
                                                .datalist[4].SPECIFICATIONname,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[4]
                                                      .SPECIFICATIONname
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: ReportPDFCommonvar.datalist[4].FREQ
                                              .contains("/6M")
                                          ? Text(
                                              ReportPDFCommonvar.HIDEDATA
                                                  ? "-"
                                                  : ReportPDFCommonvar
                                                      .datalist[4].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[4]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            )
                                          : Text(
                                              ReportPDFCommonvar.datalist[4]
                                                              .RESULT ==
                                                          '0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[4]
                                                              .RESULT ==
                                                          '0.0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[4]
                                                              .RESULT ==
                                                          '0.00'
                                                  ? "N/A"
                                                  : ReportPDFCommonvar
                                                      .datalist[4].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[4]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[4].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[4]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY7SLOT(
                                    ListFlex: [40, 10, 20, 20, 20, 30, 30],
                                    widget01: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          ReportPDFCommonvar
                                              .datalist[5].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: ReportPDFCommonvar
                                                  .datalist[5].SCMARK ==
                                              'YES'
                                          ? PicShow(
                                              width: 38,
                                              height: 38,
                                              base64:
                                                  ReportPDFCommonvar.SCMASKTYPE)
                                          : const Text(
                                              "",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist[5].METHODname,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[5].FREQ,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[5].FREQ ==
                                                '100% Check'
                                            ? "100%"
                                            : ReportPDFCommonvar
                                                .datalist[5].SPECIFICATIONname,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[5]
                                                      .SPECIFICATIONname
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: ReportPDFCommonvar.datalist[5].FREQ
                                              .contains("/6M")
                                          ? Text(
                                              ReportPDFCommonvar.HIDEDATA
                                                  ? "-"
                                                  : ReportPDFCommonvar
                                                      .datalist[5].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[5]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            )
                                          : Text(
                                              ReportPDFCommonvar.datalist[5]
                                                              .RESULT ==
                                                          '0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[5]
                                                              .RESULT ==
                                                          '0.0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[5]
                                                              .RESULT ==
                                                          '0.00'
                                                  ? "N/A"
                                                  : ReportPDFCommonvar
                                                      .datalist[5].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[5]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[5].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[5]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY7SLOT(
                                    ListFlex: [40, 10, 20, 20, 20, 30, 30],
                                    widget01: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          ReportPDFCommonvar
                                              .datalist[6].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    widget02: Center(
                                      child: ReportPDFCommonvar
                                                  .datalist[6].SCMARK ==
                                              'YES'
                                          ? PicShow(
                                              width: 38,
                                              height: 38,
                                              base64:
                                                  ReportPDFCommonvar.SCMASKTYPE)
                                          : const Text(
                                              "",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                    ),
                                    widget03: Center(
                                      child: Text(
                                        ReportPDFCommonvar
                                            .datalist[6].METHODname,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget04: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[6].FREQ,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    widget05: Center(
                                      child: Text(
                                        (ReportPDFCommonvar.datalist[6].FREQ ==
                                                '100% Check'
                                            ? "100%"
                                            : ReportPDFCommonvar
                                                .datalist[6].SPECIFICATIONname),
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[6]
                                                      .SPECIFICATIONname
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                    widget06: Center(
                                      child: ReportPDFCommonvar.datalist[6].FREQ
                                              .contains("/6M")
                                          ? Text(
                                              ReportPDFCommonvar.HIDEDATA
                                                  ? "-"
                                                  : ReportPDFCommonvar
                                                      .datalist[6].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[6]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            )
                                          : Text(
                                              ReportPDFCommonvar.datalist[6]
                                                              .RESULT ==
                                                          '0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[6]
                                                              .RESULT ==
                                                          '0.0' ||
                                                      ReportPDFCommonvar
                                                              .datalist[6]
                                                              .RESULT ==
                                                          '0.00'
                                                  ? "N/A"
                                                  : ReportPDFCommonvar
                                                      .datalist[6].RESULT,
                                              style: TextStyle(
                                                fontSize: ReportPDFCommonvar
                                                            .datalist[6]
                                                            .RESULT
                                                            .length >
                                                        30
                                                    ? 12
                                                    : 16,
                                              ),
                                            ),
                                    ),
                                    widget07: Center(
                                      child: Text(
                                        ReportPDFCommonvar.datalist[7].REMARK,
                                        style: TextStyle(
                                          fontSize: ReportPDFCommonvar
                                                      .datalist[7]
                                                      .REMARK
                                                      .length >
                                                  30
                                              ? 12
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),

                                  // if (ReportPDFCommonvar.rawlistDATA.length ==
                                  //     0
                                  if (true) ...[
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Column(
                                            children: [
                                              HEAD10SLOT(
                                                ListFlex: S16slot,
                                                widget01: const Center(
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 6),
                                                        child: Text(
                                                          "Sample No.",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                widget02: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                1
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [0]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget03: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                2
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [1]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget04: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                3
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [2]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget05: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                4
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [3]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget06: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                5
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [4]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget07: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                6
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [5]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget08: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                7
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [6]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget09: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                8
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [7]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget10: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                9
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [8]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              BODY10SLOT(
                                                ListFlex: S16slot,
                                                widget01: const Center(
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 6),
                                                        child: Text(
                                                          "Point No.",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                widget02: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                1
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [0]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget03: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                2
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [1]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget04: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                3
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [2]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget05: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                4
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [3]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget06: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                5
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [4]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget07: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                6
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [5]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget08: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                7
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [6]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget09: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                8
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [7]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget10: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                9
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [8]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              BODY10SLOT(
                                                ListFlex: S16slot,
                                                widget01: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .Listitemname
                                                                .length >
                                                            0
                                                        ? ReportPDFCommonvar
                                                            .Listitemname[0]
                                                        : "",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget02: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                1
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [0]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget03: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                2
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [1]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget04: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                3
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [2]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget05: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                4
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [3]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget06: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                5
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [4]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget07: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                6
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [5]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget08: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                7
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [6]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget09: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                8
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [7]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget10: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            0
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        0]
                                                                    .length >=
                                                                9
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[0]
                                                                    [8]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Column(
                                            children: [
                                              HEAD10SLOT(
                                                ListFlex: S16slot,
                                                widget01: const Center(
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 6),
                                                        child: Text(
                                                          "Sample No.",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                widget02: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                1
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [0]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget03: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                2
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [1]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget04: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                3
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [2]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget05: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                4
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [3]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget06: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                5
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [4]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget07: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                6
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [5]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget08: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                7
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [6]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget09: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                8
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [7]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget10: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                9
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [8]
                                                                .DATANO
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              BODY10SLOT(
                                                ListFlex: S16slot,
                                                widget01: const Center(
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 6),
                                                        child: Text(
                                                          "Point No.",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                widget02: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                1
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [0]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget03: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                2
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [1]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget04: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                3
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [2]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget05: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                4
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [3]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget06: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                5
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [4]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget07: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                6
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [5]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget08: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                7
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [6]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget09: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                8
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [7]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget10: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                9
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [8]
                                                                .DATAPCS
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              BODY10SLOT(
                                                ListFlex: S16slot,
                                                widget01: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .Listitemname
                                                                .length >
                                                            1
                                                        ? ReportPDFCommonvar
                                                            .Listitemname[1]
                                                        : "",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget02: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                1
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [0]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget03: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                2
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [1]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget04: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                3
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [2]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget05: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                4
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [3]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget06: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                5
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [4]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget07: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                6
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [5]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget08: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                7
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [6]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget09: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                8
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [7]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                widget10: Center(
                                                  child: Text(
                                                    ReportPDFCommonvar
                                                                .rawlistDATA
                                                                .length >
                                                            1
                                                        ? (ReportPDFCommonvar
                                                                    .rawlistDATA[
                                                                        1]
                                                                    .length >=
                                                                9
                                                            ? ReportPDFCommonvar
                                                                .rawlistDATA[1]
                                                                    [8]
                                                                .DATA
                                                            : '')
                                                        : '',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  PICSLO2NORMAL(
                                    PIC01: ReportPDFCommonvar.HIDEDATAPIC
                                        ? ""
                                        : _dataCOMMON.databasic.PIC01,
                                    ITEMPIC01: ReportPDFCommonvar.HIDEDATA
                                        ? ""
                                        : _dataCOMMON.databasic.ITEMPIC01,
                                    PIC02: ReportPDFCommonvar.HIDEDATAPIC
                                        ? ""
                                        : _dataCOMMON.databasic.PIC02,
                                    ITEMPIC02: ReportPDFCommonvar.HIDEDATAPIC
                                        ? ""
                                        : _dataCOMMON.databasic.ITEMPIC02,
                                  ),
                                  TAILSLOT(
                                    PASS: ReportPDFCommonvar.PASS,
                                    PICS: _dataCOMMON.databasic.PICstd,
                                    Remark: ReportPDFCommonvar.REMARKEDIT == ''
                                        ? ReportPDFCommonvar.remark
                                        : "Reference data from TP LOT NO." +
                                            ReportPDFCommonvar.REMARKEDIT,
                                    // NAME01: ReportPDFCommonvar.NAMEEDIT == ''
                                    //     ? ReportPDFCommonvar.INSBY.toUpperCase()
                                    //     : ReportPDFCommonvar.NAMEEDIT,
                                    // NAME02: ReportPDFCommonvar.CHECKBY,
                                    // NAME03: ReportPDFCommonvar.APPBY,
                                    signs: true,
                                    NAME01:
                                        _dataCOMMON.databasic.Inspected_sign,
                                    NAME02: _dataCOMMON.databasic.Check_sign,
                                    NAME03: _dataCOMMON.databasic.Approve_sign,
                                    NAME01date: _dataCOMMON
                                                .databasic.dateInspected !=
                                            ''
                                        ? DateFormat('dd/MM/yyyy').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                int.parse(ConverstStr(
                                                        _dataCOMMON.databasic
                                                            .dateInspected)) *
                                                    1))
                                        : "",
                                    NAME02date: _dataCOMMON
                                                .databasic.dateCheck !=
                                            ''
                                        ? DateFormat('dd/MM/yyyy').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                int.parse(ConverstStr(
                                                        _dataCOMMON.databasic
                                                            .dateCheck) *
                                                    1)))
                                        : "",
                                    NAME03date: _dataCOMMON
                                                .databasic.dateApprove !=
                                            ''
                                        ? DateFormat('dd/MM/yyyy').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                int.parse(ConverstStr(
                                                        _dataCOMMON.databasic
                                                            .dateApprove) *
                                                    1)))
                                        : "",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    if ((USERDATA.UserLV) > 1) ...[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            if (_dataCOMMON.databasic.Inspected == '') {
                              Dio().post(
                                options: Options(
                                  // contentType: "application/json",

                                  headers: {
                                    "server": "BP12-PH",
                                  },
                                ),
                                GLOserverMASTER + "Inspected-sign",
                                data: {
                                  "ID": USERDATA.ID,
                                  "PO": ReportPDFCommonvar.PO,
                                },
                              ).then((v) {
                                var databuff = v.data;
                                context
                                    .read<ReportPDFCommon_Cubit>()
                                    .ReportPDFCommonCubit(
                                        ReportPDFCommonvar.PO);
                              });
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            color: _dataCOMMON.databasic.Inspected == ''
                                ? Colors.blue
                                : Colors.red,
                            child: Center(
                              child: Text("Inspected"),
                            ),
                          ),
                        ),
                      ),
                    ],
                    if ((USERDATA.UserLV) > 20) ...[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            if (_dataCOMMON.databasic.Check == '' &&
                                _dataCOMMON.databasic.Inspected != '') {
                              Dio().post(
                                options: Options(
                                  // contentType: "application/json",

                                  headers: {
                                    "server": "BP12-PH",
                                  },
                                ),
                                GLOserverMASTER + "Check-sign",
                                data: {
                                  "ID": USERDATA.ID,
                                  "PO": ReportPDFCommonvar.PO,
                                },
                              ).then((v) {
                                var databuff = v.data;
                                context
                                    .read<ReportPDFCommon_Cubit>()
                                    .ReportPDFCommonCubit(
                                        ReportPDFCommonvar.PO);
                              });
                            } else {
                              if (_dataCOMMON.databasic.Inspected == '') {
                                WORNINGpop(
                                    context,
                                    ["", "Please Inspected first", ""],
                                    140,
                                    200);
                              }
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            color: _dataCOMMON.databasic.Check == ''
                                ? Colors.blue
                                : Colors.red,
                            child: Center(
                              child: Text("Check"),
                            ),
                          ),
                        ),
                      ),
                    ],
                    if ((USERDATA.UserLV) > 30) ...[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            if (_dataCOMMON.databasic.Approve == '' &&
                                _dataCOMMON.databasic.Check != '' &&
                                _dataCOMMON.databasic.Inspected != '') {
                              Dio().post(
                                options: Options(
                                  // contentType: "application/json",

                                  headers: {
                                    "server": "BP12-PH",
                                  },
                                ),
                                GLOserverMASTER + "Approve-sign",
                                data: {
                                  "ID": USERDATA.ID,
                                  "PO": ReportPDFCommonvar.PO,
                                },
                              ).then((v) {
                                var databuff = v.data;
                                context
                                    .read<ReportPDFCommon_Cubit>()
                                    .ReportPDFCommonCubit(
                                        ReportPDFCommonvar.PO);
                              });
                            } else {
                              if (_dataCOMMON.databasic.Inspected == '') {
                                WORNINGpop(
                                    context,
                                    ["", "Please Inspected first", ""],
                                    140,
                                    200);
                              } else if (_dataCOMMON.databasic.Check == '') {
                                WORNINGpop(context,
                                    ["", "Please Check first", ""], 140, 200);
                              }
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            color: _dataCOMMON.databasic.Approve == ''
                                ? Colors.blue
                                : Colors.red,
                            child: Center(
                              child: Text("Approve"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 50,
          ),
        ],
      ),
    );
  }
}

List<int> S16slot = const [
  3,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1
];

void STDreport2(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          height: 1000,
          width: 1500,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Page303(),
            ),
          ),
        ),
      );
    },
  );
}

void QCFN(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: QCFNWD(),
      );
    },
  );
}

class QCFNWD extends StatefulWidget {
  const QCFNWD({super.key});

  @override
  State<QCFNWD> createState() => _QCFNWDState();
}

class _QCFNWDState extends State<QCFNWD> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 600,
      child: Center(
        child: SizedBox(
          child: InkWell(
            onTap: () {
              print("00" + ReportPDFCommonvar.PO);
              Dio().post(
                "${server2}10GETDATAFROMJOBBINGAQC/QCFN",
                // "${'http://127.0.0.1:14094/'}10GETDATAFROMJOBBINGAQC/QCFN",
                data: {
                  "BAPI_NAME": "ZFMPP_QCFN_IN",
                  "ORDERID": ReportPDFCommonvar.PO,
                  "PERNR_ID": USERDATA.ID
                },
              ).then((v) {
                Navigator.pop(context);

                //
                print(v.data);
                if (v.data['ExportParameter'] != null) {
                  if (v.data['ExportParameter']['INACT_NEW'].toString() ==
                      'E') {
                    showErrorPopup(context, v.data.toString());
                  } else {
                    showGoodPopup(context, v.data.toString());
                  }
                } else {
                  showErrorPopup(context, v.data.toString());
                }
              });
            },
            child: Container(
              width: 400,
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text("QCFN"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
