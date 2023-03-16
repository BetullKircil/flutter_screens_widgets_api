import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int sayacCustom = 0;
  final String text = "Merhaba";
  void sayacGuncelle() {
    setState(
      () => {
        if (sayacCustom <= 14) {++sayacCustom} else {sayacCustom = 0}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: sayacGuncelle, child: Text("$text $sayacCustom"));
  }
}
