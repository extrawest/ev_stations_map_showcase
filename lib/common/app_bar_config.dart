import 'package:flutter/material.dart';

AppBar defaultAppBar(BuildContext context, String titleText) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.background,
    centerTitle: true,
    title: Text(
      titleText,
      style: Theme.of(context).textTheme.titleLarge,
    ),
    elevation: 3,
    iconTheme: Theme.of(context).iconTheme,
  );
}
