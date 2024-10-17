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
import 'ReportPDFcommonlistvar.dart';
import 'ReportPDFcommonlistvar.dart';

late BuildContext ReportPDFcommonlistcontext;

class ReportPDFcommonlist extends StatefulWidget {
  ReportPDFcommonlist({
    Key? key,
    this.dataCommon,
  }) : super(key: key);
  CommonReportOutput? dataCommon;
  @override
  State<ReportPDFcommonlist> createState() => _ReportPDFcommonlistState();
}

class _ReportPDFcommonlistState extends State<ReportPDFcommonlist> {
  @override
  void initState() {
    if (ReportPDFcommonlistvar.PO != '') {
      ReportPDFcommonlistvar.canf = false;
      context
          .read<ReportPDFCommon_Cubit>()
          .ReportPDFCommonCubit(ReportPDFcommonlistvar.PO);

      ReportPDFcommonlistvar.QTYEDIT = '';
      ReportPDFcommonlistvar.INCresult = '';
    }
    super.initState();
  }

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ReportPDFcommonlistcontext = context;

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
      ReportPDFcommonlistvar.STATUS = 'REPORT READY';
      ReportPDFcommonlistvar.CUSTOMER = _dataCOMMON.databasic.CUSTOMER;
      ReportPDFcommonlistvar.PROCESS = _dataCOMMON.databasic.PROCESS;
      ReportPDFcommonlistvar.PARTNAME = _dataCOMMON.databasic.PARTNAME;
      ReportPDFcommonlistvar.PARTNO = _dataCOMMON.databasic.PARTNO;
      ReportPDFcommonlistvar.CUSLOT = _dataCOMMON.databasic.CUSLOT;
      ReportPDFcommonlistvar.TPKLOT = _dataCOMMON.databasic.TPKLOT;
      ReportPDFcommonlistvar.MATERIAL = _dataCOMMON.databasic.MATERIAL;
      if (_dataCOMMON.databasic.UNITSAP.toUpperCase() != 'KG') {
        ReportPDFcommonlistvar.QTY =
            '${double.parse(ConverstStr(_dataCOMMON.databasic.QTY)).toStringAsFixed(0)} ${_dataCOMMON.databasic.UNITSAP}';
      } else {
        ReportPDFcommonlistvar.QTY =
            '${double.parse(ConverstStr(_dataCOMMON.databasic.QTY)).toStringAsFixed(1)} ${_dataCOMMON.databasic.UNITSAP}';
      }

      ReportPDFcommonlistvar.PIC01 = _dataCOMMON.databasic.PIC01;
      ReportPDFcommonlistvar.PIC02 = _dataCOMMON.databasic.PIC02;
      ReportPDFcommonlistvar.PICstd = _dataCOMMON.databasic.PICstd;

      ReportPDFcommonlistvar.PASS = _dataCOMMON.databasic.PASS;
      ReportPDFcommonlistvar.remark = '';
      if (_dataCOMMON.databasic.PARTNAMEref != '') {
        // ReportPDFcommonlistvar.remark =
        //     'Reference data from\n${_dataCOMMON.databasic.PARTNAMEref}\n${_dataCOMMON.databasic.PARTref}';
        ReportPDFcommonlistvar.remark =
            'Reference data from TP LOT NO. ${_dataCOMMON.databasic.TPKLOTref}';

        //TPKLOTref
      }

      ReportPDFcommonlistvar.INC01 = _dataCOMMON.databasic.INC01;
      ReportPDFcommonlistvar.INC02 = _dataCOMMON.databasic.INC02;
      ReportPDFcommonlistvar.INSBY = _dataCOMMON.databasic.INSBY;
      ReportPDFcommonlistvar.CHECKBY = _dataCOMMON.databasic.CHECKBY;
      ReportPDFcommonlistvar.APPBY = _dataCOMMON.databasic.APPBY;

      // _dataCOMMON.datain[i].ITEMname

//remark

