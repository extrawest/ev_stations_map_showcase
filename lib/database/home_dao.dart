import 'dart:async';

import 'package:volkhov_maps_app/database/app_database.dart';
import 'package:volkhov_maps_app/database/dao_api.dart';
import 'package:volkhov_maps_app/models/item_model.dart';
import 'package:sembast/sembast.dart';

typedef DatabaseSnapshotList
    = List<RecordSnapshot<String?, Map<String, dynamic>>>;

class HomeDao implements DaoApi<Item?> {
  static const String homeStore = 'home_store';

  final appColorThemeKey = 'colorTheme';

  final StoreRef<String?, Map<String, Object?>> _homeStore =
      stringMapStoreFactory.store(homeStore);

  Future<Database> get _db async => AppDatabase.instance.database;

  Future clearArtStore() async {}

  @override
  Future<void> delete(Item? model) async {
    final finder = Finder(filter: Filter.byKey(model!.key));
    await _homeStore.delete(await _db, finder: finder);
  }

  @override
  Future<Item?> get(String key) async {
    final finder = Finder(filter: Filter.byKey(key));
    final RecordSnapshot? recordSnapshot =
        await _homeStore.findFirst(await _db, finder: finder);
    return recordSnapshot != null
        ? Item.fromJson(recordSnapshot.value as Map<String, dynamic>)
        : null;
  }

  @override
  Future<List<Item>> getAll() async {
    final recordSnapshots = await _homeStore.find(await _db);
    return recordSnapshots
        .map((snapshot) => Item.fromJson(snapshot.value))
        .toList();
  }

  @override
  Future<void> save(Item? model) async {
    await _homeStore.record(model!.key).put(await _db, model.toJson());
  }

  @override
  Future<void> update(Item? model) async {
    final finder = Finder(filter: Filter.byKey(model!.key));
    await _homeStore.update(await _db, model.toJson(), finder: finder);
  }

  @override
  Future<void> clearStore() async {
    await _homeStore.delete(await _db);
  }

  /// The data type in [onDataChanged] functions should match the type of the [_homeStore]
  /// In our case we [_homeStore] is [intMapStoreFactory], so one element of the resulting list
  /// should be RecordSnapshot<int?, Map<String, dynamic>>
  Future<StreamSubscription> listenToUpdates(
      Function(DatabaseSnapshotList) onDataChanged) async {
    final db = await _db;
    final query = _homeStore.query();
    final subscription = query.onSnapshots(db).listen((snapshots) {
      // snapshots always contains the list of records matching the query
      onDataChanged(snapshots);
    });

    return subscription;
  }

  static List<Item> snapshotsToItemsList(DatabaseSnapshotList snapshots) {
    return snapshots.map((snapshot) => Item.fromJson(snapshot.value)).toList();
  }

  Future<String?> getBrightnessSavedSettings() async {
    return (await get(appColorThemeKey))?.value;
  }
}
