import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Cubit/31-ReportPDFCommoncubit.dart';
import '../../widget/GRAPH/LineGraph01.dart';
import '../../widget/ReportComponent/CommonReport.dart';
import '../../widget/ReportComponent/PicSlot.dart';
import '../../widget/ReportComponent/SignSide.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/common/imgset.dart';
import '../../widget/function/helper.dart';
import 'ReportPDFlongvar.dart';

late BuildContext ReportPDFlongcontext;

class ReportPDFlong extends StatefulWidget {
  ReportPDFlong({
    Key? key,
    this.dataCommon,
  }) : super(key: key);
  CommonReportOutput? dataCommon;
  @override
  State<ReportPDFlong> createState() => _ReportPDFlongState();
}

class _ReportPDFlongState extends State<ReportPDFlong> {
  @override
  void initState() {
    if (ReportPDFlongvar.PO != '') {
      ReportPDFlongvar.canf = false;
      context
          .read<ReportPDFCommon_Cubit>()
          .ReportPDFCommonCubit(ReportPDFlongvar.PO);

      ReportPDFlongvar.TPKLOTEDIT = '';
      ReportPDFlongvar.QTYEDIT = '';
      ReportPDFlongvar.INCresult = '';
    }
    super.initState();
  }

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ReportPDFlongcontext = context;

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
      ReportPDFlongvar.STATUS = 'REPORT READY';
      ReportPDFlongvar.CUSTOMER = _dataCOMMON.databasic.CUSTOMER;
      ReportPDFlongvar.PROCESS = _dataCOMMON.databasic.PROCESS;
      ReportPDFlongvar.PARTNAME = _dataCOMMON.databasic.PARTNAME;
      ReportPDFlongvar.PARTNO = _dataCOMMON.databasic.PARTNO;
      ReportPDFlongvar.CUSLOT = _dataCOMMON.databasic.CUSLOT;
      ReportPDFlongvar.TPKLOT = _dataCOMMON.databasic.TPKLOT;
      ReportPDFlongvar.MATERIAL = _dataCOMMON.databasic.MATERIAL;
      if (_dataCOMMON.databasic.UNITSAP.toUpperCase() != 'KG') {
        ReportPDFlongvar.QTY =
            '${double.parse(ConverstStr(_dataCOMMON.databasic.QTY)).toStringAsFixed(0)} ${_dataCOMMON.databasic.UNITSAP}';
      } else {
        ReportPDFlongvar.QTY =
            '${double.parse(ConverstStr(_dataCOMMON.databasic.QTY)).toStringAsFixed(1)} ${_dataCOMMON.databasic.UNITSAP}';
      }

      ReportPDFlongvar.PIC01 = _dataCOMMON.databasic.PIC01;
      ReportPDFlongvar.PIC02 = _dataCOMMON.databasic.PIC02;
      ReportPDFlongvar.PICstd = _dataCOMMON.databasic.PICstd;

      ReportPDFlongvar.PASS = _dataCOMMON.databasic.PASS;
      ReportPDFlongvar.remark = '';
      if (_dataCOMMON.databasic.PARTNAMEref != '') {
        // ReportPDFlongvar.remark =
        //     'Reference data from\n${_dataCOMMON.databasic.PARTNAMEref}\n${_dataCOMMON.databasic.PARTref}';
        ReportPDFlongvar.remark =
            'Reference data from TP LOT NO. ${_dataCOMMON.databasic.TPKLOTref}';

        //TPKLOTref
      }

      ReportPDFlongvar.INC01 = _dataCOMMON.databasic.INC01;
      ReportPDFlongvar.INC02 = _dataCOMMON.databasic.INC02;
      ReportPDFlongvar.INSBY = _dataCOMMON.databasic.INSBY;
      ReportPDFlongvar.CHECKBY = _dataCOMMON.databasic.CHECKBY;
      ReportPDFlongvar.APPBY = _dataCOMMON.databasic.APPBY;

      // _dataCOMMON.datain[i].ITEMname

//remark

      // print(_dataCOMMON.datain[0]);
      // print(_dataCOMMON.datain.length);
      // ReportPDFlongvar.rawlistDATA[0] = [];
      ReportPDFlongvar.rawlistCompound = [];
      ReportPDFlongvar.rawlistRoughness = [];
      ReportPDFlongvar.rawlistCORE = [];