      // print(_dataCOMMON.datain[0]);
      // print(_dataCOMMON.datain.length);
      // ReportPDFcommonlistvar.rawlistDATA[0] = [];
      ReportPDFcommonlistvar.rawlistCompound = [];
      ReportPDFcommonlistvar.rawlistRoughness = [];
      ReportPDFcommonlistvar.rawlistCORE = [];

      ReportPDFcommonlistvar.rawlistDATA = [];

      ReportPDFcommonlistvar.graphupper = [];
      ReportPDFcommonlistvar.graphdata = [];
      ReportPDFcommonlistvar.graphdata2 = [];
      ReportPDFcommonlistvar.graphdata3 = [];
      ReportPDFcommonlistvar.graphdata4 = [];
      ReportPDFcommonlistvar.graphunder = [];
      ReportPDFcommonlistvar.Listitemname = [];

      for (var i = 0; i < _dataCOMMON.datain_IC.length; i++) {
        ReportPDFcommonlistvar.datalist_ic[i].ITEMname =
            " ${_dataCOMMON.datain_IC[i].ITEMname}";
        ReportPDFcommonlistvar.datalist_ic[i].SCMARK =
            _dataCOMMON.datain_IC[i].SCMARK;
        ReportPDFcommonlistvar.datalist_ic[i].METHODname =
            _dataCOMMON.datain_IC[i].METHODname;
        ReportPDFcommonlistvar.datalist_ic[i].FREQ =
            _dataCOMMON.datain_IC[i].FREQ;
        ReportPDFcommonlistvar.datalist_ic[i].SPECIFICATIONname =
            _dataCOMMON.datain_IC[i].SPECIFICATION;
        ReportPDFcommonlistvar.datalist_ic[i].RESULT =
            _dataCOMMON.datain_IC[i].RESULT;
        ReportPDFcommonlistvar.datalist_ic[i].REMARK =
            _dataCOMMON.datain_IC[i].Remark;
      }

