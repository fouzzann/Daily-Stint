import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/Hive/mt_db/mt_category_db.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

ValueNotifier<CategoryType> selectedCategoryNotifier = ValueNotifier(CategoryType.income);

Future<void>showCategoryAddPopup(BuildContext context)async{
  final _nameEditingController = TextEditingController();
  //  final _nameEditingController = TextEditingController();

  showDialog(
    context: context,
    builder: (ctx){
      return SimpleDialog(
        title: Text('Add Category'),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)
            ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller:_nameEditingController ,
                  decoration: 
                  InputDecoration(border: InputBorder.none,
                  hintText: 'Category Name'
                  ),
                  
                ),
              ),
              ),
          ),
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Row(
        children: [
          RadioButton(title: 'Income', type: CategoryType.income),
          RadioButton(title: 'Expense', type: CategoryType.expense),
        ],
       ),
     ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: ElevatedButton(onPressed: (){
            final _name = _nameEditingController.text;
            if(_name.isEmpty){
              return;
            }
            final _type = selectedCategoryNotifier.value;
            final _category = CategoryModel(
              name: _name,
               type: _type,
                id: DateTime.now().microsecondsSinceEpoch.toString()
                );
                CategoryDB.instance.insertCategory(_category);
                Navigator.of(ctx).pop();
           }, 
           child: Text('Add'), 
           ),
         )
        ],
      );
    },);
}
class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
   RadioButton({
   super.key,
  required this.title,
  required this.type
  });


  CategoryType? _type;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedCategoryNotifier,
           builder: (BuildContext ctx, CategoryType newCategory, Widget?_){
            
            return Radio<CategoryType>(
          value: type,
         groupValue: selectedCategoryNotifier.value,
          onChanged: (value){
            if(value == null){
              return;
            }
            selectedCategoryNotifier.value = value;
            selectedCategoryNotifier.notifyListeners();
           
          },
      
          );
           }), 
        Text(title)
      ],
    );

  }
}


