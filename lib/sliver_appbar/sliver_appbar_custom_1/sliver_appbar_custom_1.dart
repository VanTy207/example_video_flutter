import 'package:example/sliver_appbar/sliver_appbar_custom_1/appBar_animate_custom.dart';
import 'package:flutter/material.dart';
class EventOnlineRoute extends StatefulWidget {
  const EventOnlineRoute({Key key}) : super(key: key);

  @override
  _EventOnlineRouteState createState() => _EventOnlineRouteState();
}

class _EventOnlineRouteState extends State<EventOnlineRoute> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  // ignore: non_constant_identifier_names
  AnimationController _ColorAnimationController;
  // ignore: non_constant_identifier_names
  AnimationController _TextAnimationController;
  Animation _colorTween, _homeTween, _workOutTween, _iconTween, _drawerTween;
  Animation<Offset> _transTween;

  @override
  void initState() {
    _ColorAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 0));
      // ..addListener(() {setState(() {});});
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white).animate(_ColorAnimationController);

    _iconTween = ColorTween(begin: Colors.white, end: Colors.lightBlue.withOpacity(0.5)).animate(_ColorAnimationController);

    _drawerTween = ColorTween(begin: Colors.white, end: Colors.black).animate(_ColorAnimationController);

    _homeTween = ColorTween(begin: Colors.white, end: Colors.black).animate(_ColorAnimationController);

    _workOutTween = ColorTween(begin: Colors.white, end: Colors.black).animate(_ColorAnimationController);

    _TextAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 10)).animate(_ColorAnimationController);

    super.initState();
  }


  bool scrollListener(ScrollNotification scrollInfo) {
    bool scroll = false;
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 130);
      // _TextAnimationController.animateTo((scrollInfo.metrics.pixels - 350) / 50);

      _TextAnimationController.animateTo(scrollInfo.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(),
      backgroundColor: Color(0xFFEEEEEE),
      body: NotificationListener<ScrollNotification>(
        onNotification: scrollListener,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            //ADD_MORE_WIDGETS
                            Container(
                              color: Colors.green,
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Test",
                                    style: TextStyle(
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                            ),
                            Column(
                              children: [
                                Card(
                                  elevation: 2,
                                  borderOnForeground: true,
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    color: Colors.red,
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  elevation: 2,
                                  borderOnForeground: true,
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    color: Colors.blue,
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  elevation: 2,
                                  borderOnForeground: true,
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    color: Colors.blue,
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  elevation: 2,
                                  borderOnForeground: true,
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    color: Colors.blue,
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  elevation: 2,
                                  borderOnForeground: true,
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    color: Colors.blue,
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                  ),
                                ),  const SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  elevation: 2,
                                  borderOnForeground: true,
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    color: Colors.blue,
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Positioned(
                          top: 200,
                          left: 0,
                          right: 0,
                          child:  Card(
                            elevation: 2,
                            borderOnForeground: true,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              color: Colors.blueAccent,
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                            ),
                          ),)
                        //ADD_MORE_WIDGETS
                      ],
                    ),
                  ),
                  AppBarAnimateCustom(
                    drawerTween: _drawerTween,
                    onPressed: () {
                      scaffoldKey.currentState.openDrawer();
                    },
                    colorAnimationController: _ColorAnimationController,
                    colorTween: _colorTween,
                    homeTween: _homeTween,
                    iconTween: _iconTween,
                    workOutTween: _workOutTween,
                    transTween: _transTween,
                  )
                ],
              ),
            ),
            //ADD_MORE_WIDGETS
          ],
        ),
      ),
    );
  }
}
