import 'package:equatable/equatable.dart';

abstract class WindSpeed extends Equatable {
  final double value;

  const WindSpeed(
    this.value,
  );

  @override
  List<Object> get props => [value];
}
