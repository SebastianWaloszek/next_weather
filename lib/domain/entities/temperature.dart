import 'package:equatable/equatable.dart';

abstract class Temperature extends Equatable {
  final double current;
  final double min;
  final double max;

  const Temperature({
    this.current,
    this.min,
    this.max,
  }) : assert(current != null || min != null || max != null);

  @override
  List<Object> get props => [
        current,
        min,
        max,
      ];
}
