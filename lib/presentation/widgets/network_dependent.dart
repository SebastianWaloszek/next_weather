import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_next_weather/common/blocs/network/network_bloc.dart';
import 'package:flutter_next_weather/common/utils/injector.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';
import 'package:flutter_next_weather/presentation/widgets/network_error_message.dart';
import 'package:flutter_next_weather/presentation/widgets/loading_indicator.dart';

/// This widget handles network dependent errors with a dedicated error view.
class NetworkDependent extends StatelessWidget {
  /// Widget to be drawn when no network errors occur.
  final Widget child;

  final bool disableLoadingIndicator;

  /// Function to be executed when network becomes available again
  /// or user wishes to retry the request upon an unexpected error.
  final void Function() onNetworkRetry;

  const NetworkDependent({
    Key key,
    @required this.child,
    this.disableLoadingIndicator,
    this.onNetworkRetry,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _buildBlocBuilder();

  Widget _buildBlocBuilder() {
    return BlocBuilder<NetworkBloc, NetworkState>(
      cubit: Injector.resolve<NetworkBloc>(),
      builder: (context, state) {
        if (state is NetworkIsEvaluatingState && !disableLoadingIndicator) {
          return LoadingIndicator();
        } else if (state is NetworkUnavailableState) {
          return _buildNetworkUnavailableMessage(context);
        } else if (state is UnexpectedNetworkErrorState) {
          return _buildUnexpectedErrorMessage(context);
        } else {
          return child;
        }
      },
    );
  }

  Widget _buildNetworkUnavailableMessage(BuildContext context) {
    return _buildErrorMessage(
      onTap: onNetworkRetry,
      title: AppLocalizations.of(context).noInternetFound(),
      subtitle: AppLocalizations.of(context).tapToTryAgain(),
    );
  }

  Widget _buildUnexpectedErrorMessage(BuildContext context) {
    return _buildErrorMessage(
      onTap: onNetworkRetry,
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
