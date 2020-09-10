import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/day_weather_prediction_list.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/home_page_header.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_details.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_summary.dart';
import 'package:flutter_next_weather/presentation/page/page_body.dart';
import 'package:flutter_next_weather/presentation/page/scrollable_page_body_state.dart';
import 'package:flutter_next_weather/presentation/theme/device.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';
import 'package:flutter_next_weather/presentation/widgets/loading_indicator.dart';
import 'package:flutter_next_weather/presentation/widgets/network_dependent.dart';
import 'package:flutter_next_weather/presentation/widgets/screen_dependent.dart';

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
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!Device.isWidescreen(context)) _buildHeader(),
          Expanded(child: _buildRefreshableScroll()),
        ],
      )),
    );
  }

  Widget _buildRefreshableScroll() {
    return RefreshIndicator(
      onRefresh: _onPageRefresh,
      child: _buildCustomScrollView(),
    );
  }

  Widget _buildCustomScrollView() {
    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: _buildWeatherForecast(),
        ),
      ],
    );
  }

  Widget _buildWeatherForecast() {
    return NetworkDependent(
      disableLoadingIndicator: parameters.wasLoadedOnce,
      onNetworkRetry: parameters.loadWeatherForecast,
      child: _buildScreenDependentForecast(),
    );
  }

  Widget _buildScreenDependentForecast() {
    if (parameters.wasLoadedOnce) {
      return ScreenDependent(
        wide: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _getPageBodyChildren(),
          ),
        ),
        narrow: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _getPageBodyChildren(),
        ),
      );
    } else {
      return Container();
    }
  }

  List<Widget> _getPageBodyChildren() {
    return [
      _buildWeatherSummary(),
      _buildWeatherDetails(),
      _buildDayWeatherPredictionList(),
    ];
  }

  Widget _buildHeader({double bottomOffset = 30}) {
    return HomePageHeader(
      margin: EdgeInsets.only(
        left: AppThemeConstants.horizontalPagePadding,
        right: AppThemeConstants.horizontalPagePadding,
        bottom: bottomOffset,
        top: 30,
      ),
      weatherPrediction: parameters.selectedWeatherPrediction,
    );
  }

  Widget _buildWeatherSummary() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Device.isWidescreen(context)) _buildHeader(bottomOffset: 0),
          WeatherSummary(
            margin: const EdgeInsets.symmetric(
              horizontal: AppThemeConstants.horizontalPagePadding,
              vertical: 50,
            ),
            weatherPrediction: parameters.selectedWeatherPrediction,
            location: parameters.weatherForecast.location,
            onLocationTapped: parameters.changeLocation,
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetails() {
    return WeatherDetails(
      weather: parameters.selectedWeatherPrediction.weather,
      scrollDirection: Device.isWidescreen(context) ? Axis.vertical : Axis.horizontal,
    );
  }

  Widget _buildDayWeatherPredictionList() {
    final double size = 250;
    return Container(
      height: size,
      width: Device.isWidescreen(context) ? size : null,
      child: DayWeatherPredictionList(
        scrollDirection: Device.isWidescreen(context) ? Axis.vertical : Axis.horizontal,
        weatherPredictions: parameters.weatherForecast.weatherPredictions,
        selectedWeatherPrediction: parameters.selectedWeatherPrediction,
        onItemSelected: parameters.selectWeatherPredition,
      ),
    );
  }
}