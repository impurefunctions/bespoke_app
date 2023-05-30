import 'package:bespoke_app/utils/api/index.dart';
import 'package:bespoke_app/widgets/widgets.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

import '../../constants/appstrings.dart';
import '../../utils/theme/theme.dart';
import '../domain/index.dart';

class TransactionsScreen extends StatefulWidget {
  final String token;
  const TransactionsScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {

  int _selectedSegment = 0;


  @override
  void initState() {
    // TODO: implement initState

    // BaseAPIService _mainApiService = MainApiService();
    getAllTransactionsOffline(); //TODO: Change when API is connected


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: const HomeAppBarWidget(
          title: 'Transactions',
          canGoBack: true,
        ),
      ),
      body: StreamBuilder<List<TransactionModel>>(
          stream: getAllTransactionsOffline().asStream(),
          builder: (context, transactions) {
            if (transactions.connectionState == ConnectionState.done) {
              if (transactions.hasData) {
                return Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                      child: CustomSlidingSegmentedControl<int>(
                        initialValue: _selectedSegment,
                        padding: 6,
                        children: {
                          0: Container(
                            // color: Colors.red,
                            child: Text(
                              'All',
                              maxLines: 1,
                              softWrap: false,
                              style: segmentedButtonFont,
                            ),
                          ),
                          1: Container(
                            child: Text(
                              'Paid',
                              maxLines: 1,
                              softWrap: false,
                              style: segmentedButtonFont,
                            ),
                          ),
                          2: Container(
                            child: Text(
                              'No Paid',
                              maxLines: 1,
                              softWrap: false,
                              style: segmentedButtonFont,
                            ),
                          ),

                        },
                        decoration: BoxDecoration(
                          color: (context).isDarkMode
                              ? Colors.white.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                        thumbDecoration: BoxDecoration(
                          color: (context).isDarkMode
                              ? Colors.white.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                        innerPadding: const EdgeInsets.all(0),
                        isStretch: true,
                        height: double.infinity,
                        onValueChanged: (groupValue) {
                          setState(() {
                            _selectedSegment = groupValue;
                          });
                          //TODO apply the filter change
                        },
                      ),
                    ),

                    /// const Spacer(flex: 1),
                    Expanded(
                      child: ListView(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(16),
                          children: [
                            PaginatedDataTable(
                              showCheckboxColumn: false,
                              header: const Text('Recent Transactions'),
                              columns: const [
                                DataColumn(label: Text('Type')),
                                DataColumn(label: Text('Paid')),
                                DataColumn(label: Text('Amount')),
                                DataColumn(label: Text('Date')),
                              ],
                              source: _DataSource(context, filterTransactions(transactions.data!) ),
                            )
                          ]),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: Text('No transactions found'),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }


  Future<List<TransactionModel>> getAllTransactions() async {
    final ApiBaseHelper helper = ApiBaseHelper();
    final String token = widget.token;
    try {
      final transactionsList =
      await helper.get(allTransactionsAPI, token);
      final transactions = transactionsList.map((e) {
        return TransactionModel.fromJson(e);
      }).toList();
      return transactions;
    } catch (e) {
      // handle the error here, e.g. log it or re-throw it
      rethrow;
    }
  }


  Future<List<TransactionModel>> getAllTransactionsOffline() async {
    return [
      TransactionModel(
          serviceId: '1',
          feeType: "Charge",
          userId: '1',
          paymentDate: DateTime.now().subtract(Duration(days: 2)),

          isPaid: true,
          amount: 1000, paymentsMade: []),
TransactionModel(
          serviceId: '1',
          feeType: "Fine",
          userId: '1',
          paymentDate: DateTime.now().subtract(Duration(days: 1)),
          isPaid: false,
          amount: 1000, paymentsMade: []),

    ];
  }

  List<TransactionModel> filterTransactions(List<TransactionModel> transactions) {
    switch (_selectedSegment) {
      case 0:
        return transactions;
      case 1:
        return transactions.where((element) => element.isPaid == true).toList();
      case 2:
        return transactions.where((element) => element.isPaid == false).toList();
      default:
        return transactions;
    }
  }


}

class _DataSource extends DataTableSource {
  final BuildContext context;
  final List<TransactionModel> _rows;
  _DataSource(this.context, this._rows);

  //late List<_Row> _rows;
  int _selectedCount = 0;
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
    // turnOffGrouping: true,
    decimalDigits: 2,
    symbol: 'P ',

  );

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      selected: false,
      onSelectChanged: (value) {
        /*if (row.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }*/
      },
      cells: [
        DataCell(Text(row.feeType)),
        DataCell(CircleAvatar(
          backgroundColor: row.isPaid == true
              ? Colors.greenAccent
              :  Colors.redAccent,

          radius: 10,
        )),

        DataCell(Text(_formatter.format(row.amount!.toString()))),
        DataCell(Text(row.paymentDate!.toString())),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
