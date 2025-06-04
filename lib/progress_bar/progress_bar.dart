import 'dart:convert';

import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double _progrssValue = 0.0;

  String jsonData = '{"progress": 0.5}';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateProgressFromJson();
  }

  void updateProgressFromJson () {
    final Map<String ,dynamic> data = json.decode(jsonData);
    setState(() {
      _progrssValue = (data['progress'] as num).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress bar'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Progress: ${(_progrssValue * 100).toStringAsFixed(0)}%"),
            SizedBox(height: 20,),
            LinearProgressIndicator(
              value: _progrssValue,
              minHeight: 20,
              backgroundColor: Colors.grey,
              color: Colors.redAccent,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              setState(() {
                jsonData = '{"progress" : 0.1}';
                updateProgressFromJson();
              });
            }, child: Text('Update Progress'))
          ],
        ),
      ),
    );
  }
}
