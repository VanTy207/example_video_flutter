import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_charts/charts.dart' hide LabelPlacement;
// import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSlide extends StatefulWidget {
  const RangeSlide({Key key}) : super(key: key);

  @override
  _RangeSlideState createState() => _RangeSlideState();
}

class _RangeSlideState extends State<RangeSlide> {

  // final List<Data> _chartData = <Data>[
  //   Data(x: DateTime(2003, 01, 01), y: 3.4),
  //   Data(x: DateTime(2004, 01, 01), y: 2.8),
  //   Data(x: DateTime(2005, 01, 01), y: 1.6),
  //   Data(x: DateTime(2006, 01, 01), y: 2.3),
  //   Data(x: DateTime(2007, 01, 01), y: 2.5),
  //   Data(x: DateTime(2008, 01, 01), y: 2.9),
  //   Data(x: DateTime(2009, 01, 01), y: 3.8),
  //   Data(x: DateTime(2010, 01, 01), y: 2.0),
  // ];
  //
  // final DateTime _dateMin = DateTime(2003, 01, 01);
  // final DateTime _dateMax = DateTime(2010, 01, 01);
  // final SfRangeValues _dateValues =
  // SfRangeValues(DateTime(2005, 01, 01), DateTime(2008, 01, 01));

  double value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Range Selector'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ["1", "2", "3", "4","5",].map((e) => Expanded(child: Text(e, textAlign: TextAlign.center,))).toList(),
            ),
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 10,
              inactiveTickMarkColor: Color(0xffF3F2EE),
              disabledActiveTickMarkColor: Colors.green,
              inactiveTrackColor: Colors.yellow,
              activeTickMarkColor: Colors.amber,
              activeTrackColor: Colors.blueAccent,
              disabledActiveTrackColor: Colors.blueGrey,
              disabledInactiveTickMarkColor: Colors.cyanAccent,
              disabledInactiveTrackColor: Colors.deepOrange,
              valueIndicatorColor: Colors.blueGrey,
              disabledThumbColor: Colors.purple,
              thumbColor: Colors.indigoAccent,
              thumbShape: CustomSliderThumbCircle(
                thumbRadius: 15,
                sliderValue: value.toInt(),
                color: Color(0xffE6AF30),
              ),
              overlayColor: Color(0xffF9E2AB).withOpacity(0.3),
              trackShape: GradientRectSliderTrackShape(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffF9E2AB),
                      Color(0xffE6AF30),
                    ],
                  )
              ),
            ),
            child: Slider(
              max: 5,
              min: 1,
              // divisions: 9,
              value: value,
              activeColor: Color(0xffF3F2EE),
              thumbColor: Color(0xffE6AF30),
              inactiveColor: Color(0xffF3F2EE),
              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ["Very low", "Low", "Medium", "High","Very High"].map((e) => Expanded(child: Text(e, textAlign: TextAlign.center,))).toList(),
          ),
        ],
      ),
    );
  }
}


class Data {

  Data({@required this.x, @required this.y});

  final DateTime x;

  final double y;
}

class GradientRectSliderTrackShape extends SliderTrackShape with BaseSliderTrackShape {
  /// Create a slider track that draws two rectangles with rounded outer edges.
  const GradientRectSliderTrackShape({@required this.gradient});
  final LinearGradient gradient;

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        @required RenderBox parentBox,
        @required SliderThemeData sliderTheme,
        @required Animation<double> enableAnimation,
        @required TextDirection textDirection,
        @required Offset thumbCenter,
        bool isDiscrete = false,
        bool isEnabled = false,
        double additionalActiveTrackHeight = 2,
      }) {
    assert(context != null);
    assert(offset != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(enableAnimation != null);
    assert(textDirection != null);
    assert(thumbCenter != null);

    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight <= 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final activeGradientRect = Rect.fromLTRB(
      trackRect.left,
      (textDirection == TextDirection.ltr)
          ? trackRect.top - (additionalActiveTrackHeight / 2)
          : trackRect.top,
      thumbCenter.dx,
      (textDirection == TextDirection.ltr)
          ? trackRect.bottom + (additionalActiveTrackHeight / 2)
          : trackRect.bottom,
    );

    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(activeGradientRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation);
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation);
     Paint leftTrackPaint;
     Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular(trackRect.height / 2 + 1);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}


class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final Color color;
  final Color textColor;
  final int sliderValue;

  const CustomSliderThumbCircle({
    @required this.thumbRadius,
    this.color = Colors.white,
    this.textColor = Colors.white,
    this.sliderValue
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        Animation<double> activationAnimation,
        Animation<double> enableAnimation,
        bool isDiscrete,
        TextPainter labelPainter,
        RenderBox parentBox,
        SliderThemeData sliderTheme,
        TextDirection textDirection,
        double value,
        double textScaleFactor,
        Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = color //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = new TextSpan(
      style: new TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: textColor, //Text Color of Value on Thumb
      ),
      text: sliderValue.toString(),
    );

    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter = Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }
}