import 'package:daily_stint_2/Hive/model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

const TRANSACTION_DB_NAME = 'transaction-db';

abstract class TransactionDbFunction {
  Future<void> addTransaction(TransactionsModel obj);
  Future<List<TransactionsModel>> getAllTransactions();
  Future<void> deleteTransaction(String id);
}

class TransactionDB implements TransactionDbFunction {
  TransactionDB._internal();

  static final TransactionDB instance = TransactionDB._internal();

  ValueNotifier<List<TransactionsModel>> transactionListNotifier =
      ValueNotifier<List<TransactionsModel>>([]);

  @override
  Future<void> addTransaction(TransactionsModel obj) async {
    final _db = await Hive.openBox<TransactionsModel>(TRANSACTION_DB_NAME);
    await _db.put(obj.id, obj);
    await refresh();
  }

  Future<void> refresh() async {
    final _list = await getAllTransactions();
    _list.sort((first, second) => second.date.compareTo(first.date));
    transactionListNotifier.value = _list;
  }

  @override
  Future<List<TransactionsModel>> getAllTransactions() async {
    final _db = await Hive.openBox<TransactionsModel>(TRANSACTION_DB_NAME);
    return _db.values.toList();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final _db = await Hive.openBox<TransactionsModel>(TRANSACTION_DB_NAME);
    await _db.delete(id);
     refresh();
  }
}
