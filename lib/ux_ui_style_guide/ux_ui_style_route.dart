import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/constants/app_color.dart';
import 'package:example/constants/asset_path.dart';
import 'package:example/ux_ui_style_guide/widget/cta_guide.dart';
import 'package:example/ux_ui_style_guide/widget/input_guide.dart';
import 'package:example/ux_ui_style_guide/widget/text_common.dart';
import 'package:example/ux_ui_style_guide/widget/typograhy_guide.dart';
import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

class UxUiStyleGuide extends StatefulWidget {

  const UxUiStyleGuide({Key key}) : super(key: key);

  @override
  _UxUiStyleGuideState createState() => _UxUiStyleGuideState();
}

class _UxUiStyleGuideState extends State<UxUiStyleGuide> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: TextCommon("Ux ui style guide", fontSize: 18, fontFamily: AssetPath.FONT_ROBOTO_BOLD,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TypographyGuide(),
            const SizedBox(height: 20,),
            Container(
              child: Text("Form"),
            ),
            TextFormFieldLabelCustom(
              controller: _textEditingController,
              focusNode: _focusNode,
              hint: "Phone",
              labelText: "Phone number",
              prefixIcon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            color: AppColors.COLOR_GREY_LIGHT
                        )
                    )
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    CachedNetworkImage(
                      imageUrl: "https://c-app.masterisehomes.com/media/2021/12/02/08c4ded0-013f-4612-83cc-ff89167b6d39/1/08c4ded0-013f-4612-83cc-ff89167b6d39.jpg",
                      width: 30,
                    ),
                    Text("+84")
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            CtaGuide(),
            const SizedBox(height: 20,),
            Text(
              "How to use",
              style: TextStyle(
                // fontSize: 14.sp,
                fontFamily: AssetPath.FONT_ROBOTO_REGULAR,
                color: AppColors.COLOR_MAIN,
              ),
            )
          ],
        ),
      ),
    );
  }
}
