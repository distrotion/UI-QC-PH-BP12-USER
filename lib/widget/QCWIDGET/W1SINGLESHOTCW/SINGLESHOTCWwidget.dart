import 'package:flutter/material.dart';

import '../../../styles/TextStyle.dart';

import '../../common/ComInputText.dart';
import '../../common/Easydropdown.dart';
import '../../common/imgset.dart';
import '../consolelayout.dart';

class SINGLESHOTCWmain extends StatelessWidget {
  SINGLESHOTCWmain({
    Key? key,
    //------ Left
    this.LABEL,
    this.PO,
    this.CP,
    this.QTY,
    this.PROCESS,
    this.CUSLOT,
    this.TPKLOT,
    this.FG,
    this.CUSTOMER,
    this.PART,
    this.PARTNAME,
    this.MATERIAL,
    //------- Top
    required this.ItemPickres,
    this.ItemPick,
    this.PCS,
    this.PCSleft,
    this.POINTs,
    this.UNIT,
    this.INTERSEC,
    this.RESULTFORMAT,
    this.Area,
    this.GAP,
    this.GAPname,
    required this.GAPnamePick,
    this.GAPnameList,
    //------- Bottom
    required this.ACCEPT,
    required this.FINISH,
    this.preview,
    this.confirmdata,
    this.VAL1,
    this.VAL2,
    this.Aear,
    this.FORMULA,
    this.FORMULAI,
    //------- Right
    required this.CLEAR,
    required this.BACKPAGE,
    required this.RESETVALUE,
    this.ITEMleftUNIT,
    this.ITEMleftVALUE,
    //-------
    this.PICB64,
  }) : super(key: key);

  //Left --------------------------------------------
  String? LABEL;
  String? PO; //ok
  String? CP; //ok
  String? QTY; //ok
  String? PROCESS; //ok
  String? CUSLOT; //ok
  String? TPKLOT; //ok
  String? FG; //ok
  String? CUSTOMER; //ok
  String? PART; //ok
  String? PARTNAME; //ok
  String? MATERIAL; //ok

  //Top --------------------------------------------

  Function(String) ItemPickres; //ok
  List<String>? ItemPick; //ok
  String? PCS; //ok
  String? PCSleft; //ok
  String? POINTs;
  String? UNIT; //ok
  String? Area;
  String? INTERSEC;
  String? RESULTFORMAT;
  String? GAP;
  List<String>? GAPnameList;
  String? GAPname;
  Function(String) GAPnamePick;
  //Bottom --------------------------------------------

  Function ACCEPT;
  Function FINISH;

  List<INSDATA>? preview; //ok
  List<INSDATA>? confirmdata; //ok

  String? VAL1;
  String? VAL2;
  String? Aear;
  String? FORMULA;
  String? FORMULAI;

  //Right --------------------------------------------
  Function CLEAR;
  Function BACKPAGE;
  Function RESETVALUE;

  List<INSDATA>? ITEMleftUNIT; // ok
  List<INSDATA>? ITEMleftVALUE; // ok

  String? PICB64;

