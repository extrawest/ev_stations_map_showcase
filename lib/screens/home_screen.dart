import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volkhov_maps_app/common/app_bar_config.dart';
import 'package:volkhov_maps_app/routes.dart';

import '../logic/bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, 'Home screen'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ElevatedButton(
            //   onPressed: () async {
            //     Navigator.pushNamed(context, webMap);
            //   },
            //   child: const Text('Google map'),
            // ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, mapMainScreenRoute);
              },
              child: const Text('main screen'),
            ),
            SizedBox(
              height: 200,
              child: BlocBuilder<ChargestationsBloc, ChargestationsState>(
                  builder: (context, state) {
                if (state is ChargestationsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChargestationsLoaded) {
                  return Text(state.stationslist.toString());
                } else {
                  return const Center(
                    child: Text('Error ChargestationsBloc'),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
