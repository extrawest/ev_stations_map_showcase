import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volkhov_maps_app/widgets/widgets.dart';

import '../logic/bloc/bloc.dart';
import '../theme/themes.dart';

class ProfileWidget extends StatefulWidget {
  final Function() onLogOut;
  const ProfileWidget({super.key, required this.onLogOut});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final userController = TextEditingController();
  final mailController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final authState = context.read<AuthBloc>().state;
      final user = (authState is AuthAutorized) ? authState.user : null;
      userController.text = '${user?.displayName}';
      mailController.text = '${user?.email}';
    });

    super.initState();
  }

  @override
  void dispose() {
    userController.dispose();
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 52, bottom: 158, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 100),
                  Text(
                    'Profile',
                    style: TextStyles.headerTextStyle
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 100,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Save',
                        style: TextStyles.textStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.activeBottomBarButton,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Image.asset(profilePhotoPng),
                    const SizedBox(height: 36),
                    Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyles.textWalletStyle.copyWith(
                            color: AppColors.greyTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      prefixIcon: SvgPicture.asset(userSvg),
                      textEditingController: userController,
                      style: TextStyles.textWalletStyle.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      children: [
                        Text(
                          'Email',
                          style: TextStyles.textWalletStyle.copyWith(
                            color: AppColors.greyTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      prefixIcon: SvgPicture.asset(mailSvg),
                      textEditingController: mailController,
                      style: TextStyles.textWalletStyle.copyWith(
                        color: AppColors.blackColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomButton(
              onTap: widget.onLogOut,
              caption: 'Log out',
              backgroundColor: AppColors.lightGrey,
              style: TextStyles.textStyle.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
