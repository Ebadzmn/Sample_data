import 'package:flutter/material.dart';

class Paid extends StatefulWidget {
  const Paid({super.key});

  @override
  State<Paid> createState() => _PaidState();
}

class _PaidState extends State<Paid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You are Paid User'),
      ),
    );
  }
}