  @override
  Widget build(BuildContext context) {
    return SINGLESHITLAYOUT(
      LABEL: LABEL ?? '',
      cocover: Colors.blue,
      PO: PO ?? '',
      CP: CP ?? '',
      QTY: QTY ?? '',
      PROCESS: PROCESS ?? '',
      CUSLOT: CUSLOT ?? '',
      TPKLOT: TPKLOT ?? '',
      FG: FG ?? '',
      CUSTOMER: CUSTOMER ?? '',
      PART: PART ?? '',
      PARTNAME: PARTNAME ?? '',
      MATERIAL: MATERIAL ?? '',
      childBOT: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            ACCEPT(PO) ?? () {};
                          },
                          child: Container(
                            height: 40,
                            color: Colors.blue,
                            child: const Center(
                              child: Text("ACCEPT",
                                  style: TxtStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            FINISH(PO) ?? () {};
                          },
                          child: Container(
                            height: 40,
                            color: Colors.green,
                            child: const Center(
                              child: Text("FINISH",
                                  style: TxtStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(0)),
                          ),
                          child: const Text(
                            "Preview value",
                            style: TxtStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: _tabtableB3(
                    height: 40,
                    value: preview ?? [INSDATA()],
                  ),
                ),
                SizedBox(
                  height: 25,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(0)),
                          ),
                          child: const Text(
                            "Value",
                            style: TxtStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 165,
                  child: SingleChildScrollView(
                    child: _tabtableB4(
                      height: 40,
                      // value: confirmdata ?? [INSDATA()],
                      VAL1: VAL1,
                      VAL2: VAL2,
                      Aear: Aear,
                      FORMULA: FORMULAI,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
      childTOP: [
        _topboxfull(
          outfn: (input) {
            ItemPickres(input) ?? () {};
          },
          dropdown: ItemPick ?? [''],
          PCS: PCS,
          PCSleft: PCSleft,
          POINTs: POINTs,
          UNIT: UNIT,
          Area: Area,
          FORMULA: FORMULA,
          RESULTFORMAT: RESULTFORMAT,
          GAP: GAP,
          GAPname: GAPname,
          GAPnameList: GAPnameList,
          GAPnamePick: GAPnamePick,
        )
      ],
      childRIGHT: [
        // Row(
        //   children: [
        //     Expanded(
        //       flex: 1,
        //       child: Padding(
        //         padding: const EdgeInsets.all(2.0),
        //         child: InkWell(
        //           onTap: () {
        //             CLEAR(PO) ?? () {};
        //           },
        //           child: Container(
        //             height: 40,
        //             color: Colors.orange,
        //             child: const Center(
        //               child: Text("CLEAR",
        //                   style: TxtStyle(
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.bold)),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () {
                    BACKPAGE(PO) ?? () {};
                  },
                  child: Container(
                    height: 40,
                    color: Colors.blue,
                    child: const Center(
                      child: Text("BACK PAGE",
                          style: TxtStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       flex: 1,
        //       child: Padding(
        //         padding: const EdgeInsets.all(2.0),
        //         child: InkWell(
        //           onTap: () {
        //             RESETVALUE(PO) ?? () {};
        //           },
        //           child: Container(
        //             height: 40,
        //             color: Colors.red,
        //             child: const Center(
        //               child: Text("RESET VALUE",
        //                   style: TxtStyle(
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.bold)),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(0)),
                  ),
                  child: PicShow(
                    base64: PICB64 ?? "",
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 25,
                  color: Colors.grey,
                  child: _tabtableB2(
                    value: [INSDATA(V1: "M FOR", V2: "ITEMs")],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  height: 50,
                  child: SingleChildScrollView(
                    child: _tabtableB2(
                      value: ITEMleftUNIT ?? [INSDATA()],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 25,
                  color: Colors.grey,
                  child: _tabtableB2(
                    value: [
                      INSDATA(
                        V1: "ITEM",
                        V2: "Values",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  height: 100,
                  child: SingleChildScrollView(
                      child: _tabtableB2(
                    value: ITEMleftVALUE ?? [INSDATA()],
                  )),
                ),
              ),
            ),
          ],
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       flex: 1,
        //       child: Padding(
        //         padding: const EdgeInsets.all(2.0),
        //         child: Container(
        //           height: 90,
        //           decoration: BoxDecoration(
        //             border: Border.all(color: Colors.black),
        //             borderRadius: const BorderRadius.all(Radius.circular(0)),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}

class _topboxfull extends StatefulWidget {
  _topboxfull({
    Key? key,
    required this.outfn,
    required this.dropdown,
    this.PCS,
    this.PCSleft,
    this.POINTs,
    this.UNIT,
    this.Area,
    this.FORMULA,
    this.RESULTFORMAT,
    this.GAP,
    this.GAPname,
    this.GAPnameList,
    required this.GAPnamePick,
  }) : super(key: key);
  Function outfn;
  List<String> dropdown;
  String? PCS;
  String? PCSleft;
  String? POINTs;
  String? UNIT;
  String? Area;
  String? FORMULA;
  String? RESULTFORMAT;
  String? GAP;
  List<String>? GAPnameList;
  Function(String) GAPnamePick;
  String? GAPname;
  @override
  State<_topboxfull> createState() => __topboxfullState();
}

class __topboxfullState extends State<_topboxfull> {
  String show = '';
  String show2 = '';
  @override
  Widget build(BuildContext context) {
    Function _outfn = widget.outfn;
    Function(String p1) _outfn2 = widget.GAPnamePick;
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Container(
                height: 38,
                width: 100,
                color: Colors.blueGrey,
                child: const Center(
                  child: Text('FINAL'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              EasyDropDown(
                borderRaio: 0,
                imgpath: 'assets/icons/icon-down_4@3x.png',
                listdropdown: widget.dropdown,
                onChangeinside: (d) {
                  setState(() {
                    show = d;
                    _outfn(d);
                  });
                },
                value: show,
                height: 38,
                width: 200,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 38,
                width: 100,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          'POINTs',
                          style: TxtStyle(
                            color: Colors.black,
                            // fontSize: 12
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Expanded(flex: 1, child: Text(widget.POINTs ?? '')),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              SizedBox(
                height: 38,
                width: 125,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Text('TOTAL SAMPLE',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(flex: 1, child: Text(widget.PCS ?? '')),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 38,
                width: 125,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Text('REMAINED SAMMPLE',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(flex: 1, child: Text(widget.PCSleft ?? '')),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 38,
                width: 125,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text('UNIT',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(flex: 2, child: Text(widget.UNIT ?? '')),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 38,
              //   width: 50,
              //   child: EasyDropDown(
              //     listdropdown: widget.GAPnameList ?? [''],
              //     onChangeinside: (v) {
              //       setState(() {
              //         show2 = v;
              //         _outfn2(v);
              //       });
              //       // print(v);
              //       // widget.GAPnamePick!(v);
              //     },
              //     value: show2,
              //     width: 50,
              //     height: 38,
              //   ),
              // ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              SizedBox(
                height: 38,
                width: 100,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text('FORMAT',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(flex: 1, child: Text(widget.RESULTFORMAT ?? '')),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 38,
                width: 100,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Text('Area',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Text(
                          widget.Area ?? '',
                          style: TextStyle(fontSize: 10),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 38,
                width: 125,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Text('FORMULA',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Text(
                          widget.FORMULA ?? '',
                          style: TextStyle(fontSize: 10),
                        )),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 38,
              //   width: 100,
              //   child: Row(
              //     children: [
              //       const Expanded(
              //           flex: 1,
              //           child: Text('',
              //               style: TxtStyle(
              //                 color: Colors.black,
              //                 // fontSize: 12
              //                 fontWeight: FontWeight.bold,
              //               ))),
              //       Expanded(flex: 1, child: Text(widget.GAP ?? '')),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class _tabtableB2 extends StatelessWidget {
  _tabtableB2({
    Key? key,
    this.value,
    this.txtsize,
    this.txtcolor,
    this.height,
  }) : super(key: key);
  List<INSDATA>? value;
  double? txtsize;
  Color? txtcolor;
  double? height;

  @override
  Widget build(BuildContext context) {
    List<INSDATA> _value = value ?? [];
    return SizedBox(
      child: Column(
        children: [
          for (int i = 0; i < _value.length; i++)
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V1 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V2 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _tabtableB3 extends StatelessWidget {
  _tabtableB3({
    Key? key,
    this.value,
    this.txtsize,
    this.txtcolor,
    this.height,
  }) : super(key: key);
  List<INSDATA>? value;
  double? txtsize;
  Color? txtcolor;
  double? height;

  @override
  Widget build(BuildContext context) {
    List<INSDATA> _value = value ?? [];
    return SizedBox(
      child: Column(
        children: [
          for (int i = 0; i < _value.length; i++)
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V5 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V1 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V2 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V3 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V4 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _tabtableB4 extends StatefulWidget {
  _tabtableB4({
    Key? key,
    this.value,
    this.txtsize,
    this.txtcolor,
    this.height,
    this.VAL1,
    this.VAL2,
    this.Aear,
    this.FORMULA,
  }) : super(key: key);
  List<INSDATA>? value;
  double? txtsize;
  Color? txtcolor;
  double? height;

  String? VAL1;
  String? VAL2;
  String? Aear;
  String? FORMULA;

  @override
  State<_tabtableB4> createState() => _tabtableB4State();
}

class _tabtableB4State extends State<_tabtableB4> {
  @override
  Widget build(BuildContext context) {
    List<INSDATA> _value = widget.value ?? [];
    return SizedBox(
        child: Row(children: [
      Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 80,
                        color: Colors.green,
                        child: const Center(
                          child: Text("FORMULA"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: 125,
                      color: Colors.blue,
                      child: Center(
                        child: Text(widget.FORMULA ?? ''),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 80,
                        color: Colors.green,
                        child: const Center(
                          child: Text("W1 (g)"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: 95,
                      color: Colors.blue,
                      child: Center(
                        child: Text(widget.VAL1 ?? ''),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 60,
                        color: Colors.orange,
                        child: const Center(
                          child: Text(''),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 80,
                        color: Colors.green,
                        child: const Center(
                          child: Text("W2 (g)"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: 95,
                      color: Colors.blue,
                      child: Center(
                        child: Text(widget.VAL2 ?? ''),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 60,
                        color: Colors.orange,
                        child: const Center(
                          child: Text(""),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 250,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 80,
                        color: Colors.green,
                        child: const Center(
                          child: Text("Area"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      // color: Colors.blue,
                      child: Container(
                        height: 62,
                        // color: Colors.blue.shade300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ComInputText(
                              isNumberOnly: true,
                              isEnabled: false,
                              width: 100,
                              height: 40,
                              isContr: true,
                              fnContr: (input) {
                                // setState(() {
                                //   P2BALANCEBODYCWVAR
                                //       .iscontrol = input;
                                // });
                              },
                              sValue: widget.Aear ?? '',
                              returnfunc: (String s) {
                                if (widget.Aear != null) {
                                  widget.Aear = s;
                                }
                              },
                            ),
                            Text("cm2")
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      )
    ]));
  }
}
