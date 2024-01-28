import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/11-GRAPHMASTER.dart';
import '../../styles/TextStyle.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import 'MASTERGRAPHmain.dart';
import 'MASTERGRAPHvar.dart';

void MASTERGRAPHconsoleBox() {
  showDialog(
    context: MASTERGRAPHContexttable,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return MASTERGRAPHconsoleBODY();
    },
  );
}

class MASTERGRAPHconsoleBODY extends StatefulWidget {
  const MASTERGRAPHconsoleBODY({Key? key}) : super(key: key);

  @override
  State<MASTERGRAPHconsoleBODY> createState() => _MASTERGRAPHconsoleBODYState();
}

class _MASTERGRAPHconsoleBODYState extends State<MASTERGRAPHconsoleBODY> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: Dialog(
        child: Container(
          height: 1800,
          child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Container(
                height: 1800,
                width: 500,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          width: 150,
                          height: 50,
                        ),
                        Column(
                          children: [
                            ComInputText(
                              nLimitedChar: 8,
                              isEnabled: false,
                              sLabel: "UID",
                              height: 40,
                              width: 300,
                              isContr: MASTERGRAPHvar.iscon01,
                              fnContr: (input) {
                                MASTERGRAPHvar.iscon01 = input;
                              },
                              sValue: MASTERGRAPHvar.con01,
                              returnfunc: (String s) {
                                MASTERGRAPHvar.con01 = s;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ComInputText(
                              sLabel: "NAME",
                              height: 40,
                              width: 300,
                              isContr: MASTERGRAPHvar.iscon01,
                              fnContr: (input) {
                                MASTERGRAPHvar.iscon01 = input;
                              },
                              sValue: MASTERGRAPHvar.con02,
                              returnfunc: (String s) {
                                MASTERGRAPHvar.con02 = s;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: const [
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.red,
                                              child:
                                                  Center(child: Text("P-01")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-02")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-03")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-04")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-05")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-06")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-07")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-08")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-09")),
                                            ),
                                          ),
                                        ),
                                        //-------------------
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-10")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-11")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-12")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-13")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-14")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-15")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-16")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-17")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-18")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-19")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64,
                                          width: 100,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              height: 40,
                                              // color: Colors.blue,
                                              child:
                                                  Center(child: Text("P-20")),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP01,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP01 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP02,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP02 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP03,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP03 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP04,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP04 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP05,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP05 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP06,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP06 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP07,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP07 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP08,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP08 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP09,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP09 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP10,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP10 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP11,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP11 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP12,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP12 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP13,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP13 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP14,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP14 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP15,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP15 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP16,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP16 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP17,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP17 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP18,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP18 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP19,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP19 = s;
                                          },
                                        ),
                                        ComInputText(
                                          isNumberOnly: true,
                                          sLabel: "GAP",
                                          height: 40,
                                          width: 100,
                                          isContr: MASTERGRAPHvar.iscon01,
                                          fnContr: (input) {
                                            MASTERGRAPHvar.iscon01 = input;
                                          },
                                          sValue: MASTERGRAPHvar.GAP20,
                                          returnfunc: (String s) {
                                            MASTERGRAPHvar.GAP20 = s;
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  MASTERGRAPHContexttable.read<
                                          GRAPHMASTER_Bloc>()
                                      .add(GRAPHMASTER_WRITE());

                                  onLoadingType01(
                                      MASTERGRAPHContexttable,
                                      () {},
                                      MASTERGRAPHContexttable.read<
                                              GRAPHMASTER_Bloc>()
                                          .add(GRAPHMASTER_READ()));
                                },
                                // style: ButtonStyle(
                                //   backgroundColor:
                                //       MaterialStateProperty.all(Colors.red),
                                // ),
                                child: const Text("UPDATE"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
