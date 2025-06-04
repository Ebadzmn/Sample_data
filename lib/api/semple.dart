import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'model.dart';

class Semple extends StatefulWidget {
  const Semple({super.key});

  @override
  State<Semple> createState() => _SempleState();
}

class _SempleState extends State<Semple> {

  List<Item> getList = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: getList.length,itemBuilder: (context , index) {
              final item = getList[index];
              return ListTile(
                title: Text(item.title),
              );
            }),
          )
        ],
      ),
    );
  }
  Future <void> _getList() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> decodedData = jsonDecode(response.body);
      setState(() {
        getList = decodedData.map((item) => Item.fromJson(item)).toList();
      });
    } else {
      print('Error');
    }
  }
}
