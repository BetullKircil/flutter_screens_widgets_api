import 'dart:io';
import 'package:flutter_deneme_somestr/201/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);
  Future<void> toShare(String path) async {
    await launchUrl(Uri.parse(path));
  }
}

class FileDownload extends IFileDownload with ShareMixin {
  //inheritance ile ust sinifin tum ozelliklerini oldugu gibi kullanirim ve istersem uzerine extra ozellikler katabilirim
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    return true;
    //BURADA CUSTOM FILE DOWNLOAD EXCEPTION YAPTIK//   // eger gelen file item null ile exception firlatilir
  }

  @override
  void Share(params) {
    // TODO: implement Share
  }
  //kullanıcıdan file item istenmeli ama null gelme olasiligi da goz onunde bulundurulmalidir
}

///exception firlatmasi icin throw kullanmamız gerekir

class SmsDownload implements IFileDownload {
  //implemente ederek ust sinifin ozelliklerini override etmem gerekir
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    return true;
    //BURADA CUSTOM FILE DOWNLOAD EXCEPTION YAPTIK//   // eger gelen file item null ile exception firlatilir
  }

  @override
  Future<void> toShare(String path) async {
    await launchUrl(Uri.parse("sms: $path")); //sms download
  } //kullanıcıdan file item istenmeli ama null gelme olasiligi da goz onunde bulundurulmalidir
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

//HER ZAMAN ICIN UI VE KODLARI BİRBİRİNDEN AYIRMALIYIZF

mixin ShareMixin on IFileDownload {
  //burada sadece IfileDownload'dan tureyenler bu mixini implemente edebilir
  //mixinlerin hangi widgetlarla ve yapılarla birllikte kullanılacagina karar verebilriz
  void Share(params);
}