      for (var i = 0; i < _dataCOMMON.datain.length; i++) {
        String Loadin = '';
        if (_dataCOMMON.datain[i].LOAD != '' &&
            _dataCOMMON.datain[i].LOAD != '-') {
          Loadin = "( Load ${_dataCOMMON.datain[i].LOAD} )";
        }
        ReportPDFcommonlistvar.datalist[i].ITEMname =
            " ${_dataCOMMON.datain[i].ITEMname} ${Loadin}";
        ReportPDFcommonlistvar.datalist[i].SCMARK =
            _dataCOMMON.datain[i].SCMARK;
        ReportPDFcommonlistvar.datalist[i].METHODname =
            _dataCOMMON.datain[i].METHODname;
        ReportPDFcommonlistvar.datalist[i].FREQ = _dataCOMMON.datain[i].FREQ;
        ReportPDFcommonlistvar.datalist[i].SPECIFICATIONname =
            _dataCOMMON.datain[i].SPECIFICATION;
        ReportPDFcommonlistvar.datalist[i].RESULT =
            _dataCOMMON.datain[i].RESULT;
        ReportPDFcommonlistvar.datalist[i].REMARK =
            _dataCOMMON.datain[i].Remark;
        //print(ReportPDFcommonlistvar.datalist[i].RESULT.length);
        //Surface Hardness

        // if (_dataCOMMON.datain[i].TYPE == 'Number') {
        if (_dataCOMMON.datain[i].TYPE == 'Number') {
          if (_dataCOMMON.datain[i].SRAWDATA != 'NO') {
            ReportPDFcommonlistvar.Listitemname.add(
                _dataCOMMON.datain[i].ITEMname);

            lengthdata = ReportPDFcommonlistvar.Listitemname.length - 1;
            ReportPDFcommonlistvar.rawlistDATA.add([]);
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
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
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
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
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
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
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
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '4',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '5',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '6',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '7',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '8',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '9',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '10',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '11',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '12',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '13',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '14',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '15',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '16',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '17',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '18',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
                  DATANO: HardnessNO.toString(),
                  DATAPCS: '19',
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
                ));
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
                ReportPDFcommonlistvar.rawlistDATA[lengthdata].add(rawlist(
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
          ReportPDFcommonlistvar.rawlistGraph = [];
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
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA01p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA01p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA01))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA02p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA02p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA02))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA03p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA03p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA03))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA04p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA04p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA04))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA05p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA05p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA05))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA06p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA06p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA06))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA07p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA07p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA07))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA08p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA08p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA08))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA09p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA09p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA09))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA10p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA10p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA10))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA11p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA11p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA11))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA12p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA12p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA12))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA13p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA13p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA13))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA14p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA14p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA14))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA15p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA15p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA15))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA16p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA16p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA16))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA17p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA17p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA17))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA18p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA18p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA18))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA19p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
                ));

                ReportPDFcommonlistvar.graphdata.add(
                  FlSpot(
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA19p)),
                      double.parse(ConverstStr(
                          _dataCOMMON.datain[i].datapackset[li].DATA19))),
                );
              }
              if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
                ReportPDFcommonlistvar.rawlistGraph.add(rawlist(
                  DATANO: GraphNO.toString(),
                  DATAPCS: _dataCOMMON.datain[i].datapackset[li].DATA20p,
                  DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
                ));

                ReportPDFcommonlistvar.graphdata.add(
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

          // ReportPDFcommonlistvar.rawlistGraphCore = rawlist(
          //   DATAPCS: "Core",
          //   DATA: ReportPDFcommonlistvar
          //       .rawlistGraph[ReportPDFcommonlistvar.rawlistGraph.length - 1].DATA,
          // );
          // print(">>>${ReportPDFcommonlistvar.rawlistGraph.length}");
          // ReportPDFcommonlistvar.rawlistGraph.removeLast();
          if (ReportPDFcommonlistvar.rawlistGraph.length > 2) {
            ReportPDFcommonlistvar.rawlistGraphCore = rawlist(
              DATAPCS: "Core",
              DATA: ReportPDFcommonlistvar
                  .rawlistGraph[ReportPDFcommonlistvar.rawlistGraph.length - 1]
                  .DATA,
            );
            // print(">>>${ReportPDFcommonlistvar.rawlistGraph.length}");

            ReportPDFcommonlistvar.rawlistGraph
                .removeAt(ReportPDFcommonlistvar.rawlistGraph.length - 1);
          }

          ReportPDFcommonlistvar.graphupper = [
            FlSpot(ReportPDFcommonlistvar.graphdata[0].x, 1000),
            FlSpot(
                ReportPDFcommonlistvar
                    .graphdata[ReportPDFcommonlistvar.graphdata.length - 2].x,
                1000)
          ];
          ReportPDFcommonlistvar.graphdata2 = [
            FlSpot(ReportPDFcommonlistvar.graphdata[0].x,
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross))),
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)),
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross)))
          ];

          ReportPDFcommonlistvar.graphdata3 = [
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)),
                double.parse(ConverstStr(_dataCOMMON.datain[i].Cross))),
            FlSpot(double.parse(ConverstStr(_dataCOMMON.datain[i].RESULT)), 0)
          ];

          ReportPDFcommonlistvar.graphdata4 = [
            FlSpot(ReportPDFcommonlistvar.graphdata[0].x, 1000),
            FlSpot(ReportPDFcommonlistvar.graphdata[0].x, 0)
          ];

          ReportPDFcommonlistvar.graphunder = [
            FlSpot(ReportPDFcommonlistvar.graphdata[0].x, 0),
            FlSpot(
                ReportPDFcommonlistvar
                    .graphdata[ReportPDFcommonlistvar.graphdata.length - 2].x,
                0)
          ];
        }

        if (ReportPDFcommonlistvar.graphupper.length > 1) {
          ReportPDFcommonlistvar.graphupper;
        }

        if (ReportPDFcommonlistvar.graphdata2.length > 1) {
          ReportPDFcommonlistvar.graphdata2;
        }
        if (ReportPDFcommonlistvar.graphdata3.length > 1) {
          ReportPDFcommonlistvar.graphdata3;
        }
        if (ReportPDFcommonlistvar.graphdata4.length > 1) {
          ReportPDFcommonlistvar.graphdata4;
        }
        if (ReportPDFcommonlistvar.graphunder.length > 1) {
          ReportPDFcommonlistvar.graphunder;
        }

        //Compound Layer

        // Roughness
      }
      if (ReportPDFcommonlistvar.graphdata.length > 1) {
        ReportPDFcommonlistvar.graphdata.removeLast();
        //     .removeAt(ReportPDFcommonlistvar.graphdata.length - 1);
      }

      // print(ReportPDFcommonlistvar.datalist);
    } else {
      ReportPDFcommonlistvar.STATUS = 'WATTING or NO-DATA';

      ReportPDFcommonlistvar.QTYEDIT = '';
      ReportPDFcommonlistvar.INCresult = '';
      ReportPDFcommonlistvar.CUSTOMER = '';
      ReportPDFcommonlistvar.PROCESS = '';
      ReportPDFcommonlistvar.PARTNAME = '';
      ReportPDFcommonlistvar.PARTNO = '';
      ReportPDFcommonlistvar.CUSLOT = '';
      ReportPDFcommonlistvar.TPKLOT = '';
      ReportPDFcommonlistvar.MATERIAL = '';
      ReportPDFcommonlistvar.QTY = '';

      ReportPDFcommonlistvar.PICstd = '';
      ReportPDFcommonlistvar.PIC01 = '';
      ReportPDFcommonlistvar.PIC02 = '';

      ReportPDFcommonlistvar.rawlistDATA = [];
      ReportPDFcommonlistvar.rawlistCompound = [];
      ReportPDFcommonlistvar.rawlistRoughness = [];
      ReportPDFcommonlistvar.rawlistCORE = [];
      ReportPDFcommonlistvar.INC01 = '';
      ReportPDFcommonlistvar.INC02 = '';

      ReportPDFcommonlistvar.datalist_ic = [
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

      ReportPDFcommonlistvar.datalist = [
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

      ReportPDFcommonlistvar.rawlistGraphCore = rawlist();

      ReportPDFcommonlistvar.rawlistGraph = [];
      ReportPDFcommonlistvar.graphupper = [];
      ReportPDFcommonlistvar.graphdata = [];
      ReportPDFcommonlistvar.graphdata2 = [];
      ReportPDFcommonlistvar.graphdata3 = [];
      ReportPDFcommonlistvar.graphdata4 = [];
      ReportPDFcommonlistvar.graphunder = [];
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
                  isContr: ReportPDFcommonlistvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFcommonlistvar.iscontrol = input;
                    });
                  },
                  isEnabled: ReportPDFcommonlistvar.canf,
                  sValue: ReportPDFcommonlistvar.PO,
                  returnfunc: (String s) {
                    ReportPDFcommonlistvar.PO = s;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    if (ReportPDFcommonlistvar.PO != '') {
                      context
                          .read<ReportPDFCommon_Cubit>()
                          .ReportPDFCommonCubit(ReportPDFcommonlistvar.PO);
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
                    ReportPDFcommonlistvar.canf = true;
                    ReportPDFcommonlistvar.iscontrol = true;
                    ReportPDFcommonlistvar.PO = '';
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
                  color: ReportPDFcommonlistvar.STATUS == 'REPORT READY'
                      ? Colors.green
                      : Colors.yellow,
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(ReportPDFcommonlistvar.STATUS),
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
              //         ReportPDFcommonlistvar.TYPE = d;
              //         if (d == '1') {
              //           setState(() {
              //             ReportPDFcommonlistvar.SCMASKTYPE = imgGeneral;
              //             ReportPDFcommonlistvar.SCMASKTYPEonTop = '';
              //           });
              //         } else if (d == '2') {
              //           setState(() {
              //             ReportPDFcommonlistvar.SCMASKTYPE = imgJTEKT;
              //             ReportPDFcommonlistvar.SCMASKTYPEonTop = '';
              //           });
              //         } else if (d == '3') {
              //           setState(() {
              //             ReportPDFcommonlistvar.SCMASKTYPE = imgNTN;
              //             ReportPDFcommonlistvar.SCMASKTYPEonTop = imgNTNonH;
              //           });
              //         } else if (d == '4') {
              //           setState(() {
              //             ReportPDFcommonlistvar.SCMASKTYPE = imgTBKK;
              //             ReportPDFcommonlistvar.SCMASKTYPEonTop = '';
              //           });
              //         } else if (d == '5') {
              //           setState(() {
              //             ReportPDFcommonlistvar.SCMASKTYPE = imgGKN;
              //             ReportPDFcommonlistvar.SCMASKTYPEonTop = '';
              //           });
              //         } else {
              //           setState(() {
              //             ReportPDFcommonlistvar.SCMASKTYPE = imgGeneral;
              //             ReportPDFcommonlistvar.SCMASKTYPEonTop = '';
              //           });
              //         }
              //       },
              //       value: ReportPDFcommonlistvar.TYPE,
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
              //     isContr: ReportPDFcommonlistvar.iscontrol,
              //     fnContr: (input) {
              //       setState(() {
              //         ReportPDFcommonlistvar.iscontrol = input;
              //       });
              //     },
              //     sPlaceholder: "Inspected By",
              //     sValue: ReportPDFcommonlistvar.SignInsBy,
              //     returnfunc: (String s) {
              //       setState(() {
              //         ReportPDFcommonlistvar.SignInsBy = s;
              //       });
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ComInputText(
                  height: 40,
                  width: 150,
                  isContr: ReportPDFcommonlistvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFcommonlistvar.iscontrol = input;
                    });
                  },
                  sPlaceholder: "QTY EDIT",
                  sValue: ReportPDFcommonlistvar.QTYEDIT,
                  returnfunc: (String s) {
                    setState(() {
                      ReportPDFcommonlistvar.QTYEDIT = s;
                    });
                  },
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       ReportPDFcommonlistvar.QTY = ReportPDFcommonlistvar.QTYEDIT;
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
                  isContr: ReportPDFcommonlistvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFcommonlistvar.iscontrol = input;
                    });
                  },
                  sPlaceholder: "INC result",
                  sValue: ReportPDFcommonlistvar.INCresult,
                  returnfunc: (String s) {
                    setState(() {
                      ReportPDFcommonlistvar.INCresult = s;
                    });
                  },
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       ReportPDFcommonlistvar.datalist_ic[2].RESULT =
              //           ReportPDFcommonlistvar.INCresult;
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
                        ReportPDFcommonlistvar.PO,
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
          //         isContr: ReportPDFcommonlistvar.iscontrol,
          //         fnContr: (input) {
          //           setState(() {
          //             ReportPDFcommonlistvar.iscontrol = input;
          //           });
          //         },
          //         // isEnabled: ReportPDFcommonlistvar.canf,
          //         sValue: ReportPDFcommonlistvar.remark,
          //         returnfunc: (String s) {
          //           setState(() {
          //             ReportPDFcommonlistvar.remark = s;
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
                                                        top: 15, bottom: 5),
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
                                            "FR-HQC-03/002-03-18/12/20",
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
                              HEAD4SLOT(
                                ListFlex: [4, 8, 3, 5],
                                widget01: const Center(
                                  child: Text(
                                    "Customer",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget02: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      ReportPDFcommonlistvar.CUSTOMER,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                widget03: const Center(
                                  child: Text(
                                    "Process",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFcommonlistvar.PROCESS,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              BODY4SLOT(
                                ListFlex: [4, 8, 3, 5],
                                widget01: const Center(
                                  child: Text(
                                    "Part Name",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget02: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      ReportPDFcommonlistvar.PARTNAME,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                widget03: const Center(
                                  child: Text(
                                    "Part No.",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFcommonlistvar.PARTNO,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              BODY2SLOT(
                                ListFlex: [4, 16],
                                widget01: const Center(
                                  child: Text(
                                    "Customer Lot No.",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget02: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      ReportPDFcommonlistvar.CUSLOT,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              BODY6SLOT(
                                ListFlex: const [4, 6, 3, 3, 1, 3],
                                widget01: const Center(
                                  child: Text(
                                    "TPK. Lot No.",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget02: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      ReportPDFcommonlistvar.TPKLOT,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                widget03: const Center(
                                  child: Text(
                                    "Material",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget04: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (ReportPDFcommonlistvar
                                            .SCMASKTYPEonTop !=
                                        '') ...[
                                      PicShow(
                                          width: 42,
                                          height: 42,
                                          base64: ReportPDFcommonlistvar
                                              .SCMASKTYPEonTop),
                                    ],
                                    Text(
                                      ReportPDFcommonlistvar.MATERIAL,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                widget05: const Center(
                                  child: Text(
                                    "Qty.",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFcommonlistvar.QTYEDIT == ''
                                        ? ReportPDFcommonlistvar.QTY
                                        : ReportPDFcommonlistvar.QTYEDIT,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              for (int i = 0;
                                  // i < ReportPDFcommonlistvar.rawlistDATA.length;
                                  i <
                                      ReportPDFcommonlistvar
                                          .Listitemname.length;
                                  i++) ...[
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: const Center(
                                            child: Text(
                                              'NO.',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: const Center(
                                            child: Text(
                                              'ITEMs',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: const Center(
                                            child: Text(
                                              'Value',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                for (int j = 0;
                                    j <
                                        ReportPDFcommonlistvar
                                            .rawlistDATA[i].length;
                                    j++) ...[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                                left: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                                right: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                                bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            // color: Colors.blue,
                                            child: Center(
                                              child: Text(
                                                '${j + 1}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          child: Container(
                                            height: 40,
                                            width: 250,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                                left: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                                right: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                                bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            // color: Colors.blue,
                                            child: Center(
                                              child: Text(
                                                '${ReportPDFcommonlistvar.Listitemname[i]}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          child: Container(
                                            height: 40,
                                            width: 250,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                                left: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                                right: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                                bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            // color: Colors.blue,
                                            child: Center(
                                              child: Text(
                                                '${ReportPDFcommonlistvar.rawlistDATA[i][j].DATA}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                              if (_dataCOMMON.CAL2datadata.Area != '') ...[
                                // if (true) ...[
                                //
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: Center(
                                            child: Text(
                                              "W1",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: Center(
                                            child: Text(
                                              _dataCOMMON.CAL2datadata.VAL1,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: Center(
                                            child: Text(
                                              "W2",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: Center(
                                            child: Text(
                                              _dataCOMMON.CAL2datadata.VAL2,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: Center(
                                            child: Text(
                                              "W3",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: Center(
                                            child: Text(
                                              _dataCOMMON.CAL2datadata.VAL3,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: Center(
                                            child: Text(
                                              "W4",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: Center(
                                            child: Text(
                                              _dataCOMMON.CAL2datadata.VAL4,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: Center(
                                            child: Text(
                                              "Area",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              left: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          // color: Colors.blue,
                                          child: Center(
                                            child: Text(
                                              _dataCOMMON.CAL2datadata.Area,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              SizedBox(
                                height: 6,
                              ),
                              if (_dataCOMMON.databasic.PIC01 != '' ||
                                  _dataCOMMON.databasic.PIC02 != '') ...[
                                PICSLO2NORMAL(
                                  PIC01: _dataCOMMON.databasic.PIC01,
                                  ITEMPIC01: _dataCOMMON.databasic.ITEMPIC01,
                                  PIC02: _dataCOMMON.databasic.PIC02,
                                  ITEMPIC02: _dataCOMMON.databasic.ITEMPIC02,
                                ),
                              ],
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
