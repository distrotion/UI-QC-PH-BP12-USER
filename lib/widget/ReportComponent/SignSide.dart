import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/imgset.dart';
import 'CommonReport.dart';

class TAILSLOT extends StatelessWidget {
  TAILSLOT({
    Key? key,
    this.widget01,
    this.widget02,
    this.widget03,
    this.widget04,
    this.widget05,
    this.widget06,
    this.PICS,
    this.PASS,
    this.Remark,
    this.NAME01,
    this.NAME02,
    this.NAME03,
  }) : super(key: key);
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;
  Widget? widget04;
  Widget? widget05;
  Widget? widget06;
  String? PICS;
  String? PASS;
  String? Remark;
  String? NAME01;
  String? NAME02;
  String? NAME03;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MMM-yyyy');
    String formattedDate = formatter.format(now);
    return Padding(
      padding: const EdgeInsets.only(
        // top: 12,
        bottom: 12,
        right: 8,
        left: 8,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 260,
                child: Column(
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 130,
                            child: Column(
                              children: [
                                HEAD4SLOT(
                                  padd: 0,
                                  hig: 40,
                                  ListFlex: const [1, 1, 1, 1],
                                  widget01: const Center(
                                    child: Text(
                                      "Judgement",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget02: const Center(
                                    child: Text(
                                      "Inspected By",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget03: const Center(
                                    child: Text(
                                      "Checked By",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget04: const Center(
                                    child: Text(
                                      "Approved By",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY4SLOT(
                                  padd: 0,
                                  hig: 90,
                                  ListFlex: const [1, 1, 1, 1],
                                  widget01: Center(
                                    child: Text(
                                      PASS ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget02: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 15, top: 25),
                                          child: Text(
                                            NAME01 ?? '',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(),
                                          child: Text(
                                            formattedDate,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget03: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 15, top: 25),
                                          child: Text(
                                            NAME02 ?? '',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(),
                                          child: Text(
                                            formattedDate,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget04: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 15, top: 25),
                                          child: Text(
                                            NAME03 ?? '',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(),
                                          child: Text(
                                            formattedDate,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black, width: 3),
                            // ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      "Remark",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(Remark ?? ''),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: PicShow(width: 800, height: 240, base64: PICS ?? ''),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
