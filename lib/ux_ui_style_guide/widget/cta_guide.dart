import 'package:example/constants/app_color.dart';
import 'package:example/constants/asset_path.dart';
import 'package:example/ux_ui_style_guide/widget/text_common.dart';
import 'package:flutter/material.dart';

class CtaGuide extends StatelessWidget {
  const CtaGuide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text("CTA"),
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xffA96C12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextCommon("Continue", fontFamily: AssetPath.FONT_ROBOTO_MEDIUM,fontSize: 16,color: Colors.white,)
            ],),
          ),
        ),
        const SizedBox(height: 20,),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: Color(0xff676767)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextCommon("Continue", fontFamily: AssetPath.FONT_ROBOTO_MEDIUM,fontSize: 16,color: Color(0xff676767),)
            ],),
          ),
        ),
        const SizedBox(height: 20,),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: AppColors.COLOR_GREY_LIGHT,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextCommon("Continue", fontFamily: AssetPath.FONT_ROBOTO_MEDIUM,fontSize: 16,color: AppColors.COLOR_676767,)
              ],),
          ),
        ),
        const SizedBox(height: 20,),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xffA96C12),
            child: Wrap(
              runAlignment: WrapAlignment.center,
              children: [
                TextCommon("Continue", fontFamily: AssetPath.FONT_ROBOTO_REGULAR,fontSize: 16,color: Colors.white,)
              ],),
          ),
        ),
        const SizedBox(height: 20,),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                  color: Color(0xff676767)
              )
            ),
            child: Wrap(
              runAlignment: WrapAlignment.center,
              children: [
                TextCommon("Continue", fontFamily: AssetPath.FONT_ROBOTO_REGULAR,fontSize: 16,color:Color(0xff676767),)
              ],),
          ),
        ),
        const SizedBox(height: 20,),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: AppColors.COLOR_GREY_LIGHT,
            child: Wrap(
              runAlignment: WrapAlignment.center,
              children: [
                TextCommon("Continue", fontFamily: AssetPath.FONT_ROBOTO_REGULAR,fontSize: 16,color:AppColors.COLOR_676767,)
              ],),
          ),
        ),
      ],
    );
  }
}
