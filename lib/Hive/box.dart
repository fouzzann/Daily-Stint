import 'package:daily_stint_2/Hive/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes{
  static Box<Model> getData()=>Hive.box<Model>('model');
}
