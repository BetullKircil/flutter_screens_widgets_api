import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PasswordTextFieldLearn extends StatefulWidget {
  const PasswordTextFieldLearn({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextFieldLearn> createState() => _PasswordTextFieldLearnState();
}

class _PasswordTextFieldLearnState extends State<PasswordTextFieldLearn> {
  bool isSeccure = true;
  void changeLoading() {
    isSeccure = !isSeccure;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        autofillHints: [AutofillHints.password],
        keyboardType: TextInputType.visiblePassword,
        obscureText: isSeccure,
        obscuringCharacter: "*",
        decoration: InputDecoration(
            labelText: "Password",
            labelStyle: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.blue),
            border: UnderlineInputBorder(),
            hintText: "Password",
            fillColor: Colors.amber,
            suffixIcon: IconButton(
                onPressed: changeLoading, icon: _animatedVisibilityChange())));
  }

  AnimatedCrossFade _animatedVisibilityChange() {
    return AnimatedCrossFade(
        firstChild: Icon(Icons.visibility),
        secondChild: Icon(Icons.visibility_off_outlined),
        crossFadeState:
            isSeccure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(seconds: 2));
  }

  Icon _onVisibilityMethod() {
    return isSeccure
        ? Icon(Icons.visibility)
        : Icon(Icons.visibility_off_outlined);
  }
}
