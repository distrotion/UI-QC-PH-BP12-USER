import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/11-GRAPHMASTER.dart';
import '../../bloc/Cubit/Rebuild.dart';
import '../../data/global.dart';

import '../../model/model.dart';
import '../../widget/common/Loading.dart';
import 'MASTERGRAPHconsole.dart';
import 'MASTERGRAPHvar.dart';

late BuildContext MASTERGRAPHContexttable;

String _searchResult = '';
late BuildContext MASTERGRAPHvarContexttable;

class MASTERGRAPHmain extends StatefulWidget {
  MASTERGRAPHmain({Key? key, this.data}) : super(key: key);
  List<dataset>? data;

  @override
  _MASTERGRAPHmainState createState() => _MASTERGRAPHmainState();
}

class _MASTERGRAPHmainState extends State<MASTERGRAPHmain> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    // plantcre = 'MASTERGRAPHvar';
    // context.read<DROPDOWN_BLOCK>().add(DROPDOWN_GET());
    context.read<GRAPHMASTER_Bloc>().add(GRAPHMASTER_READ());
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MASTERGRAPHContexttable = context;
    MASTERGRAPHvarContexttable = context;
    final _MyData _data = _MyData(context, widget.data ?? []);

    void _sort<T>(Comparable<T> Function(dataset d) getField, int columnIndex,
        bool ascending) {
      _data._sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

    return SingleChildScrollView(
      child: SizedBox(
        width: 1200,
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.search),
                title: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: (value) {
                      setState(() {
                        _searchResult = value;
                      });
                    }),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      controller.clear();
                      _searchResult = '';
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: 1200,
                child: PaginatedDataTable(
                  source: _data,
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('MASTERGRAPHvar GRAPH'),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // context
                              //     .read<MASTERGRAPHvarDataSetBloc>()
                              //     .add(GetDataPressed());

                              onLoadingType01(
                                  context,
                                  () {},
                                  context
                                      .read<GRAPHMASTER_Bloc>()
                                      .add(GRAPHMASTER_READ()));
                              // BlocProvider.of<BlocPageRebuild>(context)
                              //     .rebuildPage();
                            },
                            child: const Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              MASTERGRAPHvar.nc = true;
                              MASTERGRAPHvar.iscon01 = true;
                              MASTERGRAPHvar.con01 = '';
                              MASTERGRAPHvar.con02 = '';
                              MASTERGRAPHvar.GAP01 = '';
                              MASTERGRAPHvar.GAP02 = '';
                              MASTERGRAPHvar.GAP03 = '';
                              MASTERGRAPHvar.GAP04 = '';
                              MASTERGRAPHvar.GAP05 = '';
                              MASTERGRAPHvar.GAP06 = '';
                              MASTERGRAPHvar.GAP07 = '';
                              MASTERGRAPHvar.GAP08 = '';
                              MASTERGRAPHvar.GAP09 = '';
                              MASTERGRAPHvar.GAP10 = '';
                              MASTERGRAPHvar.GAP11 = '';
                              MASTERGRAPHvar.GAP12 = '';
                              MASTERGRAPHvar.GAP13 = '';
                              MASTERGRAPHvar.GAP14 = '';
                              MASTERGRAPHvar.GAP15 = '';
                              MASTERGRAPHvar.GAP16 = '';
                              MASTERGRAPHvar.GAP17 = '';
                              MASTERGRAPHvar.GAP18 = '';
                              MASTERGRAPHvar.GAP19 = '';
                              MASTERGRAPHvar.GAP20 = '';
                              MASTERGRAPHconsoleBox();
                            },
                            // style: ButtonStyle(
                            //   backgroundColor:
                            //       MaterialStateProperty.all(Colors.red),
                            // ),

                            child: const Text("NEW"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  columns: [
                    DataColumn(
                        label: const Text('ID'),
                        onSort: (int columnIndex, bool ascending) => _sort<num>(
                            (dataset d) => d.id, columnIndex, ascending)),
                    DataColumn(
                        label: const Text('UID'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (dataset d) => d.f01, columnIndex, ascending)),
                    DataColumn(
                        label: const Text('NAME'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (dataset d) => d.f02, columnIndex, ascending)),
                    // DataColumn(
                    //     label: const Text('Field03'),
                    //     onSort: (int columnIndex, bool ascending) =>
                    //         _sort<String>(
                    //             (dataset d) => d.f03, columnIndex, ascending)),
                    // DataColumn(
                    //     label: const Text('Field04'),
                    //     onSort: (int columnIndex, bool ascending) =>
                    //         _sort<String>(
                    //             (dataset d) => d.f04, columnIndex, ascending)),

                    DataColumn(
                        label: const Text('Field05'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (dataset d) => d.f05, columnIndex, ascending)),
                  ],
                  columnSpacing: 100,
                  horizontalMargin: 10,
                  rowsPerPage: 5,
                  sortColumnIndex: _sortColumnIndex,
                  sortAscending: _sortAscending,
                  showCheckboxColumn: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// The "soruce" of the table
class _MyData extends DataTableSource {
  // Generate some made-up data
  final BuildContext context;
  late List<dataset> _data;
  late List<dataset> input;
  List<dataset> _data_exp = [];

  int _selectedCount = 0;
  _MyData.empty(this.context) {
    _data = [];
  }
  _MyData(this.context, this.input) {
    _data = input;
    _data_exp = [];

    for (int i = 0; i < _data.length; i++) {
      if (_data[i].f01.toLowerCase().contains(_searchResult) ||
          _data[i].f02.toLowerCase().contains(_searchResult) ||
          _data[i].f03.toLowerCase().contains(_searchResult) ||
          _data[i].f04.toLowerCase().contains(_searchResult) ||
          _data[i].f05.toLowerCase().contains(_searchResult)) {
        _data_exp.add(_data[i]);
      }
    }
  }

  void _sort<T>(Comparable<T> Function(dataset d) getField, bool ascending) {
    _data_exp.sort((dataset a, dataset b) {
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data_exp.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final dataset data = _data_exp[index];

    return DataRow.byIndex(
        index: index,
        selected: data.selected,
        onSelectChanged: (value) {
          if (data.selected != value) {
            //function
          }
        },
        cells: [
          DataCell(Text(data.id.toString())),
          DataCell(Text(data.f01)),
          DataCell(Text(data.f02)),
          // DataCell(Text(data.f03)),
          // DataCell(Text(data.f04)),
          DataCell(Row(
            children: [
              InkWell(
                onTap: () {
                  MASTERGRAPHvar.nc = false;
                  MASTERGRAPHvar.con01 = data.f01;
                  MASTERGRAPHvar.con02 = data.f02;
                  MASTERGRAPHvar.GAP01 = data.f03;
                  MASTERGRAPHvar.GAP02 = data.f04;
                  MASTERGRAPHvar.GAP03 = data.f05;
                  MASTERGRAPHvar.GAP04 = data.f06;
                  MASTERGRAPHvar.GAP05 = data.f07;
                  MASTERGRAPHvar.GAP06 = data.f08;
                  MASTERGRAPHvar.GAP07 = data.f09;
                  MASTERGRAPHvar.GAP08 = data.f10;
                  MASTERGRAPHvar.GAP09 = data.f11;
                  MASTERGRAPHvar.GAP10 = data.f12;
                  MASTERGRAPHvar.GAP11 = data.f13;
                  MASTERGRAPHvar.GAP12 = data.f14;
                  MASTERGRAPHvar.GAP13 = data.f15;
                  MASTERGRAPHvar.GAP14 = data.f16;
                  MASTERGRAPHvar.GAP15 = data.f17;
                  MASTERGRAPHvar.GAP16 = data.f18;
                  MASTERGRAPHvar.GAP17 = data.f19;
                  MASTERGRAPHvar.GAP18 = data.f20;
                  MASTERGRAPHvar.GAP19 = data.f21;
                  MASTERGRAPHvar.GAP20 = data.f22;
                  MASTERGRAPHconsoleBox();
                  // print(data.f01);
                },
                child: const Icon(
                  Icons.edit,
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     print(data.f02);
              //   },
              //   child: const Icon(
              //     Icons.delete,
              //   ),
              // )
            ],
          )),
        ]);
  }
}
