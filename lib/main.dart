import 'dart:io';
import 'dart:convert';

import 'package:example/constants/asset_path.dart';
import 'package:example/dialog.dart';
import 'package:example/http_network/http_network.dart';
import 'package:example/provider/theme_provider.dart';
import 'package:example/range_slide/range_slide.dart';
import 'package:example/responsive_layout/screen_text.dart';
import 'package:example/swipe_image/dialog_image.dart';
import 'package:example/swipe_image/dismissible_page.dart';
import 'package:example/swipe_image/list_image_route.dart';
import 'package:example/swipe_image/sign_image.dart';
import 'package:example/ux_ui_style_guide/ux_ui_style_route.dart';
import 'package:example/videos/example_lib/video_list_page_old.dart';
import 'package:example/videos/video_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
// import 'package:sizer/sizer.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // return Sizer(builder: (context, orientation, deviceType) => MaterialApp(
    //     title: 'Flutter Demo',
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: HtmlDemo()
    // ));
    // return ScreenUtilInit(
    //     designSize: Size(360, 690),
    //     builder: () => MaterialApp(
    //       title: 'Flutter Demo',
    //       debugShowCheckedModeBanner: false,
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //       ),
    //       home: HtmlDemo()
    //
    //     // Provider<ThemeProvider>(
    //     //     create: (context) => ThemeProvider(),
    //     //     child: ChangeNotifierProvider<ThemeProvider>(
    //     //       create: (_) => ThemeProvider(),
    //     //      child: MyHomePage(title: 'Flutter Demo Home Page'),
    //     //     )
    //     // ),
    //   )
    // );
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: AssetPath.FONT_ROBOTO_REGULAR
        ),
        home: HomePage()
      // Provider<ThemeProvider>(
      //     create: (context) => ThemeProvider(),
      //     child: ChangeNotifierProvider<ThemeProvider>(
      //       create: (_) => ThemeProvider(),
      //      child: ProviderExample(title: 'Flutter Demo Home Page'),
      //     )
      // ),
    );
    // return ResponsiveSizer(builder: (context, orientation, screenType) {
    //   return MaterialApp(
    //       title: 'Flutter Demo',
    //       debugShowCheckedModeBanner: false,
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //         fontFamily: AssetPath.FONT_ROBOTO_REGULAR
    //       ),
    //       home: HomePage()
    //
    //       // Provider<ThemeProvider>(
    //       //     create: (context) => ThemeProvider(),
    //       //     child: ChangeNotifierProvider<ThemeProvider>(
    //       //       create: (_) => ThemeProvider(),
    //       //      child: ProviderExample(title: 'Flutter Demo Home Page'),
    //       //     )
    //       // ),
    //       );
    // });
  }
}

class HomePage extends StatefulWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = TextEditingController();

  void _makeRequest(String content, String type) async {
    var response = await http.get(Uri.parse(content));
    if (response.statusCode == 200) {
      String htmlToParse;
      if (response.headers.containsKey(HttpHeaders.contentTypeHeader) && (ContentType.parse(response.headers[HttpHeaders.contentTypeHeader])).charset == 'utf-8') {
        htmlToParse = response.body;
      } else {
        htmlToParse = utf8.decode(response.body.runes.toList(), allowMalformed: true);
      }

      DialogApp.dialogBodyCustom(
        context: context,
        iconClose: true,
        body: Column(
          children: [if (type == "1") HtmlWidget(htmlToParse) else Html(data: htmlToParse)],
        ),
      );
    }
  }

  void _showPopup(BuildContext context, String content, String type) {
    if (content.startsWith('http')) {
      _makeRequest(content, type);
      return;
    }
    DialogApp.dialogBodyCustom(
      context: context,
      iconClose: true,
      body: Column(
        children: [if (type == "1") HtmlWidget(content) else Html(data: content)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _textEditingController,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Input text",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Color(0xffA96C12)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _showPopup(context, _textEditingController.text, "1");
                },
                child: Text('Submit type 1'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _showPopup(context, _textEditingController.text, "2");
                },
                child: Text('Submit type 2'),
              ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenText(),
                    ),
                  );
                },
                child: Text('Submit type 2'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListImageRoute()));
                },
                child: Text('List Image Swipe Down'),
              ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignImage()));
                },
                child: Text('Image Swipe Down'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DialogExample()));
                },
                child: Text('Dialog Image Swipe Down'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DismissiblePageRoute()));
                },
                child: Text('Dismissible'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UxUiStyleGuide()));
                },
                child: Text('Ux ui style guide'),
              ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => VideoListPage()));
                },
                child: Text('VideoListPage'),
              ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => VideoListPageOld()));
                },
                child: Text('VideoListPage lid'),
              ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => VideoListPageOld()));
                },
                child: Text('VideoListPage lid'),
              ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => HttpNetwork()));
                },
                child: Text('HttpNetwork'),
              ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RangeSlide()));
                },
                child: Text('RangeSlide'),
              ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  print(DateTime.fromMillisecondsSinceEpoch(9223372036854769698));
                  DialogApp.dialogBodyCustom(
                    context: context,
                    iconClose: true,
                    body: Column(
                      children: [
                        Text(DateTime.fromMillisecondsSinceEpoch(9223372036854769698).toString())
                      ],
                    ),
                  );
                },
                child: Text('HttpNetwork'),
              ),
              HtmlWidget(
                  """
                <p style='font-size: 14pt'>
                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                </p>
                """
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: HtmlWidget(
                  """
                  <p style='font-size: 14px'>
                  Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                  </p>
                  """
                ),
              ),
              HtmlWidget(
                  """
                <p style='font-size: 1em'>
                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                </p>
                """
              ),
              const SizedBox(height: 20,),
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting",
                style: TextStyle(
                  fontSize: 14
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProviderExample extends StatefulWidget {

  ProviderExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProviderExampleState createState() => _ProviderExampleState();
}

class _ProviderExampleState extends State<ProviderExample> {
  double loginWidth = 0.0;
  double yOffset = 0;
  double xOffset = 0;

  bool isActive = false;

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
              style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0), primary: Colors.white, textStyle: const TextStyle(fontSize: 20), backgroundColor: Theme.of(context).primaryColor),
              child: Text("Click Video"),
            ),
          ),
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              print("abc ${context.watch<ThemeProvider>().turnLight}");
              // ThemeProvider themeProvider = context.watch<ThemeProvider>();
              return Text("Hello", style: Theme.of(context).textTheme.headline2?.copyWith(color: context.watch<ThemeProvider>().turnLight ? Colors.red : Colors.black));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // Provider.of<ThemeProvider>(context, listen: false).changeCong(true)
                  context.read<ThemeProvider>().doSomething(true);
                },
                style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0), primary: Colors.white, textStyle: const TextStyle(fontSize: 20), backgroundColor: Theme.of(context).primaryColor),
                child: Text("On"),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  // Provider.of<ThemeProvider>(context, listen: false).changeTru(false);
                  context.read<ThemeProvider>().doSomething(false);
                },
                style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0), primary: Colors.white, textStyle: const TextStyle(fontSize: 20), backgroundColor: Theme.of(context).primaryColor),
                child: Text("Off"),
              )
            ],
          )
        ],
      ),
    ));
  }
}

class StatusVideo {
  int id;
  bool status;

  StatusVideo({this.id, this.status});
}
