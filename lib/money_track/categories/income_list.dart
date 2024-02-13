import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/Hive/mt_db/mt_category_db.dart';
import 'package:flutter/material.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

   @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryListListener,
      builder: (BuildContext ctx , List<CategoryModel> newList, Widget? _){
        return ListView.separated(
      padding: EdgeInsets.all(10),
      itemBuilder: (ctx,index){
        final category = newList[index];
        Text('Icome Category $index');
       return Container(height: 100,
         child: Card(color: const Color.fromARGB(255, 211, 177, 218),
          elevation: 5,
            child: ListTile(
              title:Text(category.name),
              trailing: IconButton(onPressed: (){
                CategoryDB.instance.deleteCategory(category.id);
              }, icon: Icon(Icons.delete,
              color: const Color.fromARGB(255, 212, 96, 88),)),
            ),
          ),
       ); 
      },
       separatorBuilder: (ctx,intex){
        return SizedBox(
          height: 10,
        );
       },
        itemCount: newList.length
        );
      }
      );

  }
}