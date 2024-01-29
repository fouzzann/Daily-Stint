import 'package:flutter/material.dart';

class Hydrate extends StatefulWidget {
  const Hydrate({super.key});

  @override
  State<Hydrate> createState() => _HydrateState();
}

class _HydrateState extends State<Hydrate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
      )
      );
  }
}