      ReportPDFlongvar.rawlistDATA = [];

      ReportPDFlongvar.graphupper = [];
      ReportPDFlongvar.graphdata = [];
      ReportPDFlongvar.graphdata2 = [];
      ReportPDFlongvar.graphdata3 = [];
      ReportPDFlongvar.graphdata4 = [];
      ReportPDFlongvar.graphunder = [];
      ReportPDFlongvar.Listitemname = [];

      for (var i = 0; i < _dataCOMMON.datain_IC.length; i++) {
        ReportPDFlongvar.datalist_ic[i].ITEMname =
            " ${_dataCOMMON.datain_IC[i].ITEMname}";
        ReportPDFlongvar.datalist_ic[i].SCMARK =
            _dataCOMMON.datain_IC[i].SCMARK;
        ReportPDFlongvar.datalist_ic[i].METHODname =
            _dataCOMMON.datain_IC[i].METHODname;
        ReportPDFlongvar.datalist_ic[i].FREQ = _dataCOMMON.datain_IC[i].FREQ;
        ReportPDFlongvar.datalist_ic[i].SPECIFICATIONname =
            _dataCOMMON.datain_IC[i].SPECIFICATION;
        ReportPDFlongvar.datalist_ic[i].RESULT =
            _dataCOMMON.datain_IC[i].RESULT;
        ReportPDFlongvar.datalist_ic[i].REMARK =
            _dataCOMMON.datain_IC[i].Remark;
      }

