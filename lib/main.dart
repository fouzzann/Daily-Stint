
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/money_track/add_transaction/add_transactios.dart';
import 'package:daily_stint_2/welcome_screen/splashcreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

 const Save_Key_Name = 'isLoggedIn';
 void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   var directory = await getApplicationDocumentsDirectory();
  //  task model 
   Hive.init(directory.path);
   Hive.registerAdapter(ModelAdapter());
   await Hive.openBox<Model>('model');
  // diary model
   Hive.registerAdapter(DrModelAdapter());
   await Hive.openBox<DrModel>('drmodel');
  //  sub task 
  Hive.registerAdapter(SubModelAdapter());
  await Hive.openBox<SubModel>('Submodel');
  // money mannage
  if(!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)){
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  if(!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)){
    Hive.registerAdapter(CategoryModelAdapter());
  }
 // Transactions
  if(!Hive.isAdapterRegistered(TransactionsModelAdapter().typeId)){
    Hive.registerAdapter(TransactionsModelAdapter());
  }
  
  runApp(const DailyStint());
}
class DailyStint extends StatelessWidget {
  const DailyStint({super.key});
  @override
  Widget build(BuildContext context) {   
     return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes:{
          AddTransactions.routeName:(ctx)=>const AddTransactions(),
        } ,
      ),
    );
  }
  
}

