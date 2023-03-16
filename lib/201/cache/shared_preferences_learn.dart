import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/201/cache/shared_manager.dart';
import 'package:flutter_deneme_somestr/201/cache/user_cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLearn extends StatefulWidget {
  const SharedPreferencesLearn({super.key});

  @override
  State<SharedPreferencesLearn> createState() => _SharedPreferencesLearnState();
}

class _SharedPreferencesLearnState
    extends LoadingStatefull<SharedPreferencesLearn> {
  late final SharedManager _sharedManager;
  late final List<User> userItems;
  @override
  void initState() {
    super.initState();
    _sharedManager = SharedManager();
    userItems = UserItems().users;
    _initialize();
  }

  void _initialize() {
    changeLoading();
    _sharedManager.init();
    changeLoading();
  }

  Future<void> GetDefaultValues() async {
    _onChangeValue(_sharedManager.GetString(SharedKeys.counter) ?? "");
  }

  int _currentValue = 0;

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          isLoading
              ? Center(child: CircularProgressIndicator())
              : SizedBox.shrink()
        ],
      ),
      body: Column(children: [
        TextField(
          onChanged: (value) {
            _onChangeValue(value);
          },
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () async {
                changeLoading();
                await _sharedManager.SaveString(
                    SharedKeys.counter, _currentValue.toString());
                changeLoading();
              },
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () async {
                await _sharedManager.Remove(SharedKeys.counter);
              },
              child: Icon(Icons.remove),
            )
          ],
        ),
        Expanded(
          child: _usersListView(),
        )
      ]),
    );
  }
}

class _usersListView extends StatelessWidget {
  _usersListView({
    Key? key,
  }) : super(key: key);

  late final List<User> users = UserItems().users;

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

class UserItems {
  late final List<User> users;
  UserItems() {
    //constructor
    users = [User(), User(), User()];
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
