import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bloc/bloc.dart';
import '../theme/themes.dart';
import '../widgets/widgets.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favoriteIds = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChargestationsBloc, ChargestationsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 108,
              delegate: SliverChildListDelegate(
                [
                  const Align(
                    child: Padding(
                      padding: EdgeInsets.only(top: 52),
                      child:
                          Text('Favorites', style: TextStyles.headerTextStyle),
                    ),
                  ),
                ],
              ),
            ),
            if (state is ChargestationsError)
              SliverFixedExtentList(
                itemExtent: 56,
                delegate: SliverChildListDelegate(
                  [
                    const Center(child: Text('Error')),
                  ],
                ),
              ),
            if (state is ChargestationsLoading)
              SliverFixedExtentList(
                itemExtent: 56,
                delegate: SliverChildListDelegate(
                  [
                    const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            if (state is ChargestationsLoaded)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final favoriteItem = state.stationslist.first; //[index];

                    return FavoriteItemWidget(
                      item: favoriteItem,
                    );
                  },
                  childCount: 1, //favoriteIds.length,
                ),
              ),
          ],
        );
      },
    );
  }
}
