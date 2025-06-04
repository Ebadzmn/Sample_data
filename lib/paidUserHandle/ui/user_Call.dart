import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampledata/paidUserHandle/ui/free.dart';
import 'package:sampledata/paidUserHandle/ui/paid.dart';

class UserCall extends StatefulWidget {
  const UserCall({super.key});

  @override
  State<UserCall> createState() => _UserCallState();
}

class _UserCallState extends State<UserCall> {

  Future <String> getUserType() async {
    final String response = await rootBundle.loadString('assets/user_file.json');
    final data = json.decode(response);
    return data['user']['type'];
  }
  
  void handleNavigation (BuildContext context) async {
    String userType = await getUserType();
    if (userType == 'paid') {
      Navigator.push(context, MaterialPageRoute(builder: (Context) => Paid()));
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Free()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USER Call'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () => handleNavigation(context), child: Text('Continue')),
      ),
    );
  }
}
