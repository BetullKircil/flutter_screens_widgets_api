import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormFieldLearn extends StatefulWidget {
  const FormFieldLearn({super.key});

  @override
  State<FormFieldLearn> createState() => _FormFieldLearnState();
}

class _FormFieldLearnState extends State<FormFieldLearn> {
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var data = "save";
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          print("a");
        },
        child: Column(
          children: [
            TextField(),
            TextFormField(
              validator: FormFielValidator().isNotEmpty,
            ),
            TextFormField(
              validator: (value) {
                return (value?.isNotEmpty ?? false)
                    ? null
                    : "Bu alan bos gecilemez";
              },
            ),
            DropdownButtonFormField<String>(
              validator: FormFielValidator().isNotEmpty,
              items: [
                DropdownMenuItem(
                  child: Text("a"),
                  value: "ilk deger",
                ),
                DropdownMenuItem(
                  child: Text("b"),
                  value: "ikinci deger",
                ),
                DropdownMenuItem(
                  child: Text("c"),
                  value: "son deger",
                )
              ],
              onChanged: (value) {},
            ),
            ElevatedButton(
                onPressed: () {
                  _key.currentState?.validate();
                },
                child: Text(data))
          ],
        ),
      ),
    );
  }
}

class FormFielValidator {
  String? isNotEmpty(String? value) {
    return (value?.isNotEmpty ?? false) ? null : ValidatorMessage()._notEmpty;
  }
}

class ValidatorMessage {
  final String _notEmpty = "Bos gecilemez";
}
