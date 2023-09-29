import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeServices{
  Future<http.Response> getData()async{
    String url='https://jsonplaceholder.typicode.com/posts';

    http.Response response=await http.get(Uri.parse(url));
    return response;
  }
}