import 'package:equatable/equatable.dart';

abstract class Temperature extends Equatable {
  final int average;
  final int min;
  final int max;

  const Temperature({
    this.average,
    this.min,
    this.max,
  }) : assert(average != null || min != null || max != null);

  @override
  List<Object> get props => [
        average,
        min,
        max,
      ];
}
