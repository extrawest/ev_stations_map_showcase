import 'package:flutter/material.dart';
import 'package:volkhov_maps_app/theme/theme.dart';

List<BoxShadow> get commonShadow {
  return [
    const BoxShadow(
        color: greyLight, offset: Offset(0, 2), blurRadius: 1, spreadRadius: 0),
    const BoxShadow(
        color: greyLight, offset: Offset(0, 4), blurRadius: 3, spreadRadius: 0),
    const BoxShadow(
        color: greyLight, offset: Offset(0, 8), blurRadius: 5, spreadRadius: 0),
  ];
}
