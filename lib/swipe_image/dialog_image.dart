import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DialogExample extends StatefulWidget {
  @override
  _DialogExampleState createState() => _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {

  void openDialog(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          child: PhotoView(
            tightMode: true,
            imageProvider: const AssetImage("assets/large-image.jpg"),
            heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
          ),
        ),
      );
    },
  );

  void openBottomSheet(BuildContext context) => showBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    shape: const ContinuousRectangleBorder(),
    builder: (BuildContext context) {
      return GestureDetector(
        // onVerticalDragUpdate: (details) {
        //   int sensitivity = 10;
        //   if (details.delta.dy > sensitivity || details.delta.dy < -sensitivity) {
        //     Navigator.of(context).pop();
        //   }
        // },
        onVerticalDragDown: (DragDownDetails details){
         print("onVerticalDragDown");
         Navigator.of(context).pop();
        },
        onVerticalDragStart: (DragStartDetails details){
         print("DragStartDetails");
        },
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Colors.black.withAlpha(240),
          ),
          imageProvider: const AssetImage("assets/large-image.jpg"),
          heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
        ),
      );
    },
  );

  void openBottomSheetModal(BuildContext context) => showModalBottomSheet(
    context: context,
    shape: const ContinuousRectangleBorder(),
    builder: (BuildContext context) {
      return SafeArea(
        child: Container(
          height: 250,
          child: PhotoViewGestureDetectorScope(
            axis: Axis.vertical,
            child: PhotoView(
              tightMode: true,
              imageProvider: const AssetImage("assets/large-image.jpg"),
              heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
            ),
          ),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return ExampleAppBarLayout(
      title: "Dialogs integration",
      showGoBack: true,
      child: Builder(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(color: Colors.red),
            ),
            ElevatedButton(
              child: const Text("Dialog"),
              onPressed: () => openDialog(context),
            ),
            const Divider(),
            ElevatedButton(
              child: const Text("Bottom sheet"),
              onPressed: () => openBottomSheet(context),
            ),
            const Divider(),
            ElevatedButton(
              child: const Text("Bottom sheet tight mode"),
              onPressed: () => openBottomSheetModal(context),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAppBarLayout extends StatelessWidget {
  const ExampleAppBarLayout({
    Key key,
    @required this.title,
    this.showGoBack = false,
    @required this.child,
  }) : super(key: key);

  final String title;
  final bool showGoBack;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ExampleAppBar(
              title: title,
              showGoBack: showGoBack,
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleAppBar extends StatelessWidget {
  const ExampleAppBar({@required this.title, this.showGoBack = false}) : super();

  final String title;
  final bool showGoBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
            ),
            boxShadow: <BoxShadow>[
              const BoxShadow(
                  color: Colors.black12, spreadRadius: 10.0, blurRadius: 20.0)
            ]),
        child: Row(
          children: <Widget>[
            Container(
              child: showGoBack
                  ? IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.zero,
              )
                  : Container(
                height: 50.0,
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}