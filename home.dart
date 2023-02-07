import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_rest_api/main_data.dart';
import 'main_data.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  final data data1;

  //final dataGet getData1;

  const Home({
    super.key,
    required this.data1,
    //required this.getData1,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final GetData _getData;
  //GET
  Future<GetData> getRequest() async {
    var headers = {'Authorization': widget.data1.Jwt};

    var request = http.Request(
        'GET',
        Uri.parse(
            'http://priceboard3.fpts.com.vn/sgcore/api/gateway/v1/cache/stock_info/eztrade'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(widget.data1.Jwt);
      _getData =
          GetData.fromJson(jsonDecode(await response.stream.bytesToString()));
      return _getData;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100, right: 50, left: 50),
        child: Column(
          children: [
            Text('Ten nguoi dung: ' + ' ' + widget.data1.ClientName),
            Text('Ma nguoi dung:' + ' ' + widget.data1.ClientCode),
            Text('Ip nguoi dung' + ' ' + widget.data1.IpClient),
            SizedBox(height: 20),
            // FutureBuilder(
            //   future: getRequest(),
            //   builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            //     if (snapshot.data == null) {
            //       return Container(
            //         child: Center(
            //           child: CircularProgressIndicator(),
            //         ),
            //       );
            //     } else {
            //       return ListView.builder(
            //         itemCount: snapshot.data.length,
            //         itemBuilder: (ctx, index) => ListTile(
            //           title: Text(snapshot.data[index].title),
            //           subtitle: Text(snapshot.data[index].body),
            //           contentPadding: EdgeInsets.only(bottom: 20.0),
            //         ),
            //       );
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
