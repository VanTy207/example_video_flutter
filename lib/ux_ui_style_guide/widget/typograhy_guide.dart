import 'package:example/constants/asset_path.dart';
import 'package:example/ux_ui_style_guide/widget/text_common.dart';
import 'package:flutter/material.dart';

class TypographyGuide extends StatelessWidget {
  const TypographyGuide({Key key}) : super(key: key);

  Widget _buildTypeGuide([String type, String des, String content, String fontFamily, double fontSize]){
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(type),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextCommon(
                  content,
                  fontFamily: fontFamily,
                  fontSize: fontSize,
                ),
              ),
              Text(des)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content,
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: fontFamily
              ),),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text("Typography"),
        ),
        _buildTypeGuide(
            "App bar",
            "20px - Bold",
            "Aa",
            AssetPath.FONT_ROBOTO_BOLD,
            18
        ),
        _buildTypeGuide(
            "OnBoarding Title",
            "22px - Bold",
            "Aaa",
            AssetPath.FONT_ROBOTO_BOLD,
            22
        ),
        _buildTypeGuide(
            "Popup Title",
            "20px - Bold",
            "Aaa",
            AssetPath.FONT_ROBOTO_BOLD,
            20
        ),
        _buildTypeGuide(
            "Large Title",
            "20px - Bold",
            "Aaa",
            AssetPath.FONT_ROBOTO_BOLD,
            20
        ),
        _buildTypeGuide(
            "Title",
            "18px - Bold",
            "Aaa".toUpperCase(),
            AssetPath.FONT_ROBOTO_BOLD,
            18
        ),
        _buildTypeGuide(
            "Medium Title",
            "16px - Bold",
            "Aaa",
            AssetPath.FONT_ROBOTO_BOLD,
            16
        ),
        _buildTypeGuide(
            "Body",
            "16px - Regular",
            "Aaa",
            AssetPath.FONT_ROBOTO_REGULAR,
            16
        ),
        _buildTypeGuide(
            "Second Body",
            "14px - Regular",
            "Aaa",
            AssetPath.FONT_ROBOTO_REGULAR,
            14
        ),
        _buildTypeGuide(
            "News, gift title",
            "16px - Medium",
            "Aaa",
            AssetPath.FONT_ROBOTO_MEDIUM,
            16
        ),
        _buildTypeGuide(
            "Text Note",
            "14px - Regular",
            "Aaa",
            AssetPath.FONT_ROBOTO_REGULAR,
            14
        ),
        _buildTypeGuide(
            "Sticky menu",
            "14px - Regular",
            "Aaa",
            AssetPath.FONT_ROBOTO_REGULAR,
            14
        ),
        _buildTypeGuide(
            "Status text",
            "14px - Regular",
            "Aaa",
            AssetPath.FONT_ROBOTO_REGULAR,
            14
        ),
      ],
    );
  }
}
