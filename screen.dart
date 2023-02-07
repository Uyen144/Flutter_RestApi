import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_rest_api/main_data.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class Screen extends StatefulWidget {
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late final User user;
  late final GetData _getData;
  final loginName = TextEditingController();
  final password = TextEditingController();
  late Future<User> futureUser;
  late Future<GetData> futureGetData;
  //late List listData;

//GET
//make network request
  Future<http.Response> fetchData() {
    return http.get(Uri.parse(
        'http://priceboard3.fpts.com.vn/sgcore/api/gateway/v1/account/login'));
  }

//REQUEST
//convert the response to Object
  Future<User> fetchUser() async {
    var headers = {'Content-Type': 'application/json'}; //phai co header
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://priceboard3.fpts.com.vn/sgcore/api/gateway/v1/account/login'));
    request.body = json.encode({"LoginName": loginName.text, "Password": password.text});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      user = User.fromJson(jsonDecode(await response.stream.bytesToString()));
      return user;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    //futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100, left: 50, right: 50),
        child: Column(
          children: [
            TextField(
              controller: loginName,
              decoration: InputDecoration(hintText: 'login name'),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: 'password'),
            ),
            TextButton(
              child: Text('Login'),
              onPressed: () async {
               await fetchUser();
                if (user.Code == 0) {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(

                          data1: user.Data,
                          //getData1: _getData.Data,
                        ),
                      ),
                    );
                  }
                } else {
                  DiaLog();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DiaLog extends StatelessWidget {
  const DiaLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: Text(
          'Notification',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 25),
        ),
        content: Text(
          'Login Fail',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          TextButton(
            child: Text(
              'OK',
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.blue, fontSize: 25),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
