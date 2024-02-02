
import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/welcomePg/splashcreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

 const Save_Key_Name = 'isLoggedIn';
 void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   var directory = await getApplicationDocumentsDirectory();
   Hive.init(directory.path);
   Hive.registerAdapter(ModelAdapter());
   await Hive.openBox<Model>('model');
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
        home: splashScreen(),
      ),
    );
  }
}

