import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonapi/model/loadData.dart';

Future<LoadData> apiCall() async {
  final response = await http.get(
      'https://raw.githubusercontent.com/alimcevik/jsonapi/master/api.json');
      //'http://jsonplaceholder.typicode.com/users/1');
  if (response.statusCode == 200) {
    return LoadData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Json API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<LoadData>(
        future: apiCall(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.data.username != null && snapshot.data.email != null) {
            return Container(
                child: Center(
                    child: Text(
              "Kullanıcı Adı: ${snapshot.data.username} \n" +
                  "E Posta: ${snapshot.data.email}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.orange),
            )));
          } else {
            Center(child: Text('Yükleniyor'));
          }
        },
      ),
    );
  }
}