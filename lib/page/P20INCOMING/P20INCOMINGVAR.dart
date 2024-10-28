import '../../bloc/BlocEvent/20-02-INCOMINGGETLIST.dart';
import '../../widget/box/05-inputdata.dart';

class P20INCOMINGVAR {
  //ORDER
  static bool iscontrol = false;
  static String ORDER = '';

  static int ItemNow = 0;

  static String MATIN = "";
  static String POIN = "";
  //

  static String SEQ = "";
  static String CPMAT = "";
  static String FGMAT = "";
  static String QTYT = "";
  static String UNIT = "";
  static String CUSTNA = "";
  static String PARTNA = "";
  static String PARTNO = "";
  static String PROC = "";
  static String CUSLOTNO = "";
  static String FG_CHARG = "";
  static String CUST_FULLNM = "";
}

class P20INCOMINGVAR_INPROCESSBOX {
  //ORDER
  static bool undercontrol = false;
  static String DATAINPUT = '';

  static List<datainwait> datainlist = [];
  static List<List<datainwait>> setofdatainlist = [];

  static List<INCOMINGGETLISTclass> itemlistbuffer = [];

  static String INSTRU = '';
}
