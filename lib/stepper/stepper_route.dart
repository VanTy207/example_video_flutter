import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  List<Step> _guideSteps() {
    List<Step> _steps = <Step>[];
    for (int i = 0; i < 20; i++) {
      _steps.add(
        Step(
          title: Text('guide.title'),
          subtitle: Text('guide.subtitle'),
          content: Container(
            height: 250,
            child: ListView(
              physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  height: 150,
                  color: Colors.green,
                ) ,
                Container(
                  height: 150,
                  color: Colors.blue,
                )
              ],
            ),
          ),
          isActive: true,
        ),
      );
    }
    return _steps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 90,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Home',
                    textScaleFactor: 0.7,
                  ),
                ],
              ),
              titlePadding: EdgeInsets.only(left: 16.0, bottom: 16.0),
            ),
          ),
          SliverToBoxAdapter(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Stepper(
                steps: _guideSteps(),
                currentStep: _currentStep,
                physics: ClampingScrollPhysics(),
                onStepTapped: (step) {
                  setState(() {
                    _currentStep = step;
                  });
                },
                controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) => Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}