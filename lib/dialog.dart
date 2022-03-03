import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DialogApp{
  static Future dialogBodyCustom({
    @required BuildContext context,
    bool iconClose = false,
    bool isButton = false,
    String leftButtonName,
    dynamic errorCode,
    String bottomActionClickText,
    VoidCallback bottomActionClickTextCallBack,
    String rightButtonName,
    Color colorButtonLeft = const Color(0xffA96C12),
    Color colorButtonRight = Colors.white,
    Color colorButtonBorderRight = const Color(0xffA1A1A1),
    double radiusButton = 20,
    VoidCallback leftOnPressed,
    VoidCallback rightOnPressed,
    VoidCallback iconCloseOnPressed,
    @required Widget body,
  }) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          insetPadding: const EdgeInsets.all(24),
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.3), offset: Offset(0, 24), blurRadius: 24),
            ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (iconClose)
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          iconCloseOnPressed?.call();
                        },
                        child: Icon(Icons.clear, size: 30)),
                  ),
                if (body != null) body,
              ],
            ),
          ),
        );
      },
    );
  }
}