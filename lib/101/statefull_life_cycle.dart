import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatefullLifeCycle extends StatefulWidget {
  const StatefullLifeCycle({super.key, required this.message});
  final String message; //widgetin parametre olarak name almasını saglarız

  @override
  State<StatefullLifeCycle> createState() => _StatefullLifeCycleState();
}

class _StatefullLifeCycleState extends State<StatefullLifeCycle> {
  String _message = "";
  late final bool _isOdd; //LATE: sonradan deger verecegiz

  @override
  void initState() {
    //LIFECYCLE  //statefull widgetlar ekrana cizilmeden calisir build metodundan once calisir. init statete ekran guncellenmez cunku daha ekran cizilmemistir
    super.initState();
    print("a");
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    ComputeName();
  } //gelen mesajı tek cift oldugnu ve conditionlari burada kontrol ettik

  void ComputeName() {
    _isOdd ? _message += "Tek" : _message += "Cift";
  }

  @override
  void didChangeDependencies() {
    print("B");
    //init stateten sonra calisir ekrani cizmeden once calisir
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StatefullLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("c");
  }

  @override
  void dispose() {
    //sayfada cilkildigi anda cagrilir
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: widget.message.length.isOdd ? Text(_message) : Text(_message)),
      body: widget.message.length
              .isOdd //verilen mesaj parametresinin tek mi cift mi oldugunu widget widgeti ile kontrol ettik
          ? TextButton(onPressed: () => {}, child: Text(_message))
          : ElevatedButton(onPressed: () => {}, child: Text(_message)),
    );
  }
}
