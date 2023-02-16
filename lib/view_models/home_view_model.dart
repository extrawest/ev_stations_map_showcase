// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:volkhov_maps_app/database/home_dao.dart';
// import 'package:volkhov_maps_app/models/item_model.dart';

// class HomeViewModel extends ChangeNotifier {
//   late HomeDao _homeDao;
//   List<Item> _inMemoryItemsList = [];
//   StreamSubscription? _dbSubscription;

//   int _counter = 0;

//   int get counter => _counter;

//   HomeViewModel() {
//     _init();
//   }

//   void _init() {
//     _homeDao = HomeDao();
//     _listenToOffersUpdates();
//   }

//   List<Item> get inMemoryItemsList => _inMemoryItemsList;

//   void incrementCounter() {
//     _counter++;
//     notifyListeners();
//   }

//   Future<void> insertItem(Item item) async {
//     await _homeDao.save(item);
//   }

//   Future<List<Item>> getAllItems() async {
//     return _homeDao.getAll();
//   }

//   Future<void> updateItem(Item item) async {
//     await _homeDao.update(item);
//   }

//   Future<void> deleteItem(Item item) async {
//     await _homeDao.delete(item);
//   }

//   Future<void> _listenToOffersUpdates() async {
//     _dbSubscription =
//         await _homeDao.listenToUpdates((DatabaseSnapshotList snapshots) {
//       _inMemoryItemsList = HomeDao.snapshotsToItemsList(snapshots);
//       notifyListeners();
//     });
//   }

//   @override
//   void dispose() {
//     _dbSubscription?.cancel();
//     super.dispose();
//   }
// }
