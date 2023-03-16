import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  // mixinler, constructoru olmayan classlardir, interface gibi de kullanılır
  Future<void> LaunchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await LaunchUrl(url); // herhangi bir url'e rout
    }
  }
}
