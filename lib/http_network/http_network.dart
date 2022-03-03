import 'dart:convert';
import 'dart:io';

import 'package:example/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class HttpNetwork extends StatefulWidget {
  const HttpNetwork({Key key}) : super(key: key);

  @override
  _HttpNetworkState createState() => _HttpNetworkState();
}

class _HttpNetworkState extends State<HttpNetwork> {

  void _makeRequest() async {
    DialogApp.dialogBodyCustom(context: context, body: CircularProgressIndicator());
    try{
      var response = await http.get(Uri.parse("https://cus-app-as.masterisehomes.com/customer-config-service/v1/view/config/get-all")).timeout(
        Duration(seconds: 30),
        onTimeout: () {
          return http.Response('Error', 500); // Replace 500 with your http code.
        },
      );
      if (response.statusCode == 200) {
        Navigator.pop(context);
        String htmlToParse;
        if (response.headers.containsKey(HttpHeaders.contentTypeHeader) && (ContentType.parse(response.headers[HttpHeaders.contentTypeHeader])).charset == 'utf-8') {
          htmlToParse = response.body;
        } else {
          htmlToParse = utf8.decode(response.body.runes.toList(), allowMalformed: true);
        }
        DialogApp.dialogBodyCustom(
          context: context,
          iconClose: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                HtmlWidget(htmlToParse)
              ],
            ),
          ),
        );
      }
    }catch(e, stackTrace){
      Navigator.pop(context);
      print(e);
      print(stackTrace);
      DialogApp.dialogBodyCustom(
        context: context,
        iconClose: true,
        body: Column(
          children: [
            Text("Error : ${e.toString()}"),
            Container(height: 10, color: Colors.red,),
            Text("stackTrace ${stackTrace.toString()}"),
          ],
        ),
      );
    }
  }


  void _makeRequest2() async {
    // var t = DateTime.now();
    // print('bat dau: $t');
    // try{
    //   var headers = {
    //     'Accept-Language': 'en_US',
    //     // 'Cookie': 'AWSALBTG=gLXlwg3KmzPm5bsbUgKvR57cHwOxxLp2sYH8sqiddFNgYy4b/KynN2Xkh4caP1smpkqti64MNZ1EhivegKKYBFgb0Jqx5t126Ec+1uegAN+6/8GAaot4tDFMTAwtINeelJmWQHr0GC/6DkWT1QVgdOt1An4krpNLPQZI74x7tbiHCPBkkDY=; AWSALBTGCORS=gLXlwg3KmzPm5bsbUgKvR57cHwOxxLp2sYH8sqiddFNgYy4b/KynN2Xkh4caP1smpkqti64MNZ1EhivegKKYBFgb0Jqx5t126Ec+1uegAN+6/8GAaot4tDFMTAwtINeelJmWQHr0GC/6DkWT1QVgdOt1An4krpNLPQZI74x7tbiHCPBkkDY='
    //   };
    //   var request = http.Request('GET', Uri.parse('https://cus-app-as.masterisehomes.com/customer-config-service/v1/view/config/get-all'));
    //
    //   request.headers.addAll(headers);
    //
    //   http.StreamedResponse response = await request.send();
    //
    //   // print('bat dau: $t');
    //   if (response.statusCode == 200) {
    //     print('bat dau 1: $t');
    //     // print(await response.stream.bytesToString());
    //   }
    //   else {
    //     print('bat dau 2:${response.reasonPhrase} $t ');
    //   }
    // }catch(e){
    //   print('bat dau 3:$e $t ');
    // }
    // DialogApp.dialogBodyCustom(context: context, body: CircularProgressIndicator());
    final client = RetryClient(http.Client());
    try {
      print("chay ngay di");
       // String _temp = await client.read(Uri.parse("https://cus-app-as.masterisehomes.com/customer-config-service/v1/view/config/get-all"));
      // String _temp = await client.read(Uri.parse("https://c-app.masterisehomes.com/media/2021/11/21/9f907c6b-f41d-4809-ab8d-1c5e1101d417/1/9f907c6b-f41d-4809-ab8d-1c5e1101d417.jpg"));
      //String _temp = await client.read(Uri.parse("https://c-app.masterisehomes.com/media/2021/11/21/9f907c6b-f41d-4809-ab8d-1c5e1101d417/1/9f907c6b-f41d-4809-ab8d-1c5e1101d417.jpg"));
    //   Navigator.pop(context);
    //   DialogApp.dialogBodyCustom(
    //     context: context,
    //     iconClose: true,
    //     body: Column(
    //       children: [
    //         Text(_temp),
    //       ],
    //     ),
    //   );
    } catch (e) {
      print(e);
    //   print(stack);
    //   Navigator.pop(context);
    //   DialogApp.dialogBodyCustom(
    //     context: context,
    //     iconClose: true,
    //     body: Column(
    //       children: [
    //         Text(e.toString()),
    //         Container(height: 2, color: Colors.red,),
    //         Text(stack.toString()),
    //       ],
    //     ),
    //   );
    } finally {
      print("chay ngay di 2");
      client.close();
    }
    // try{
    //   var response = await http.get(Uri.parse("https://cus-app-as.masterisehomes.com/customer-config-service/v1/view/config/get-all")).timeout(
    //     Duration(seconds: 30),
    //     onTimeout: () {
    //       return http.Response('Error', 500); // Replace 500 with your http code.
    //     },
    //   );
    //   if (response.statusCode == 200) {
    //     Navigator.pop(context);
    //     String htmlToParse;
    //     if (response.headers.containsKey(HttpHeaders.contentTypeHeader) && (ContentType.parse(response.headers[HttpHeaders.contentTypeHeader])).charset == 'utf-8') {
    //       htmlToParse = response.body;
    //     } else {
    //       htmlToParse = utf8.decode(response.body.runes.toList(), allowMalformed: true);
    //     }
    //     DialogApp.dialogBodyCustom(
    //       context: context,
    //       iconClose: true,
    //       body: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             HtmlWidget(htmlToParse)
    //           ],
    //         ),
    //       ),
    //     );
    //   }
    // }catch(e, stackTrace){
    //   Navigator.pop(context);
    //   print(e);
    //   print(stackTrace);
    //   DialogApp.dialogBodyCustom(
    //     context: context,
    //     iconClose: true,
    //     body: Column(
    //       children: [
    //         Text("Error : ${e.toString()}"),
    //         Container(height: 10, color: Colors.red,),
    //         Text("stackTrace ${stackTrace.toString()}"),
    //       ],
    //     ),
    //   );
    // }
  }


 void _makeRequest1() async {
    DialogApp.dialogBodyCustom(context: context, body: CircularProgressIndicator());
    try{
      var response = await http.get(Uri.parse("https://www.google.com"));
      if (response.statusCode == 200) {
        Navigator.pop(context);
        String htmlToParse;
        if (response.headers.containsKey(HttpHeaders.contentTypeHeader) && (ContentType.parse(response.headers[HttpHeaders.contentTypeHeader])).charset == 'utf-8') {
          htmlToParse = response.body;
        } else {
          htmlToParse = utf8.decode(response.body.runes.toList(), allowMalformed: true);
        }
        DialogApp.dialogBodyCustom(
          context: context,
          iconClose: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                HtmlWidget(htmlToParse)
              ],
            ),
          ),
        );
      }
    }catch(e, stackTrace){
      Navigator.pop(context);
      print(e);
      print(stackTrace);
      DialogApp.dialogBodyCustom(
        context: context,
        iconClose: true,
        body: Column(
          children: [
            Text("Error : ${e.toString()}"),
            Container(height: 10, color: Colors.red,),
            Text("stackTrace ${stackTrace.toString()}"),
          ],
        ),
      );
    }
  }

  void _makeRequest3() async {
    DialogApp.dialogBodyCustom(context: context, body: CircularProgressIndicator());
    try{
      var response = await http.get(Uri.parse("https://61bc1f4cd8542f00178245b3.mockapi.io/user"));
      if (response.statusCode == 200) {
        Navigator.pop(context);
        String htmlToParse;
        if (response.headers.containsKey(HttpHeaders.contentTypeHeader) && (ContentType.parse(response.headers[HttpHeaders.contentTypeHeader])).charset == 'utf-8') {
          htmlToParse = response.body;
        } else {
          htmlToParse = utf8.decode(response.body.runes.toList(), allowMalformed: true);
        }
        DialogApp.dialogBodyCustom(
          context: context,
          iconClose: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                HtmlWidget(htmlToParse)
              ],
            ),
          ),
        );
      }
    }catch(e, stackTrace){
      Navigator.pop(context);
      print(e);
      print(stackTrace);
      DialogApp.dialogBodyCustom(
        context: context,
        iconClose: true,
        body: Column(
          children: [
            Text("Error : ${e.toString()}"),
            Container(height: 10, color: Colors.red,),
            Text("stackTrace ${stackTrace.toString()}"),
          ],
        ),
      );
    }
  }

  // void retrofit(){
  //   final dio = Dio(); // Provide a dio instance
  //   dio.options.headers["Demo-Header"] = "demo header"; // config your dio headers globally
  //   final client = RestClient(dio);
  //
  //   client.getTasks().then((it) => logger.i(it));
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("http network"),
      ),
      body: Column(
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              _makeRequest();
            },
            child: Text('Link cus app'),
          ),

          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              _makeRequest1();
            },
            child: Text('Link google'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              _makeRequest2();
            },
            child: Text('RetryClient Link cus app'),
          ),

          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              _makeRequest3();
            },
            child: Text('Mock api'),
          ),
        ],
      ),
    );
  }
}
