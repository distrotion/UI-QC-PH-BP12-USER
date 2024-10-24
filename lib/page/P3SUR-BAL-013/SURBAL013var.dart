import 'dart:async';

import '../../model/model.dart';
import '../../widget/QCWIDGET/consolelayout.dart';

class SURBAL013var {
  static bool iscontrol = false;
  static String PO = '';
  static String CP = '';
  static String QTY = '';
  static String PROCESS = '';
  static String CUSLOT = '';
  static String TPKLOT = '';
  static String FG = '';
  static String CUSTOMER = '';
  static String PART = '';
  static String PARTNAME = '';
  static String MATERIAL = '';
  static List<String> ItemPick = [''];
  static String PCS = '';
  static String PCSleft = '';
  static String POINTs = '';
  static String UNIT = '';
  static String INTERSEC = '';
  static String RESULTFORMAT = '';
  static String Area = '';
  static String GAP = '';
  static String GAPname = '';
  static String GAPnamePick = '';
  static List<String> GAPnameList = [''];
  static List<INSDATA> preview = [];
  static List<INSDATA> confirmdata = [];
  static List<INSDATA> ITEMleftUNIT = [];
  static List<INSDATA> ITEMleftVALUE = [];
  static late Timer DHtimer;

  static String VAL1 = '';
  static String VAL2 = '';
  static String VAL3 = '';
  static String VAL4 = '';
  static String AearI = '';

  static String shape = '';

  static String FORMULA = '';
  static String FORMULAI = '';
  static String PREANS = '';
  static String ANS = '';
  //
  static String ItemPickSELECT = '';

  static String SelectAEAR = '';
  static String test = '';

  static String RS_HI = '';
  static String RS_L1 = '';
  static String RS_L2 = '';

  static String CYNH_HI = '';
  static String CYNH_DI = '1.5';

  static String CYWH_HI = '';
  static String CYWH_DIOUT = '3.054';
  static String CYWH_DIIN = '2.44';

  static String ARAE_ANS = '';

  static String REFLOT = '';
}

class SURBAL013SCHEMA {
  SURBAL013SCHEMA({
    this.UPDATE = '',
    this.PO = '',
    this.CP = '',
    this.QTY = '',
    this.PROCESS = '',
    this.CUSLOT = '',
    this.TPKLOT = '',
    this.FG = '',
    this.CUSTOMER = '',
    this.PART = '',
    this.PARTNAME = '',
    this.MATERIAL = '',
    required this.ItemPick,
    required this.ItemPickcode,
    this.PCS = '',
    this.PCSleft = '',
    this.POINTs = '',
    this.UNIT = '',
    this.INTERSEC = '',
    this.RESULTFORMAT = '',
    this.GRAPHTYPE = '',
    this.GAP = '',
    this.GAPname = '',
    this.GAPnamePick = '',
    this.Area = '',
    this.VAL1 = '',
    this.VAL2 = '',
    this.VAL3 = '',
    this.VAL4 = '',
    this.AearI = '',
    this.FORMULAI = '',
    this.FORMULA = '',
    this.ANS = '',
    this.shape = '',
    required this.GAPnameList,
    required this.preview,
    required this.confirmdata,
    required this.ITEMleftUNIT,
    required this.ITEMleftVALUE,
    this.REFLOT = '',
  });
  String UPDATE;
  String PO;
  String CP;
  String QTY;
  String PROCESS;
  String CUSLOT;
  String TPKLOT;
  String FG;
  String CUSTOMER;
  String PART;
  String PARTNAME;
  String MATERIAL;
  List<String> ItemPick;
  List<ITEMSET> ItemPickcode;
  String PCS;
  String PCSleft;
  String POINTs;
  String UNIT;
  String INTERSEC;
  String RESULTFORMAT;
  String GRAPHTYPE;
  String GAP;
  String GAPname;
  String GAPnamePick;
  String Area;

  String VAL1;
  String VAL2;
  String VAL3;
  String VAL4;
  String AearI;
  String FORMULAI;
  String FORMULA;
  String ANS;
  String shape;

  List<String> GAPnameList;
  List<INSDATA> preview;
  List<INSDATA> confirmdata;
  List<INSDATA> ITEMleftUNIT;
  List<INSDATA> ITEMleftVALUE;

  String REFLOT;
}
