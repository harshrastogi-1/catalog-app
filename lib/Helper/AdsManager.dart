import 'dart:io';
class AdsManager{
 /* static String get bannerAdId{
    if (Platform.isIOS){
      return "ca-app-pub-3940256099942544/2934735716";
    }else if(Platform.isAndroid){
      return "ca-app-pub-3940256099942544/2934735716";
    }else{
      throw UnsupportedError("Un-Supported");
    }
  }*/
  static String get bannerAdId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    throw UnsupportedError("Unsupported platform");
  }
}