

import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/money_track/categories/income_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

const CATEGORY_DB_NAME = 'category-database';
abstract class CategoryDbFunctions{
  Future <List<CategoryModel>> getCategories();
  Future <void> insertCategory(CategoryModel value);
  Future <void> deleteCategory(String CategoryID);
}
class CategoryDB implements CategoryDbFunctions{

  CategoryDB._internal();
  static CategoryDB instance = CategoryDB._internal();
  factory CategoryDB(){
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeCategoryListListener = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryListListener = ValueNotifier([]);
  @override
  Future<void> insertCategory(CategoryModel value) async {
   final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
   _categoryDB.put(value.id,value);
    refreshaUI();
  }
  
  @override
  Future<List<CategoryModel>> getCategories() async{
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
   return _categoryDB.values.toList();
  
  }
  Future <void> refreshaUI() async{
    final _allCategories = await getCategories();
    incomeCategoryListListener.value.clear();
    expenseCategoryListListener.value.clear();
    Future.forEach(_allCategories, (CategoryModel category) {
      if(category.type == CategoryType.income){
       incomeCategoryListListener.value.add(category);
      }else{
        expenseCategoryListListener.value.add(category);
      }
    },
    );
    incomeCategoryListListener.notifyListeners();
    expenseCategoryListListener.notifyListeners();
  }
  
  @override
  Future<void> deleteCategory(String CategoryID)async{
   final _categoryDB =  await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
   await _categoryDB.delete(CategoryID);
   refreshaUI();
  }
}