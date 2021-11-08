import 'package:example/lifecle/lifecle.dart';
import 'package:example/sliver_appbar/sliver_appbar_custom_1/sliver_appbar_custom_1.dart';
import 'package:example/sliver_appbar/sliver_appbar_custom_2/main_appbar_siliver.dart';
import 'package:example/stepper/stepper_route.dart';
import 'package:example/videos/video_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());

  List<StatusVideo> _listStatusVideo = [
    StatusVideo(id: 0, status: false),
    StatusVideo(id: 1, status: false),
    StatusVideo(id: 2, status:false),
  ];

  void handleStatus(StatusVideo status){
    for(int i = 0; i < _listStatusVideo.length; i++){
      if(status.id == _listStatusVideo[i].id){
        if(status.status != _listStatusVideo[i].status){
          _listStatusVideo[i].status = status.status;
        }
      }else{
        if(_listStatusVideo[i].status){
          _listStatusVideo[i].status = false;
        }
      }
    }
  }

  handleStatus(StatusVideo(id: 2, status: true));

  _listStatusVideo.forEach((e) {
    print("status ${e.id} - ${e.status}");
  });


}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  double loginWidth =0.0;
  double yOffset = 0;
  double xOffset = 0;

  bool isActive =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => VideoListPage()));
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Theme.of(context).primaryColor
                  ),
                  child: Text("Click Video"),
                ),
              ),
            ],
          ),
        )
    );
  }

}


class StatusVideo{
  int id;
  bool status;

  StatusVideo({this.id, this.status});

}