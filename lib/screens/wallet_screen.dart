import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'package:volkhov_maps_app/models/wallet_model.dart';

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
          if (state is WalletLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WalletLoaded) {
            final wallet = state.walletData;
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
                    centerTitle: true,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '\$ ${wallet.balance}',
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
                      final historyItem = wallet.history?[index];

                      return WalletHistoryItem(
                        historyItem: historyItem,
                      );
                    },
                    childCount: wallet.history?.length,
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: Container(
                    height: 140,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('Error getting Wallet information'),
            );
          }
        },
      ),
    );
  }
}

class WalletHistoryItem extends StatelessWidget {
  const WalletHistoryItem({
    super.key,
    required this.historyItem,
  });

  final History? historyItem;

  @override
  Widget build(BuildContext context) {
    final dateTime = getDateTime('${historyItem?.datetimeStarted}');
    final differenceTime = getDifference(
      '${historyItem?.datetimeFinished}',
      '${historyItem?.datetimeStarted}',
    );
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      color: AppColors.whiteColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  '${historyItem?.stationName}',
                  style: TextStyles.textWalletStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Text(
                  dateTime,
                  style: TextStyles.smallTextStyle
                      .copyWith(color: AppColors.greyTextColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${historyItem?.consumedKwh?.toStringAsFixed(2)} kWh  |  $differenceTime',
                style: TextStyles.smallTextStyle.copyWith(
                  color: AppColors.activeBottomBarButton,
                ),
              ),
              Text(
                '-\$${historyItem?.bill?.toStringAsFixed(2)}',
                style: TextStyles.textStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  String getDateTime(String data) {
    String result = 'undefinet';
    final inputFormat = DateFormat('yyyy-dd-MMTHH:mm:ss');

    if (data != '') {
      final inputDate = inputFormat.parse(data);

      final outputFormat = DateFormat('dd MMMM yyyy, HH:mm', 'en');
      result = outputFormat.format(inputDate);
    }

    return result;
  }

  String getDifference(String statrtDateTime, endDateTime) {
    String result = 'undefined';
    if (statrtDateTime != '' && endDateTime != '') {
      final dt1 = DateTime.parse(statrtDateTime);
      final dt2 = DateTime.parse(endDateTime);

      final diff = dt1.difference(dt2);
      int minutes = diff.inMinutes;
      final hours = minutes ~/ 60;
      minutes = minutes - hours * 60;
      result = '${hours}h ${minutes}m';
    }
    return result;
  }
}
