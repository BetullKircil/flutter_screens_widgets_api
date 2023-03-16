import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/demos/stack_demo_view.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheet {
  bool isCyan = true;
  void _changeColor() {
    isCyan = !isCyan;
  }

  Color _scaffoldBackground = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: TextButton(
        onPressed: () {
          ShowCustomSheet(context, ContainerCustom());
        },
        child: Text("Press"),
      )),
      backgroundColor: _scaffoldBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              backgroundColor: BottomSheetColorUtilities()._background,
              barrierColor: BottomSheetColorUtilities()._barrierColors,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              context: context,
              builder: (context) {
                return _sheetExample();
              });

          if (result is bool) {
            setState(() {
              _changeColor();
              _scaffoldBackground = isCyan ? Colors.cyan : Colors.pink;
            });
          }
        },
        child: Icon(Icons.share),
      ),
    );
  }
}

class _sheetExample extends StatefulWidget {
  _sheetExample({Key? key}) : super(key: key);

  @override
  State<_sheetExample> createState() => _sheetExampleState();
}

class _sheetExampleState extends State<_sheetExample> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class BottomSheetColorUtilities {
  Color _background = Colors.red;
  Color _barrierColors = Colors.transparent;
  Color _scaffoldBackground = Colors.yellow;
}

mixin ProductSheet {
  Future<T?> ShowCustomSheet<T>(
      BuildContext context, Widget childWidget) async {
    showModalBottomSheet<T>(
        backgroundColor: BottomSheetColorUtilities()._background,
        barrierColor: BottomSheetColorUtilities()._barrierColors,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        context: context,
        builder: (context) {
          return CustomMainSheet(childWidget: childWidget);
        });
  }
}

class CustomMainSheet extends StatelessWidget {
  const CustomMainSheet({super.key, required this.childWidget});
  final Widget childWidget;
  final double _gripHeight = 30;

  @override
  Widget build(BuildContext context) {
    Color _sheetBackground = Colors.green;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _baseSheetHeader(),
          Text("lfsdjd"),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/images/img.png"),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       setState(() {
          //         _sheetBackground = Colors.blue;
          //       });
          //       Navigator.of(context).pop<bool>(true);
          //     },
          //     child: Text("Okay"))
        ],
      ),
    );
  }
}

class _baseSheetHeader extends StatelessWidget {
  const _baseSheetHeader({
    Key? key,
  }) : super(key: key);

  final double _gripHeight = 30;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Divider(
            color: BottomSheetColorUtilities()._scaffoldBackground,
            thickness: 3,
            indent: MediaQuery.of(context).size.width * 0.3,
            endIndent: MediaQuery.of(context).size.width * 0.3,
          ),
          Positioned(
              right: 0,
              child: InkWell(
                child: Icon(Icons.close, size: 20),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ))
        ],
      ),
    );
  }
}
