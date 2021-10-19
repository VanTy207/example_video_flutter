import 'package:example/lifecle/lifecle.dart';
import 'package:example/sliver_appbar/sliver_appbar_custom_1/sliver_appbar_custom_1.dart';
import 'package:example/sliver_appbar/sliver_appbar_custom_2/main_appbar_siliver.dart';
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
    return ScreenUtilInit(
      // designSize: Size(360, 690),
      builder: () {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }
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
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(
              //         builder: (_) => MainAppBarSliverAppBar()));
              //   },
              //   child: Text("MainAppBarSliverAppBar",
              //     textScaleFactor: 1.0,
              //     ),
              // ),
              // Row(
              //   children: [
              //
              //     AnimatedContainer(
              //       curve: Curves.fastOutSlowIn,
              //       duration: new Duration (seconds: 2),
              //       width: loginWidth,
              //       child: Container(
              //         // width: loginWidth,
              //         color: Colors.red,
              //           child: Text("test"),
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: (){
              //         print("sclick");
              //         // setState(() {
              //         //   loginWidth == 0.0 ? loginWidth = 100.0 : loginWidth = 0.0;
              //         //
              //         // });
              //       },
              //       child: Container(
              //         padding: EdgeInsets.all(20),
              //         decoration: BoxDecoration(
              //             color: Colors.blue,
              //             shape: BoxShape.circle
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (_) => EventOnlineRoute()));
              //   },
              //   child: Text("EventOnlineRoute"),
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context, MaterialPageRoute(builder: (_) => DeleteCheck()));
              //   },
              //   child: Text("LifeCle"),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => VideoListPage()));
                },
                child: Text("Video"),
              ),

            ],
          ),
        )
    );
  }

  // void printScreenInformation() {
  //   print('Device width dp:${1.sw}dp');
  //   print('Device height dp:${1.sh}dp');
  //   print('sp:${1.sp}sp');
  //   print('Device pixel density:${ScreenUtil().pixelRatio}');
  //   print('Bottom safe zone distance dp:${ScreenUtil().bottomBarHeight}dp');
  //   print('Status bar height dp:${ScreenUtil().statusBarHeight}dp');
  //   print('The ratio of actual width to UI design:${ScreenUtil().scaleWidth}');
  //   print(
  //       'The ratio of actual height to UI design:${ScreenUtil().scaleHeight}');
  //   print('System font scaling:${ScreenUtil().textScaleFactor}');
  //   print('0.5 times the screen width:${0.5.sw}dp');
  //   print('0.5 times the screen height:${0.5.sh}dp');
  //   print('Screen orientation:${ScreenUtil().orientation}');
  // }
}


class StatusVideo{
  int id;
  bool status;

  StatusVideo({this.id, this.status});

}