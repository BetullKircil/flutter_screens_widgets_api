import 'dart:convert';

import 'package:flutter_deneme_somestr/201/cache/shared_manager.dart';
import 'package:flutter_deneme_somestr/201/cache/shared_preferences_learn.dart';
import 'package:flutter_deneme_somestr/201/cache/user_cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  void SaveItems(final List<User> items) {
    final _items = items.map((obje) => jsonEncode(obje.toJson())).toList();
    sharedManager.SaveStringItems(SharedKeys.users, _items);
  }

  List<User>? GetItems() {
    final itemsJson = sharedManager.GetStringList(SharedKeys.users);
    if (itemsJson?.isNotEmpty ?? false) {
      return itemsJson!.map((e) {
        final jsonObject = jsonDecode(e);
        return User();
      }).toList();
    }
    return null;
  }
}
