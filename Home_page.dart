import 'dart:convert';
// ignore: unused_import
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

String _search;
// ignore: prefer_final_fields
int _offset = 0;
// ignore: always_specify_types
Future<Map> _getGifs() async {
  http.Response response;

   if(_search == null)
   // ignore: prefer_single_quotes
   response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=86NXNild7UDmkZ6ZFPOCGQvANkcKAcjA&limit=20&rating=g");
   else
   // ignore: prefer_single_quotes
   response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=86NXNild7UDmkZ6ZFPOCGQvANkcKAcjA&q=$_search&limit=25&offset=$_offset&rating=g&lang=pt");
 
 return json.decode(response.body);
}

@override
void initState() {
  super.initState();
  // ignore: always_specify_types
  _getGifs().then((map){
print(map);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // ignore: prefer_single_quotes
        title: Image.network("https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
        ),
      );
  }
}

