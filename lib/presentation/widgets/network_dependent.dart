import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';
import 'package:flutter_next_weather/presentation/widgets/network_error_message.dart';

/// This widget handles failures with a dedicated error view.
class FailureDependent extends StatelessWidget {
  /// Widget to be drawn when no errors occur.
  final Widget child;

  final Failure failure;

  /// Function to be executed when user wishes to retry the request upon an unexpected error.
  final void Function() onRetry;

  const FailureDependent({
    Key key,
    @required this.child,
    this.failure,
    this.onRetry,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        return _buildNetworkUnavailableMessage(context);
      case UnexpectedFailure:
        return _buildUnexpectedErrorMessage(context);
      default:
        return child;
    }
  }

  Widget _buildNetworkUnavailableMessage(BuildContext context) {
    return _buildErrorMessage(
      onTap: onRetry,
      title: AppLocalizations.of(context).noInternetFound(),
      subtitle: AppLocalizations.of(context).tapToTryAgain(),
    );
  }

  Widget _buildUnexpectedErrorMessage(BuildContext context) {
    return _buildErrorMessage(
      onTap: onRetry,
      title: AppLocalizations.of(context).unexpectedError(),
      subtitle: AppLocalizations.of(context).tapToTryAgain(),
    );
  }

  Widget _buildErrorMessage({
    @required void Function() onTap,
    @required String title,
    @required String subtitle,
  }) {
    return InkWell(
      onTap: onTap,
      child: NetworkErrorMessage(
        title: title,
        subtitle: subtitle,
      ),
    );
  }
}
