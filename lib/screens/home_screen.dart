import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volkhov_maps_app/common/app_bar_config.dart';
import 'package:volkhov_maps_app/theme/theme.dart';
import 'package:volkhov_maps_app/view_models/home_view_model.dart';
import 'package:volkhov_maps_app/view_models/posts_view_model.dart';
import 'package:volkhov_maps_app/view_models/theme_view_model.dart';

import '../generated/locale_keys.g.dart';
import '../main.dart';
import '../theme/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final postsProvider = context.watch<PostsViewModel>();
    final homeProvider = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: defaultAppBar(context, tr(LocaleKeys.app_bar_title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(tr(LocaleKeys.resolution_aware_img),
              textAlign: TextAlign.center),
          Image.asset(icMap),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _buildChangeLangButton(
                tr(LocaleKeys.language_english), englishLocale),
            _buildChangeLangButton(
                tr(LocaleKeys.language_ukrainian), ukrainianLocale),
          ]),
          _buildChangeThemeToggle(),
          ElevatedButton(
            onPressed: () async {
              await postsProvider.fetchPosts();
            },
            child: Text(tr(LocaleKeys.fetch_posts)),
          ),
          Text(
            plural(LocaleKeys.plural, homeProvider.counter),
            textAlign: TextAlign.center,
            style: TextStyles.notifierTextLabel
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          Text(
            postsProvider.postsText,
            textAlign: TextAlign.center,
            style: TextStyles.notifierTextLabel
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => homeProvider.incrementCounter(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildChangeThemeToggle() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.read<ThemeViewModel>().switchTheme(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            tr(LocaleKeys.theme_change_theme),
            style: Theme.of(context).textTheme.headline4,
          ),
          Center(
              child: Text(
                  tr(context.watch<ThemeViewModel>().themeLabel).toUpperCase()))
        ]),
      ),
    );
  }

  ElevatedButton _buildChangeLangButton(String languageName, Locale locale) {
    return ElevatedButton(
      onPressed: () {
        context.setLocale(locale);
      },
      child: Text(languageName),
    );
  }
}
