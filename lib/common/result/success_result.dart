import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:meta/meta.dart';

import 'result.dart';

class SuccessResult<S, F extends Failure> extends Result<S, F> {
  final S _value;

  SuccessResult(this._value);

  @override
  R fold<R>({@required R Function(S) onSuccess, @required R Function(F) onFailure}) => onSuccess(_value);

  @override
  bool operator ==(dynamic other) => other is SuccessResult && other._value == _value;

  @override
  int get hashCode => _value.hashCode;
}