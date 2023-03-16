import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/201/cache/shared_manager.dart';
import 'package:flutter_deneme_somestr/201/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_deneme_somestr/201/cache/user_cache/user_model.dart';

import '../shared_preferences_learn.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  late final UserCacheManager userCacheManager;
  final List<User> items = UserItems().users;

  @override
  void initState() {
    super.initState();
    final SharedManager manager = SharedManager();
    manager.init().whenComplete(() {
      userCacheManager = UserCacheManager(manager);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? CircularProgressIndicator() : SizedBox.shrink(),
        actions: [
          IconButton(
              onPressed: () {
                changeLoading();
                userCacheManager.SaveItems(items);
                changeLoading();
              },
              icon: Icon(Icons.save)),
          IconButton(onPressed: () {}, icon: Icon(Icons.remove))
        ],
      ),
      body: _usersListView(users: items),
    );
  }
}

class _usersListView extends StatelessWidget {
  _usersListView({Key? key, required this.users}) : super(key: key);

  late final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(users[index].name ?? ""),
              subtitle: Text(users[index].description ?? ""),
              trailing: Text(
                users[index].url ?? "",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(decoration: TextDecoration.underline),
              ),
            ),
          );
        });
  }
}
