import 'package:flutter/material.dart';

mixin PageUtils {
    Widget buildLoadingIndicator() {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}