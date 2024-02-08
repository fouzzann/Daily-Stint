import 'package:flutter/material.dart';

class MtTransaction extends StatefulWidget {
  const MtTransaction({super.key});

  @override
  State<MtTransaction> createState() => _MtTransactionState();
}

class _MtTransactionState extends State<MtTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Color(0xFF563267),
      title: Text('Transactions',
      style: TextStyle(
        color: Colors.white
      ),),
      centerTitle: true,
    ),
      body: Center(child: Text('')), 
    );
  }
}