      for (var i = 0; i < _dataCOMMON.datain.length; i++) {
        String Loadin = '';
        if (_dataCOMMON.datain[i].LOAD != '' &&
            _dataCOMMON.datain[i].LOAD != '-') {
          Loadin = "( Load ${_dataCOMMON.datain[i].LOAD} )";
        }
        ReportPDFlongvar.datalist[i].ITEMname =
            " ${_dataCOMMON.datain[i].ITEMname} ${Loadin}";
        ReportPDFlongvar.datalist[i].SCMARK = _dataCOMMON.datain[i].SCMARK;
        ReportPDFlongvar.datalist[i].METHODname =
            _dataCOMMON.datain[i].METHODname;
        ReportPDFlongvar.datalist[i].FREQ = _dataCOMMON.datain[i].FREQ;
        ReportPDFlongvar.datalist[i].SPECIFICATIONname =
            _dataCOMMON.datain[i].SPECIFICATION;
        ReportPDFlongvar.datalist[i].RESULT = _dataCOMMON.datain[i].RESULT;
        ReportPDFlongvar.datalist[i].REMARK = _dataCOMMON.datain[i].Remark;
        //print(ReportPDFlongvar.datalist[i].RESULT.length);
        //Surface Hardness

        // if (_dataCOMMON.datain[i].TYPE == 'Number') {
        if (_dataCOMMON.datain[i].TYPE == 'Number') {
          if (_dataCOMMON.datain[i].SRAWDATA != 'NO') {
            ReportPDFlongvar.Listitemname.add(_dataCOMMON.datain[i].ITEMname);

            lengthdata = ReportPDFlongvar.Listitemname.length - 1;
            ReportPDFlongvar.rawlistDATA.add([]);
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
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
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
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
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
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
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
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '4',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '5',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '6',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '7',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '8',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '9',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '10',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '11',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '12',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '13',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '14',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '15',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '16',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '17',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '18',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '19',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
                ReportPDFlongvar.rawlistDATA[lengthdata].add(rawlist(
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
          ReportPDFlongvar.rawlistGraph = [];
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
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA01p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA01p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA01))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA02p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA02p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA02))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA03p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA03p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA03))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA04p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA04p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA04))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA05p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA05p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA05))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA06p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA06p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA06))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA07p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA07p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA07))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA08p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA08p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA08))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA09p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA09p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA09))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA10p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA10p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA10))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA11p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA11p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA11))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA12p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA12p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA12))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA13p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA13p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA13))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA14p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA14p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA14))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA15p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA15p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA15))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA16p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA16p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA16))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA17p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA17p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA17))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA18p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA18p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA18))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA19p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
                ));

                ReportPDFlongvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA19p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA19))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
                ReportPDFlongvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA20p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
                ));

                ReportPDFlongvar.graphdata.add(
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

          // ReportPDFlongvar.rawlistGraphCore = rawlist(
          //   DATAPCS: "Core",
          //   DATA: ReportPDFlongvar
          //       .rawlistGraph[ReportPDFlongvar.rawlistGraph.length - 1].DATA,
          // );
          // print(">>>${ReportPDFlongvar.rawlistGraph.length}");
          // ReportPDFlongvar.rawlistGraph.removeLast();
          if (ReportPDFlongvar.rawlistGraph.length > 2) {
            ReportPDFlongvar.rawlistGraphCore = rawlist(
              DATAPCS: "Core",
              DATA: ReportPDFlongvar
                  .rawlistGraph[ReportPDFlongvar.rawlistGraph.length - 1].DATA,
            );
            // print(">>>${ReportPDFlongvar.rawlistGraph.length}");

            ReportPDFlongvar.rawlistGraph
                .removeAt(ReportPDFlongvar.rawlistGraph.length - 1);
          }

          ReportPDFlongvar.graphupper = [
            FlSpot(ReportPDFlongvar.graphdata[0].x, 1000),
            FlSpot(
                ReportPDFlongvar
                    .graphdata[ReportPDFlongvar.graphdata.length - 2].x,
                1000)
          ];
          ReportPDFlongvar.graphdata2 = [
            FlSpot(ReportPDFlongvar.graphdata[0].x,
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross))),
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)),
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross)))
          ];

          ReportPDFlongvar.graphdata3 = [
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)),
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross))),
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)), 0)
          ];

          ReportPDFlongvar.graphdata4 = [
            FlSpot(ReportPDFlongvar.graphdata[0].x, 1000),
            FlSpot(ReportPDFlongvar.graphdata[0].x, 0)
          ];

          ReportPDFlongvar.graphunder = [
            FlSpot(ReportPDFlongvar.graphdata[0].x, 0),
            FlSpot(
                ReportPDFlongvar
                    .graphdata[ReportPDFlongvar.graphdata.length - 2].x,
                0)
          ];
        }

        if (ReportPDFlongvar.graphupper.length > 1) {
          ReportPDFlongvar.graphupper;
        }

        if (ReportPDFlongvar.graphdata2.length > 1) {
          ReportPDFlongvar.graphdata2;
        }
        if (ReportPDFlongvar.graphdata3.length > 1) {
          ReportPDFlongvar.graphdata3;
        }
        if (ReportPDFlongvar.graphdata4.length > 1) {
          ReportPDFlongvar.graphdata4;
        }
        if (ReportPDFlongvar.graphunder.length > 1) {
          ReportPDFlongvar.graphunder;
        }

        //Compound Layer

        // Roughness
      }
      if (ReportPDFlongvar.graphdata.length > 1) {
        ReportPDFlongvar.graphdata.removeLast();
        //     .removeAt(ReportPDFlongvar.graphdata.length - 1);
      }

      // print(ReportPDFlongvar.datalist);
    } else {
      ReportPDFlongvar.STATUS = 'WATTING or NO-DATA';

      ReportPDFlongvar.QTYEDIT = '';
      ReportPDFlongvar.INCresult = '';
      ReportPDFlongvar.CUSTOMER = '';
      ReportPDFlongvar.PROCESS = '';
      ReportPDFlongvar.PARTNAME = '';
      ReportPDFlongvar.PARTNO = '';
      ReportPDFlongvar.CUSLOT = '';
      ReportPDFlongvar.TPKLOT = '';
      ReportPDFlongvar.MATERIAL = '';
      ReportPDFlongvar.QTY = '';

      ReportPDFlongvar.PICstd = '';
      ReportPDFlongvar.PIC01 = '';
      ReportPDFlongvar.PIC02 = '';

      ReportPDFlongvar.rawlistDATA = [];
      ReportPDFlongvar.rawlistCompound = [];
      ReportPDFlongvar.rawlistRoughness = [];
      ReportPDFlongvar.rawlistCORE = [];
      ReportPDFlongvar.INC01 = '';
      ReportPDFlongvar.INC02 = '';

      ReportPDFlongvar.datalist_ic = [
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

      ReportPDFlongvar.datalist = [
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

      ReportPDFlongvar.rawlistGraphCore = rawlist();

      ReportPDFlongvar.rawlistGraph = [];
      ReportPDFlongvar.graphupper = [];
      ReportPDFlongvar.graphdata = [];
      ReportPDFlongvar.graphdata2 = [];
      ReportPDFlongvar.graphdata3 = [];
      ReportPDFlongvar.graphdata4 = [];
      ReportPDFlongvar.graphunder = [];
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
                  isContr: ReportPDFlongvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFlongvar.iscontrol = input;
                    });
                  },
                  isEnabled: ReportPDFlongvar.canf,
                  sValue: ReportPDFlongvar.PO,
                  returnfunc: (String s) {
                    ReportPDFlongvar.PO = s;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    if (ReportPDFlongvar.PO != '') {
                      context
                          .read<ReportPDFCommon_Cubit>()
                          .ReportPDFCommonCubit(ReportPDFlongvar.PO);
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
                    ReportPDFlongvar.canf = true;
                    ReportPDFlongvar.iscontrol = true;
                    ReportPDFlongvar.PO = '';
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
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  color: ReportPDFlongvar.STATUS == 'REPORT READY'
                      ? Colors.green
                      : Colors.yellow,
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(ReportPDFlongvar.STATUS),
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
              //         ReportPDFlongvar.TYPE = d;
              //         if (d == '1') {
              //           setState(() {
              //             ReportPDFlongvar.SCMASKTYPE = imgGeneral;
              //             ReportPDFlongvar.SCMASKTYPEonTop = '';
              //           });
              //         } else if (d == '2') {
              //           setState(() {
              //             ReportPDFlongvar.SCMASKTYPE = imgJTEKT;
              //             ReportPDFlongvar.SCMASKTYPEonTop = '';
              //           });
              //         } else if (d == '3') {
              //           setState(() {
              //             ReportPDFlongvar.SCMASKTYPE = imgNTN;
              //             ReportPDFlongvar.SCMASKTYPEonTop = imgNTNonH;
              //           });
              //         } else if (d == '4') {
              //           setState(() {
              //             ReportPDFlongvar.SCMASKTYPE = imgTBKK;
              //             ReportPDFlongvar.SCMASKTYPEonTop = '';
              //           });
              //         } else if (d == '5') {
              //           setState(() {
              //             ReportPDFlongvar.SCMASKTYPE = imgGKN;
              //             ReportPDFlongvar.SCMASKTYPEonTop = '';
              //           });
              //         } else {
              //           setState(() {
              //             ReportPDFlongvar.SCMASKTYPE = imgGeneral;
              //             ReportPDFlongvar.SCMASKTYPEonTop = '';
              //           });
              //         }
              //       },
              //       value: ReportPDFlongvar.TYPE,
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
              //     isContr: ReportPDFlongvar.iscontrol,
              //     fnContr: (input) {
              //       setState(() {
              //         ReportPDFlongvar.iscontrol = input;
              //       });
              //     },
              //     sPlaceholder: "Inspected By",
              //     sValue: ReportPDFlongvar.SignInsBy,
              //     returnfunc: (String s) {
              //       setState(() {
              //         ReportPDFlongvar.SignInsBy = s;
              //       });
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ComInputText(
                  height: 40,
                  width: 150,
                  isContr: ReportPDFlongvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFlongvar.iscontrol = input;
                    });
                  },
                  sPlaceholder: "QTY EDIT",
                  sValue: ReportPDFlongvar.QTYEDIT,
                  returnfunc: (String s) {
                    setState(() {
                      ReportPDFlongvar.QTYEDIT = s;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ComInputText(
                  height: 40,
                  width: 150,
                  isContr: ReportPDFlongvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFlongvar.iscontrol = input;
                    });
                  },
                  sPlaceholder: "TPK.LOT EDIT",
                  sValue: ReportPDFlongvar.TPKLOTEDIT,
                  returnfunc: (String s) {
                    setState(() {
                      ReportPDFlongvar.TPKLOTEDIT = s;
                    });
                  },
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       ReportPDFlongvar.QTY = ReportPDFlongvar.QTYEDIT;
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
                  isContr: ReportPDFlongvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFlongvar.iscontrol = input;
                    });
                  },
                  sPlaceholder: "INC result",
                  sValue: ReportPDFlongvar.INCresult,
                  returnfunc: (String s) {
                    setState(() {
                      ReportPDFlongvar.INCresult = s;
                    });
                  },
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       ReportPDFlongvar.datalist_ic[2].RESULT =
              //           ReportPDFlongvar.INCresult;
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
                        ReportPDFlongvar.PO,
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
          //         isContr: ReportPDFlongvar.iscontrol,
          //         fnContr: (input) {
          //           setState(() {
          //             ReportPDFlongvar.iscontrol = input;
          //           });
          //         },
          //         // isEnabled: ReportPDFlongvar.canf,
          //         sValue: ReportPDFlongvar.remark,
          //         returnfunc: (String s) {
          //           setState(() {
          //             ReportPDFlongvar.remark = s;
          //           });
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: RepaintBoundary(
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
                            border: Border.all(color: Colors.black, width: 3),
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
                                                    padding: EdgeInsets.only(
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
                                                    padding: EdgeInsets.only(
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
                                                    padding: EdgeInsets.only(
                                                        top: 7, bottom: 5),
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
                                ListFlex: [4, 8, 3, 5],
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
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      ReportPDFlongvar.CUSTOMER,
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
                                    ReportPDFlongvar.PROCESS,
                                    style: const TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),

                              BODY4SLOT(
                                ListFlex: [4, 8, 3, 5],
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
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      ReportPDFlongvar.PARTNAME,
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
                                    ReportPDFlongvar.PARTNO,
                                    style: const TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                              BODY2SLOT(
                                ListFlex: [4, 16],
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
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      ReportPDFlongvar.CUSLOT == ''
                                          ? '-'
                                          : ReportPDFlongvar.CUSLOT,
                                      style: const TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              BODY6SLOT(
                                ListFlex: const [4, 6, 3, 3, 1, 3],
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
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      ReportPDFlongvar.TPKLOTEDIT == ''
                                          ? ReportPDFlongvar.TPKLOT
                                          : ReportPDFlongvar.TPKLOTEDIT,
                                      style: const TextStyle(
                                        fontSize: 22,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (ReportPDFlongvar.SCMASKTYPEonTop !=
                                        '') ...[
                                      PicShow(
                                          width: 42,
                                          height: 42,
                                          base64:
                                              ReportPDFlongvar.SCMASKTYPEonTop),
                                    ],
                                    Text(
                                      ReportPDFlongvar.MATERIAL,
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
                                    ReportPDFlongvar.QTYEDIT == ''
                                        ? ReportPDFlongvar.QTY
                                        : ReportPDFlongvar.QTYEDIT,
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
                                ListFlex: const [40, 10, 20, 20, 20, 30, 30],
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
                                ListFlex: const [40, 10, 20, 20, 20, 30, 30],
                                widget01: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Text(
                                      ReportPDFlongvar.datalist_ic[0].ITEMname,
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
                                    ReportPDFlongvar.datalist_ic[0].METHODname,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist_ic[0].FREQ,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFlongvar
                                        .datalist_ic[0].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist_ic[0].RESULT,
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
                                ListFlex: const [40, 10, 20, 20, 20, 30, 30],
                                widget01: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Text(
                                      ReportPDFlongvar.datalist_ic[1].ITEMname,
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
                                    ReportPDFlongvar.datalist_ic[1].METHODname,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist_ic[1].FREQ,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFlongvar
                                        .datalist_ic[1].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist_ic[1].RESULT,
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
                                      ReportPDFlongvar.datalist_ic[2].ITEMname,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: Text(
                                    ReportPDFlongvar.INC02 != '' ? "" : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist_ic[2].METHODname,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist_ic[2].FREQ,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFlongvar
                                        .datalist_ic[2].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFlongvar.INCresult == ''
                                        ? ReportPDFlongvar.datalist_ic[2].RESULT
                                        : ReportPDFlongvar.INCresult,
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
                                      ReportPDFlongvar.datalist[0].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFlongvar.datalist[0].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 38,
                                          height: 38,
                                          base64: ReportPDFlongvar.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[0].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[0].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[0].FREQ ==
                                            '100% Check'
                                        ? "100%"
                                        : ReportPDFlongvar
                                            .datalist[0].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar.datalist[0]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[0].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[0].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[0].REMARK,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[0].REMARK.length >
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
                                      ReportPDFlongvar.datalist[1].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFlongvar.datalist[1].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 38,
                                          height: 38,
                                          base64: ReportPDFlongvar.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[1].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[1].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[1].FREQ ==
                                            '100% Check'
                                        ? "100%"
                                        : ReportPDFlongvar
                                            .datalist[1].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar.datalist[1]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[1].RESULT ==
                                                '0' ||
                                            ReportPDFlongvar
                                                    .datalist[1].RESULT ==
                                                '0.0' ||
                                            ReportPDFlongvar
                                                    .datalist[1].RESULT ==
                                                '0.00'
                                        ? "N/A"
                                        : ReportPDFlongvar.datalist[1].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[1].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[1].REMARK,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[1].REMARK.length >
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
                                      ReportPDFlongvar.datalist[2].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFlongvar.datalist[2].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 38,
                                          height: 38,
                                          base64: ReportPDFlongvar.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[2].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[2].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[2].FREQ ==
                                            '100% Check'
                                        ? "100%"
                                        : ReportPDFlongvar
                                            .datalist[2].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar.datalist[2]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[2].RESULT ==
                                                '0' ||
                                            ReportPDFlongvar
                                                    .datalist[2].RESULT ==
                                                '0.0' ||
                                            ReportPDFlongvar
                                                    .datalist[2].RESULT ==
                                                '0.00'
                                        ? "N/A"
                                        : ReportPDFlongvar.datalist[2].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[2].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[2].REMARK,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[2].REMARK.length >
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
                                      ReportPDFlongvar.datalist[3].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFlongvar.datalist[3].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 38,
                                          height: 38,
                                          base64: ReportPDFlongvar.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[3].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[3].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[3].FREQ ==
                                            '100% Check'
                                        ? "100%"
                                        : ReportPDFlongvar
                                            .datalist[3].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar.datalist[3]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[3].RESULT ==
                                                '0' ||
                                            ReportPDFlongvar
                                                    .datalist[3].RESULT ==
                                                '0.0' ||
                                            ReportPDFlongvar
                                                    .datalist[3].RESULT ==
                                                '0.00'
                                        ? "N/A"
                                        : ReportPDFlongvar.datalist[3].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[3].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[3].REMARK,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[3].REMARK.length >
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
                                      ReportPDFlongvar.datalist[4].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFlongvar.datalist[4].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 38,
                                          height: 38,
                                          base64: ReportPDFlongvar.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[4].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[4].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[4].FREQ ==
                                            '100% Check'
                                        ? "100%"
                                        : ReportPDFlongvar
                                            .datalist[4].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar.datalist[4]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[4].RESULT ==
                                                '0' ||
                                            ReportPDFlongvar
                                                    .datalist[4].RESULT ==
                                                '0.0' ||
                                            ReportPDFlongvar
                                                    .datalist[4].RESULT ==
                                                '0.00'
                                        ? "N/A"
                                        : ReportPDFlongvar.datalist[4].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[4].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[4].REMARK,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[4].REMARK.length >
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
                                      ReportPDFlongvar.datalist[5].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFlongvar.datalist[5].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 38,
                                          height: 38,
                                          base64: ReportPDFlongvar.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[5].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[5].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[5].FREQ ==
                                            '100% Check'
                                        ? "100%"
                                        : ReportPDFlongvar
                                            .datalist[5].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar.datalist[5]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[5].RESULT ==
                                                '0' ||
                                            ReportPDFlongvar
                                                    .datalist[5].RESULT ==
                                                '0.0' ||
                                            ReportPDFlongvar
                                                    .datalist[5].RESULT ==
                                                '0.00'
                                        ? "N/A"
                                        : ReportPDFlongvar.datalist[5].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[5].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[5].REMARK,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[5].REMARK.length >
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
                                      ReportPDFlongvar.datalist[6].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFlongvar.datalist[6].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 38,
                                          height: 38,
                                          base64: ReportPDFlongvar.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[6].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[6].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[6].FREQ ==
                                            '100% Check'
                                        ? "100%"
                                        : ReportPDFlongvar
                                            .datalist[6].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar.datalist[6]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[6].RESULT ==
                                                '0' ||
                                            ReportPDFlongvar
                                                    .datalist[6].RESULT ==
                                                '0.0' ||
                                            ReportPDFlongvar
                                                    .datalist[6].RESULT ==
                                                '0.00'
                                        ? "N/A"
                                        : ReportPDFlongvar.datalist[6].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[6].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFlongvar.datalist[7].REMARK,
                                    style: TextStyle(
                                      fontSize: ReportPDFlongvar
                                                  .datalist[7].REMARK.length >
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
                              // if (ReportPDFlongvar.rawlistDATA.length ==
                              //     0
                              if (true) ...[
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        children: [
                                          HEAD20SLOT(
                                            ListFlex: S16slot,
                                            widget01: const Center(
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
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
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            1
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][0]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget03: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            2
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][1]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget04: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            3
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][2]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget05: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            4
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][3]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget06: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            5
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][4]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget07: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            6
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][5]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget08: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            7
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][6]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget09: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            8
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][7]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget10: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            9
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][8]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget11: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            10
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][9]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget12: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            11
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][10]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget13: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            12
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][11]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget14: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            13
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][12]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget15: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            14
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][13]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget16: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            15
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][14]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget17: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            16
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][15]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget18: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            17
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][16]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget19: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            18
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][17]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget20: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            19
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][18]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget21: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            20
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][19]
                                                            .DATANO
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          BODY20SLOT(
                                            ListFlex: S16slot,
                                            widget01: const Center(
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
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
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            1
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][0]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget03: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            2
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][1]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget04: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            3
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][2]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget05: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            4
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][3]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget06: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            5
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][4]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget07: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            6
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][5]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget08: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            7
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][6]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget09: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            8
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][7]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget10: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            9
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][8]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget11: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            10
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][9]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget12: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            11
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][10]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget13: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            12
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][11]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget14: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            13
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][12]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget15: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            14
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][13]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget16: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            15
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][14]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget17: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            16
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][15]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget18: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            17
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][16]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget19: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            18
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][17]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget20: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            19
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][18]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget21: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            20
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][19]
                                                            .DATAPCS
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          BODY20SLOT(
                                            ListFlex: S16slot,
                                            widget01: Center(
                                              child: Text(
                                                ReportPDFlongvar.Listitemname
                                                            .length >
                                                        0
                                                    ? ReportPDFlongvar
                                                        .Listitemname[0]
                                                    : "",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget02: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            1
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][0]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget03: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            2
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][1]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget04: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            3
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][2]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget05: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            4
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][3]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget06: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            5
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][4]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget07: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            6
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][5]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget08: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            7
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][6]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget09: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            8
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][7]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget10: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            9
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][8]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget11: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            10
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][9]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget12: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            11
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][10]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget13: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            12
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][11]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget14: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            13
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][12]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget15: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            14
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][13]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget16: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            15
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][14]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget17: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            16
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][15]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget18: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            17
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][16]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget19: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            18
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][17]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget20: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            19
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][18]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            widget21: Center(
                                              child: Text(
                                                ReportPDFlongvar.rawlistDATA
                                                            .length >
                                                        0
                                                    ? (ReportPDFlongvar
                                                                .rawlistDATA[0]
                                                                .length >=
                                                            20
                                                        ? ReportPDFlongvar
                                                            .rawlistDATA[0][19]
                                                            .DATA
                                                        : '')
                                                    : '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              SizedBox(
                                height: 6,
                              ),
                              PICSLO2NORMAL(
                                PIC01: _dataCOMMON.databasic.PIC01,
                                ITEMPIC01: _dataCOMMON.databasic.ITEMPIC01,
                                PIC02: _dataCOMMON.databasic.PIC02,
                                ITEMPIC02: _dataCOMMON.databasic.ITEMPIC02,
                              ),
                              TAILSLOT(
                                PASS: ReportPDFlongvar.PASS,
                                PICS: _dataCOMMON.databasic.PICstd,
                                Remark: ReportPDFlongvar.remark,
                                NAME01: ReportPDFlongvar.INSBY.toUpperCase(),
                                NAME02: ReportPDFlongvar.CHECKBY,
                                NAME03: ReportPDFlongvar.APPBY,
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
