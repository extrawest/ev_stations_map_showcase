import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/themes.dart';

class SearchNoResultWidget extends StatelessWidget {
  const SearchNoResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(88, 48, 88, 24),
          child: SvgPicture.asset(searchNoResults),
        ),
        Text(
          'Sorry, no results found',
          style: TextStyles.textWalletStyle
              .copyWith(color: AppColors.greyTextColor),
        ),
      ],
    );
  }
}
