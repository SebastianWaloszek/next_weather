import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/widgets/animated_number_text.dart';

class AnimatedUnitNumberText extends StatelessWidget {
  final int value;
  final String valueUnit;

  final TextStyle valueTextStyle;
  final TextStyle valueUnitTextStyle;

  final double unitLeftMargin;

  const AnimatedUnitNumberText({
    Key key,
    @required this.value,
    @required this.valueUnit,
    @required this.valueTextStyle,
    @required this.valueUnitTextStyle,
    this.unitLeftMargin = 5,
  })  : assert(value != null),
        assert(valueUnit != null),
        assert(valueTextStyle != null),
        assert(valueUnitTextStyle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildAnimatedValueCount(context),
        _buildValueUnitText(context),
      ],
    );
  }

  Widget _buildAnimatedValueCount(BuildContext context) {
    return AnimatedNumberText(
      number: value,
      textStyle: valueTextStyle,
    );
  }

  Widget _buildValueUnitText(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: unitLeftMargin),
      child: Text(
        valueUnit,
        style: valueUnitTextStyle,
      ),
    );
  }
}
