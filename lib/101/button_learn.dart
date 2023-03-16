import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/container_sized_box_learn.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});
  static String appBar_title = "betul";
  static String textButtonTxt = "jhldskj";
  static String textButtonIconTxt = "text button";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBar_title),
        centerTitle: true,
      ),
      body: Column(children: [
        TextButton(
            onPressed: () => {},
            child: Text(
              textButtonTxt,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: ProjectColors.color),
            )),
        TextButton.icon(
          onPressed: () => {},
          icon: Icon(Icons.abc_outlined),
          label: Text(
            textButtonIconTxt,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: Theme.of(context).errorColor),
          ),
          // style: TextButton.styleFrom(
          //     textStyle: Theme.of(context)
          //         .textTheme
          //         .subtitle2
          //         ?.copyWith(color: Colors.amber[50], fontSize: 15.5),
          //     animationDuration: Duration(milliseconds: 50),
          //     backgroundColor: Theme.of(context).colorScheme.onSecondary),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.green;
            }
            return Theme.of(context).colorScheme.error;
          })),
        ),
        TextButton.icon(
            onPressed: () => {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        var showModalBottomSheetTxt = "Hello";

                        return Container(
                          decoration: ProjectContainierBoxDecoration()
                              .copyWith(color: ProjectColors.color),
                          child: Text(showModalBottomSheetTxt,
                              style: Theme.of(context).textTheme.subtitle2),
                        );
                      })
                },
            icon: Icon(Icons.abc_outlined),
            label: Text("hello")),
        TextButton(onPressed: () => {}, child: Icon(Icons.access_alarms)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
            onPressed: () => {},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Hello elevated button"),
            )),
        IconButton(onPressed: () => {}, icon: Icon(Icons.ac_unit)),
        FloatingActionButton(
          onPressed: () => {},
          child: Icon(Icons.add),
        ),
        OutlinedButton(onPressed: null, child: Text("Bana tıkla")),
        InkWell(
            //inkwell ile widgetlara tıklanma ozelligi kazandırabilriz
            onHover: (value) {
              //inkwell widget ile widgetlar sarmalanarak widgetlara tıklanabilme ozelligi kazandırılabilir.
              //onhover proprtiy ile hover efekti verilir.
              print("Uzerine gelindi");
            },
            onDoubleTap: () {
              print("cift tıklandı");
              //ondoubleTap ile cift tıklandıgında ne yapilacagi yazilir
            },
            onTap: (() => {
                  //uzerine tıklandıgında
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            height: 100,
                            decoration: ProjectContainierBoxDecoration(),
                          ))
                }),
            child: Container(
                padding: EdgeInsets.all(10),
                child: Text("on tapli text button"))),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)))),
            onPressed: () => {},
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 20, left: 20),
              child: Text("place bid",
                  style: Theme.of(context).textTheme.headline3),
            ))
      ]),
    );
  }
}

//borders
//circleborder(), roundedrectangleborder()
