import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../theme/themes.dart';
import 'widgets.dart';

class BodyBottomSheetWidget extends StatefulWidget {
  final MapType mapType;
  final Function() onClose;
  const BodyBottomSheetWidget({
    Key? key,
    required this.mapType,
    required this.onClose,
  }) : super(key: key);

  @override
  State<BodyBottomSheetWidget> createState() => _BodyBottomSheetWidgetState();
}

class _BodyBottomSheetWidgetState extends State<BodyBottomSheetWidget> {
  late MapType selectedtype;

  @override
  void initState() {
    selectedtype = widget.mapType;
    super.initState();
  }

  @override
  void dispose() {
    widget.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 368.0,
      color: Colors.transparent,
      child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 0),
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 67,
                height: 4,
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.separatorGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'Map Type',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 34,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          selectedtype = MapType.normal;
                        }),
                        child: Column(
                          children: [
                            Container(
                                // width: 159,
                                height: 88,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: selectedtype == MapType.normal
                                        ? Border.all(color: AppColors.blueColor)
                                        : null),
                                child: Image.asset(defaultMap)),
                            const SizedBox(height: 11),
                            const Text(
                              'Default',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          selectedtype = MapType.satellite;
                        }),
                        child: Column(
                          children: [
                            Container(
                                height: 88,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: selectedtype == MapType.satellite
                                        ? Border.all(color: AppColors.blueColor)
                                        : null),
                                child: Image.asset(satelliteMap)),
                            const SizedBox(height: 11),
                            const Text(
                              'Satellite',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.dividerColor,
                height: 1,
              ),
              CustomButton(
                caption: 'Apply',
                onTap: () => Navigator.pop(context, selectedtype),
              ),
            ],
          )),
    );
  }
}
