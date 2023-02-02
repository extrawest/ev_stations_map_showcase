import 'package:flutter/material.dart';

AppBar defaultAppBar(BuildContext context, String titleText) {
  return AppBar(
    backgroundColor: Theme.of(context).backgroundColor,
    centerTitle: true,
    title: Text(titleText, style: Theme.of(context).textTheme.headline6,),
    elevation: 3,
    iconTheme: Theme.of(context).iconTheme,
  );
}
