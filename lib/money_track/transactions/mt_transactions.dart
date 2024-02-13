import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/Hive/mt_db/mt_category_db.dart';
import 'package:daily_stint_2/Hive/mt_db/mt_transacrtion_db.dart';
import 'package:daily_stint_2/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class MtTransaction extends StatelessWidget {
  const MtTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshaUI();
    return Scaffold(
      backgroundColor: Color(0xFFE6D7F1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MyHome()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF563267),
        title: Text(
          'Transactions',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListNotifier,
        builder: (BuildContext ctx, List<TransactionsModel> newList, Widget? _) {
          if (newList.isEmpty) {
            return Center(
              child: Text(
                'No transactions available.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black38),
              ),
            );
          } else {
            return ListView.separated(
              padding: EdgeInsets.all(10),
              itemBuilder: (ctx, index) {
                final _value = newList[index];
                return Stack(
                  children: [
                    Container(
                      child: Slidable(
                        startActionPane: ActionPane(
                          motion: StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (ctx) {
                                TransactionDB.instance.deleteTransaction(_value.id!);
                              },
                              icon: Icons.delete,
                              backgroundColor: Colors.red,
                              label: 'DELETE',
                            )
                          ],
                        ),
                        key: Key(_value.id!),
                        child: Card(
                          elevation: 7,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 50,
                              child: Text(
                                parseDate(_value.date),
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: _value.type == CategoryType.income ? Colors.green : Colors.red,
                            ),
                            title: Text('RS = ${_value.amount}'),
                            subtitle: Text(_value.Category.name),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (ctx, index) {
                return SizedBox(
                  height: 5,
                );
              },
              itemCount: newList.length,
            );
          }
        },
      ),
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitDate = _date.split(' ');
    return '${_splitDate.last}\n${_splitDate.first}';
    //  '${date.day}\n${date.month}';
  }
}
