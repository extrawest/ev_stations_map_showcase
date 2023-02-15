import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bloc/bloc.dart';
import '../theme/themes.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                stretch: true,
                floating: true,
                pinned: true,
                snap: true,
                backgroundColor: AppColors.lightBlue,
                expandedHeight: 167,
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '\$ 100.23',
                        style: TextStyles.headerTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  background: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Wallet',
                          style: TextStyles.headerTextStyle,
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Balance',
                          style: TextStyles.smallTextStyle,
                        ),
                        SizedBox(height: 52),
                      ],
                    ),
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 56,
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'History',
                          style: TextStyles.headerTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Station name',
                                style: TextStyles.textWalletStyle,
                              ),
                              Text(
                                '11 August 2021, 21:03',
                                style: TextStyles.textWalletStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 2,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
