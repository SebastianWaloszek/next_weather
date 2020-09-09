import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/day_weather_prediction_list.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_details.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_summary.dart';
import 'package:flutter_next_weather/presentation/page/page_body.dart';
import 'package:flutter_next_weather/presentation/page/scrollable_page_body_state.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';
import 'package:flutter_next_weather/presentation/widgets/loading_indicator.dart';

import 'home_page_body_parameters.dart';
import 'states/mobile_home_page_body_state.dart';
import 'states/web_home_page_body_state.dart';

class HomePageBody extends PageBody<HomePageBodyParameters> {
  const HomePageBody(HomePageBodyParameters parameters) : super(parameters);

  @override
  State<HomePageBody> createMobileState() => MobileHomePageBodyState();

  @override
  State<HomePageBody> createWebState() => WebHomePageBodyState();
}

abstract class HomePageBodyState extends ScrollablePageBodyState<HomePageBody> {
  HomePageBodyParameters get parameters => widget.parameters;

  Future<void> _onPageRefresh() {
    parameters.loadWeatherForecast();
    return parameters.refreshCompleter.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildContent(),
      ),
    );
  }

  Widget buildContent() {
    if (parameters.wasLoadedOnce) {
      return _buildRefreshableScroll();
    } else {
      return LoadingIndicator();
    }
  }

  Widget _buildRefreshableScroll() {
    return RefreshIndicator(
      onRefresh: _onPageRefresh,
      child: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: _buildWeatherForecast(),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherForecast() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildWeatherSummary(),
        _buildWeatherDetails(),
        _buildDayWeatherPredictionList(),
      ],
    );
  }

  Widget _buildWeatherSummary() {
    return WeatherSummary(
      margin: const EdgeInsets.symmetric(horizontal: AppThemeConstants.horizontalPagePadding),
      weatherPrediction: parameters.selectedWeatherPrediction,
      location: parameters.weatherForecast.location,
      onLocationTapped: parameters.changeLocation,
    );
  }

  Widget _buildWeatherDetails() {
    return WeatherDetails(weather: parameters.selectedWeatherPrediction.weather);
  }

  Widget _buildDayWeatherPredictionList() {
    return DayWeatherPredictionList(
      weatherPredictions: parameters.weatherForecast.weatherPredictions,
      selectedWeatherPrediction: parameters.selectedWeatherPrediction,
      onItemSelected: parameters.selectWeatherPredition,
    );
  }
}
