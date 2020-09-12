import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_page.dart';
import 'package:flutter_next_weather/presentation/mixins/refreshable.dart';

import '../../../../common/utils/injector.dart';
import '../bloc/home_page_bloc.dart';

import 'home_page_body.dart';
import 'home_page_body_parameters.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RefreshablePage {
  HomePageBloc get pageBloc => Injector.resolve();

  bool wasLoadedOnce = false;

  @override
  void initState() {
    super.initState();
    initRefreshCompleter();
    _loadHomePage();
  }

  void _loadHomePage() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      pageBloc.add(LoadHomePageEvent());
    });
  }

  void _changeLocation() {
    //TODO: Implement such functionality in the future
  }

  void _selectWeatherPredition(WeatherPrediction weatherPrediction) {
    pageBloc.add(SelectWeatherPreditionEvent(weatherPrediction));
  }

  void _handlePageWasLoaded() {
    setState(() {
      wasLoadedOnce = true;
      handleRefreshCompletion();
    });
  }

  void _openSettings() {
    Navigator.of(context).pushNamed(SettingsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      cubit: pageBloc,
      listener: _buildBlocListener,
      builder: _buildBlocBuilder,
    );
  }

  void _buildBlocListener(BuildContext context, HomePageState state) {
    if (state is LoadedHomePageState) {
      _handlePageWasLoaded();
    } else if (state is FailedHomePageState) {
      handleRefreshCompletion();
      setState(() {
        wasLoadedOnce = false;
        handleRefreshCompletion();
      });
    }
  }

  Widget _buildBlocBuilder(BuildContext context, HomePageState state) {
    return HomePageBody(
      HomePageBodyParameters(
        context,
        weatherForecast: state.weatherForecast,
        loadWeatherForecast: _loadHomePage,
        selectWeatherPredition: _selectWeatherPredition,
        selectedWeatherPrediction: state.selectedWeatherPrediction,
        openSettings: _openSettings,
        wasLoadedOnce: wasLoadedOnce,
        refreshCompleter: refreshCompleter,
        changeLocation: _changeLocation,
      ),
    );
  }
}
