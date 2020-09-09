import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Location extends Equatable {
  final String title;

  const Location({
    @required this.title,
  }) : assert(title != null);

  @override
  List<Object> get props => [title];
}
