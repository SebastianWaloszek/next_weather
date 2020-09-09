import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/page/page_body.dart';
import 'package:flutter_next_weather/presentation/page/scrollable_page_body_state.dart';
import 'package:flutter_next_weather/presentation/widgets/page_utils.dart';

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

abstract class HomePageBodyState extends ScrollablePageBodyState<HomePageBody> with PageUtils {
  HomePageBodyParameters get parameters => widget.parameters;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text('home page')), // TODO: Replace placeholder
      ),
    );
  }
}
