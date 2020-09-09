import 'package:equatable/equatable.dart';

abstract class Humidity extends Equatable {
  final int value;

  const Humidity(
    this.value,
  );

  @override
  List<Object> get props => [value];
}
