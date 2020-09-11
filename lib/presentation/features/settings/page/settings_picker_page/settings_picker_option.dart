import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SettingsPickerOption<T> extends Equatable {
  final T value;
  final String description;

  const SettingsPickerOption({
    @required this.value,
    @required this.description,
  })  : assert(value != null),
        assert(description != null);

  @override
  List<Object> get props => [
        value,
        description,
      ];
}
