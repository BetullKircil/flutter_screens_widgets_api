import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/101/scaffold_learn.dart';
import 'package:flutter_deneme_somestr/201/package/launch_manager.dart';
import 'package:flutter_deneme_somestr/201/package/loading_bar.dart';
import 'package:flutter_deneme_somestr/201/password_textfield_learn.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin, LaunchMixin {
  //Launch Mixin'i interface gibi kullandık
  // final spinkit = SpinKitSquareCircle(
  //   color: Colors.white,
  //   size: 50.0,
  //   controller: AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 1200)),
  // );
  @override
  Widget build(BuildContext context) {
    var data = "Select";
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            FloatingActionButton(
                backgroundColor:
                    Theme.of(context).buttonTheme.colorScheme?.onPrimary,
                onPressed: () {
                  LaunchUrl("https://flutter.dev");
                  // Future<void> _launchUrl(String url) async {
                  //   if (!await launchUrl(Uri.parse(url))) {
                  //     throw Exception('Could not launch $url');
                  //   }
                  // }
                },
                child: Text("url launch button")),
            LoadingBarView(size: 60),
            PasswordTextFieldLearn()

            // Text("wdml",
            //     style: Theme.of(context)
            //         .textTheme
            //         .headline3
            //         ?.copyWith(color: Colors.amber)),

            // CheckboxListTile(
            //   value: true,
            //   onChanged: (val) {},
            //   title: Text(data),
            // )
          ],
        ));
  }
}
