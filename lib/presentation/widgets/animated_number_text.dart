import 'package:flutter/material.dart';

class AnimatedNumberText extends ImplicitlyAnimatedWidget {
  final int number;

  final TextStyle textStyle;

  const AnimatedNumberText({
    Key key,
    @required this.number,
    @required this.textStyle,
    Curve curve = Curves.linear,
  })  : assert(number != null),
        assert(textStyle != null),
        super(
          duration: const Duration(milliseconds: 500),
          curve: curve,
          key: key,
        );

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedCountState();
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedNumberText> {
  IntTween _number;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_number.evaluate(animation)}',
      style: widget.textStyle,
    );
  }

  @override
  void forEachTween(TweenVisitor visitor) {
    _number = visitor(
      _number,
      widget.number,
      (value) => IntTween(begin: value as int),
    ) as IntTween;
  }
}
