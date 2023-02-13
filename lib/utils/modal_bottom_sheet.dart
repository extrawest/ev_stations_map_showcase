import 'package:flutter/material.dart';

import '../common/enum.dart';
import '../theme/themes.dart';

void modalBottomSheetMenu(
    {required BuildContext context, MapType mapType = MapType.defaultType}) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (builder) {
        return BodyBottomSheetWidget(
          mapType: mapType,
        );
      });
}

class BodyBottomSheetWidget extends StatefulWidget {
  final MapType mapType;
  const BodyBottomSheetWidget({super.key, thi, required this.mapType});

  @override
  State<BodyBottomSheetWidget> createState() => _BodyBottomSheetWidgetState();
}

class _BodyBottomSheetWidgetState extends State<BodyBottomSheetWidget> {
  late MapType selectedtype;

  @override
  void initState() {
    selectedtype = widget.mapType;
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
                  topRight: Radius.circular(10.0))),
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
                    GestureDetector(
                      onTap: () => setState(() {
                        selectedtype = MapType.defaultType;
                      }),
                      child: Column(
                        children: [
                          Container(
                              width: 159,
                              height: 88,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: selectedtype == MapType.defaultType
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
                    GestureDetector(
                      onTap: () => setState(() {
                        selectedtype = MapType.satelliteType;
                      }),
                      child: Column(
                        children: [
                          Container(
                              width: 159,
                              height: 88,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: selectedtype == MapType.satelliteType
                                      ? Border.all(color: AppColors.blueColor)
                                      : null),
                              child: Image.asset(satelliteMap)),
                          const SizedBox(height: 11),
                          const Text(
                            'Default',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppColors.dividerColor,
                height: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.activeBottomBarButton,
                ),
                child: const Text(
                  'Apply',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ),
              ),
            ],
          )),
    );
  }
}
