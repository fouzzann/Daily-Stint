import 'package:daily_stint_2/Hive/model.dart';
import 'package:daily_stint_2/Hive/mt_db/mt_category_db.dart';
import 'package:daily_stint_2/Hive/mt_db/mt_transacrtion_db.dart';

import 'package:flutter/material.dart';

class AddTransactions extends StatefulWidget {
  static const routeName = 'add-transaction';
  const AddTransactions({super.key});

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {

  DateTime? _selectedDate; 
  CategoryType? _selectedCategoryType;
  CategoryModel ? _selectedCategoryModel;
  String? _categoryID;
  final _purposeTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();
  @override
  void initState() {
   _selectedCategoryType = CategoryType.income;
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xFFE6D7F1),
        body: Column(
          // purpose
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0), 
              child: TextFormField(
                controller: _purposeTextEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Purpose',
                ),
              ),  
            ),
             // amount
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _amountTextEditingController,
                keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                  hintText: 'Amount',
                 )
              ),
              
            ),
             // calender
            
            TextButton.icon(onPressed: () async{
              final _selectedDateTemp = await  showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 30)),
                lastDate: DateTime.now(),
                );
                if(_selectedDateTemp == null ){
                  return ;
                }else{
                  print(_selectedDateTemp.toString());
                  setState(() {
                    _selectedDate = _selectedDateTemp;
                  });
                }
            },
             icon:const Icon(Icons.calendar_today), 
              label: Text( _selectedDate == null? 'Select Date':_selectedDate!.toString()), 
              ),            
               // category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                      value: CategoryType.income,
                       groupValue: _selectedCategoryType,
                        onChanged: (newValue){    
                          setState(() {
                             _selectedCategoryType = CategoryType.income; 
                             _categoryID = null;
                          });    
                                          
                        }
                        ),
                        Text('Income'),
                        ],
                     
                  ),
                   Row(
                    children: [
                      Radio(
                      value: CategoryType.expense,
                       groupValue: _selectedCategoryType,
                        onChanged: (newValue){   
                          setState(() {
                             _selectedCategoryType = CategoryType.expense;
                          });
                                      
                        }
                        ),
                        Text('Expense'), 
                        ],
                     
                  ),
                ],
              ),
               // category Type
               DropdownButton<String>(
                hint: Text('Select Category'),
                value: null,
                items: (
                  _selectedCategoryType ==CategoryType.income?
                   CategoryDB().incomeCategoryListListener:
                    CategoryDB().expenseCategoryListListener
                   ).value.map((e) {
                  return DropdownMenuItem(
                    child: Text(e.name),
                    value: e.id,
                    onTap: (){
                      _selectedCategoryModel = e;
                    },
                    ); 
                }).toList(),
                 onChanged: (selectedValue){
                  print(selectedValue);
                  setState(() {
                    _categoryID = selectedValue;
                  });
                 }
                 ),
                 ElevatedButton(style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF563267)),
                 ),
                  onPressed: (){
                    addTransaction();
                  },
                   child: Text('Submit',
                   style: TextStyle(
                    color: Colors.white
                   ),)
                   )
          ],
        ), 
    ),
    );
  }
  Future <void> addTransaction() async{
    final _puposeText = _purposeTextEditingController.text;
    final _amountText = _amountTextEditingController.text;

    if(_puposeText.isEmpty){
      return;
    }
    if(_amountText.isEmpty){
      return;
    }
    // if(_categoryID == null){
    //   return;
    // }
    if(_selectedDate == null){
      return;

    }
    final _parsedAmount = double.tryParse(_amountText);
    if(_parsedAmount == null){
      return;
    }
    if(_selectedCategoryModel == null){
      return;
    }
    // _selectedDate
    // _selectedCategoryType
    // _categoryID

    final _model = TransactionsModel(
      purpose: _puposeText,
      amount: _parsedAmount,
      date: _selectedDate!,
      type: _selectedCategoryType!,
      Category: _selectedCategoryModel!
    );
         
         await TransactionDB.instance.addTransaction(_model);
         Navigator.of(context).pop();
         TransactionDB.instance.refresh();

  }
  
}  