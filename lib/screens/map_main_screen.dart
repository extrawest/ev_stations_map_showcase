import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volkhov_maps_app/theme/assets.dart';

import '../widgets/widgets.dart';

class MapMainScreen extends StatelessWidget {
  const MapMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
        home: Scaffold(
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              mapMainImage,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 43,
                ),
                child: CustomTextField(
                  hint: 'Type here',
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
