import 'package:example/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

class TextFormFieldLabelCustom extends StatefulWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final FloatingLabelBehavior floatingLabelBehavior;
  final double height;
  final double fontSizeLabel;
  final TextEditingController controller;
  final String hint;
  final String labelText;
  final String errorText;
  final Function onChange;
  final Function onTap;
  final Function validate;
  final Function onFieldSubmitted;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final int maxLength;
  final int minLine;
  final int maxLine;
  final bool readOnly;
  final bool autoFocus;
  final bool require;
  final bool obscureText;
  final bool filled;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;

  const TextFormFieldLabelCustom({
    Key key,
    @required this.controller,
    @required this.focusNode,
    @required this.hint,
    @required this.labelText,
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
    this.onTap,
    this.height = 18.0,
    this.minLine,
    this.maxLine =  1,
    this.padding,
    this.onChange,
    this.errorText,
    this.onFieldSubmitted,
    this.keyboardType,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.validate,
    this.require = false,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.maxLength,
    this.readOnly = false,
    this.suffixIcon,
    this.autoFocus = false,
    this.textInputAction,
    this.obscureText = false,
    this.filled = false,
    this.fontSizeLabel = 16,
    this.inputFormatters,})  : assert(focusNode != null, controller != null), super(key: key);

  @override
  _TextFormFieldLabelCustomState createState() => _TextFormFieldLabelCustomState();
}

class _TextFormFieldLabelCustomState extends State<TextFormFieldLabelCustom> {

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if(mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.keyboardType == TextInputType.datetime)
          FocusScope.of(context).requestFocus(widget.focusNode);
      },
      child: Container(
        // height: 60,
        // color: Colors.greenAccent,
        margin: widget.margin,
        alignment: Alignment.center,
        padding: widget.padding,
        // decoration: BoxDecoration(
        //   color: widget.bgColor,
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(UiUtils.borderRadiusDefault),
        //   ),
        // ),
        child: TextFormField(
          // maxLines: 2,\
          textAlignVertical: TextAlignVertical.center,
          readOnly: widget.readOnly,
          maxLength: widget.maxLength,
          // enableInteractiveSelection: true,
          autofocus: widget.autoFocus,
          controller: widget.controller,
          obscureText: widget.obscureText,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          obscuringCharacter: '*',
          minLines: widget.minLine,
          maxLines: widget.maxLine,
          inputFormatters: widget.inputFormatters,
          onTap: widget.onTap,
          onEditingComplete: () {
            if(widget.focusNode.hasFocus) widget.focusNode.unfocus();
          },
          style: TextStyle(
            // fontSize: 16.sp
            fontSize: 16
          ),
          decoration: InputDecoration(
            // isCollapsed: true,
            isDense: true,
            errorMaxLines: 2,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: widget.height),
            errorText: widget.errorText,
            errorStyle: TextStyle(
              textBaseline: TextBaseline.ideographic
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: AppColors.COLOR_676767,
              fontSize: 16
              // fontSize: 16.sp
              // fontSize: Util.fontSizeDefault()
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.COLOR_DDDDDD
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.COLOR_CCA572,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            floatingLabelBehavior: widget.floatingLabelBehavior,
            labelText: widget.require ? "${widget.labelText} (*)" : widget.labelText,
            labelStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: widget.focusNode.hasFocus ? AppColors.COLOR_CCA572 : AppColors.COLOR_676767,
            ),
            hintMaxLines: 1,
            filled: widget.filled,
            fillColor: widget.readOnly ? Color(0xffEEEEEE) : Colors.white,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          ),
          validator: widget.validate != null ? (val) => widget.validate(val) : (val){
            return null;
          },
          onChanged:  widget.onChange != null ? (val) => widget.onChange(val) : (val){},
          textAlign: widget.textAlign,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted != null ? (value) => widget.onFieldSubmitted(value) : (value){},
        ),
      ),
    );
  }
}