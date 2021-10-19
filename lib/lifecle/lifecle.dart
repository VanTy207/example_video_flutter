import 'package:flutter/material.dart';
class DeleteCheck extends StatefulWidget{

  final offsetBool;
  final double widthSlide;

  DeleteCheck({
    Key key,
    this.offsetBool,
    this.widthSlide
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => _MyDeleteCheck();
}

class _MyDeleteCheck extends State<DeleteCheck> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controllerText;
  Animation<Offset> _offsetFloat;
  Animation<double> _containerWidth;
  Animation<double> _containerSizeText;
  Animation<double> _animationOpacity;

  bool check = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _controllerText = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
      reverseDuration: const Duration(milliseconds: 900),
    );

    _offsetFloat = Tween<Offset>(begin: Offset(3.0, 0.0), end: Offset(1, 0)).animate(_controller);
    _containerWidth = Tween<double>(begin: 0, end: 350).animate(CurvedAnimation(parent: _controller,curve: Interval(0.4, 1.0)));
    _containerSizeText = Tween<double>(begin: 0, end: 12).animate(CurvedAnimation(parent: _controllerText, curve: Interval(0.4, 1.0)));
    _animationOpacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Interval(0.4, 1.0)));

    _controller.addListener(() {
      setState(() {});
    });

    _controllerText.addListener(() {
      setState(() {

      });
    });

    // _offsetFloat.addListener((){
    //   setState((){});
    // });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height100 = MediaQuery.of(context).size.height;
    double width100 = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.red,
              height: 100,
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  SlideTransition(
                      position: _offsetFloat,
                      child: IntrinsicWidth(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          child: Text("hello there sailor")
                        ),
                      )
                  ),
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  _controller.forward();
                  _controllerText.forward();
                },
                child: Text("clik")
            ),
            ElevatedButton(
                onPressed: (){
                  _controller.reverse();
                  _controllerText.reverse();
                },
                child: Text("clik")
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    width: _containerWidth.value,
                    height: 24,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Color(0xffF0EBE9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    ),
                    child: Text("Local view, Vinhomes park, River view and City view", style: TextStyle(
                      color: Color(0xff326F81),
                      fontSize: _containerSizeText.value
                    ),),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Center(child: Text("i", style: TextStyle(
                          color: Color(0xFFA96C12)
                        ),)),
                      ),
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}