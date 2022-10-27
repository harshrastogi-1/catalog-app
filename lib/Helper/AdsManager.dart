import 'dart:io';
class AdsManager{
  static String get bannerAdId{
    if (Platform.isIOS){
      return "ca-app-pub-3940256099942544/2934735716";
    }else if(Platform.isAndroid){
      return "ca-app-pub-3940256099942544/2934735716";
    }else{
      throw UnsupportedError("Un Supported");
    }
  }
}