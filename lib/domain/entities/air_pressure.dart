import 'package:equatable/equatable.dart';

abstract class AirPressure extends Equatable {
  final double value;

  const AirPressure(
    this.value,
  );

  @override
  List<Object> get props => [value];
}
