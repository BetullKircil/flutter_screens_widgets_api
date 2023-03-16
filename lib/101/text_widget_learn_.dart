import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView({super.key, this.surname});
  final String name = "Betul Kircil";

  final String? surname; //nullable
  static ProjectKeys keys = ProjectKeys();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(("Welcome $name and name's length is ${name.length}" * 10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: ProjectStyles.WelcomeStyle),
          Text(
            "Hi ${name}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                color: Colors.purple,
                decoration: TextDecoration.overline,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic),
          ),
          Text(surname ??
              ''), //null safety kullanılıyor surname null ise bosluk koy

          Text(("$name and name's length is ${name.length}" * 10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: ProjectColors.WelcomeColor)),
          Text(keys.welcome) //theme text file used
        ],
      )),
    );
  }
}

class ProjectStyles {
  static TextStyle WelcomeStyle = TextStyle(
      letterSpacing: 1,
      wordSpacing: 2,
      fontSize: 25,
      color: Color.fromARGB(96, 0, 0, 0),
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic);
}

class ProjectColors {
  static Color WelcomeColor = Colors.pink;
}

class ProjectKeys {
  final String welcome = "Merhaba";
}
