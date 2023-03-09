import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bloc/bloc.dart';
import '../theme/themes.dart';
import '../widgets/widgets.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteState = context.watch<FavoritesBloc>().state;

    final chargestationState = context.watch<ChargestationsBloc>().state;
    return CustomScrollView(
      slivers: <Widget>[
        SliverFixedExtentList(
          itemExtent: 108,
          delegate: SliverChildListDelegate(
            [
              const Align(
                child: Padding(
                  padding: EdgeInsets.only(top: 52),
                  child: Text(
                    'Favorites',
                    style: TextStyles.headerTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (chargestationState is ChargestationsError)
          SliverFixedExtentList(
            itemExtent: 56,
            delegate: SliverChildListDelegate(
              [
                const Center(child: Text('Error')),
              ],
            ),
          ),
        if (chargestationState is ChargestationsLoading)
          SliverFixedExtentList(
            itemExtent: 56,
            delegate: SliverChildListDelegate(
              [
                const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        if (chargestationState is ChargestationsLoaded)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (favoriteState is FavoritesLoaded) {
                  final favoriteId = favoriteState.favoriteIds[index];
                  final favoriteItem = chargestationState.stationslist
                      .firstWhere((element) => element.stationId == favoriteId);
                  return FavoriteItemWidget(
                    item: favoriteItem,
                  );
                } else if (favoriteState is FavoritesError) {
                  return Text('Favorites error: ${favoriteState.error}');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
              childCount: (favoriteState is FavoritesLoaded)
                  ? favoriteState.favoriteIds.length
                  : 0,
            ),
          ),
      ],
    );
  }
}
