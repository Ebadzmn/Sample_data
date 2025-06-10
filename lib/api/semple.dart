import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'model.dart';

class Semple extends StatefulWidget {
  const Semple({super.key});

  @override
  State<Semple> createState() => _SempleState();
}

class _SempleState extends State<Semple> {

  List<Item> posts = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPost();
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
            child: ListView.builder(itemCount: posts.length,itemBuilder: (context , index) {
              final item = posts[index];
              return ListTile(
                title: Text(item.title),
              );
            }),
          )
        ],
      ),
    );
  }



  Future<List<Item>> fetchPosts() async {
    final dio = Dio();
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Item.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch posts: $e');
    }
  }

  Future <void> _loadPost() async {
    try{
      final Posts = await fetchPosts();
      setState(() {
        posts = Posts;
      });
    } catch (e){
      print('$e');
    }
  }



  // Future <void> _getList() async {
  //   Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  //   Response response = await get(uri);
  //   if (response.statusCode == 200) {
  //     final List<dynamic> decodedData = jsonDecode(response.body);
  //     setState(() {
  //       getList = decodedData.map((item) => Item.fromJson(item)).toList();
  //     });
  //   } else {
  //     print('Error');
  //   }
  // }








}
