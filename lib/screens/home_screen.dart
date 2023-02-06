import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volkhov_maps_app/common/app_bar_config.dart';
import 'package:volkhov_maps_app/routes.dart';

import '../generated/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, tr(LocaleKeys.app_bar_title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, mapScreenRoute);
              },
              child: Text(tr(LocaleKeys.google_map)),
            ),
            BlocConsumer(
                listener: (context, state) {},
                builder: (context, state) {
                  return TextController(
                    text: state.text,
                  );
                })
          ],
        ),
      ),
    );
  }
}
