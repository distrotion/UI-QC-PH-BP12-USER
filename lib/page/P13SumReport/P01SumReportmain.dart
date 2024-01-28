import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/13-01-SumReportGET.dart';
// import '../../widget/GRAPHPOP/POPgraph.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import 'P01SumReportvar.dart';

late BuildContext P01SumReportcontext;

class P01SumReportmain extends StatefulWidget {
  // P01SumReportmain({
  //   super.key,
  // this.datain,
  // });
  P01SumReportmain({
    Key? key,
    this.datain,
  }) : super(key: key);
  datauoutraw? datain = datauoutraw();

  @override
  State<P01SumReportmain> createState() => _P01SumReportmainState();
}

class _P01SumReportmainState extends State<P01SumReportmain> {
  @override
  Widget build(BuildContext context) {
    P01SumReportcontext = context;

    datauoutraw _datain = widget.datain ?? datauoutraw();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Text("start"),
                  InkWell(
                    onTap: () {
                      CalendaSelectDate(context, DateTime.now(), (v) {
                        P01SumReportvar.startDATE = v;
                        P01SumReportvar.startDATElist = v.split('-');

                        if (P01SumReportvar.startDATElist.isNotEmpty) {
                          P01SumReportvar.startDATEout.year =
                              P01SumReportvar.startDATElist[0];
                          P01SumReportvar.startDATEout.month =
                              P01SumReportvar.startDATElist[1];
                          P01SumReportvar.startDATEout.day =
                              P01SumReportvar.startDATElist[2];
                        }
                        setState(() {});
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Color(0x00b23127),
                        // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

                        // image: DecorationImage(
                        //   image: AssetImage("assets/icons/groupNEW@3x.png"),
                        //   fit: BoxFit.fitWidth,
                        // ),
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                      height: 40,
                      width: 200,
                      child: Center(
                        child: Text(P01SumReportvar.startDATE),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("end"),
                  InkWell(
                    onTap: () {
                      CalendaSelectDate(context, DateTime.now(), (v) {
                        P01SumReportvar.endDATE = v;
                        P01SumReportvar.endDATElist = v.split('-');

                        if (P01SumReportvar.endDATElist.isNotEmpty) {
                          P01SumReportvar.endDATEout.year =
                              P01SumReportvar.endDATElist[0];
                          P01SumReportvar.endDATEout.month =
                              P01SumReportvar.endDATElist[1];
                          P01SumReportvar.endDATEout.day =
                              P01SumReportvar.endDATElist[2];
                        }
                        setState(() {});
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Color(0x00b23127),
                        // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

                        // image: DecorationImage(
                        //   image: AssetImage("assets/icons/groupNEW@3x.png"),
                        //   fit: BoxFit.fitWidth,
                        // ),
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                      height: 40,
                      width: 200,
                      child: Center(
                        child: Text(P01SumReportvar.endDATE),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                width: 300,
                // child: _tabtableB3(
                //   height: 40,
                //   value: preview ?? [INSDATA()],
                // ),
                child: ComInputText(
                  height: 40,
                  width: 300,
                  isNumberOnly: true,
                  isContr: P01SumReportvar.iscon01,
                  fnContr: (input) {
                    P01SumReportvar.iscon01 = input;
                  },
                  sValue: P01SumReportvar.MAT,
                  returnfunc: (String s) {
                    // input = s;
                    P01SumReportvar.MAT = s;
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  //
                  // if (P01SumReportvar.MAT != '') {
                  context.read<SumReportGET_Bloc>().add(SumReportGET_GET());
                  // }
                },
                child: Container(
                  width: 100,
                  height: 40,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          // for (int i = 0; i < _datain.itemlist.length; i++) ...[
          //   //
          //   InkWell(
          //     onTap: () {
          //       LineGraphPOP(context);
          //     },
          //     child: Container(
          //       height: 50,
          //       width: 300,
          //       decoration: BoxDecoration(
          //         border: Border.all(color: Colors.black),
          //       ),
          //       child: Center(
          //         child: Text(_datain.itemobject[_datain.itemlist[i]] ?? ''),
          //       ),
          //     ),
          //   )
          // ],
        ],
      ),
    );
  }
}
