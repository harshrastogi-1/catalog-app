import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shopping/Helper/AdsManager.dart';

import '/data/Models/item_model.dart';
import '/domain/usecases/fetch_data_use_case.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  List product = [].obs;
  late BannerAd bannerAd;

  @override
  void onInit() {
    loadData();
    initAds();
    initBanner();
    super.onInit();
  }

  loadData() async {
    try {
      isLoading(true);
      var productsData = await FetchDataUseCase().execute();
      product.assignAll(productsData);
      // product.assignAll(List.from(productsData)
      //     .map<ItemModel>((item) => ItemModel.fromJson(item))
      //     .toList());
    } finally {
      isLoading(false);
    }
  }

  initBanner(){
    bannerAd =BannerAd(size: AdSize.banner, adUnitId: AdsManager.bannerAdId    , listener: BannerAdListener(), request:AdRequest());
    bannerAd.load();

  }
  //
  Future<InitializationStatus>initAds(){
    return MobileAds.instance.initialize();
  }
  getAdWidget(){
    return Center(
      child: Container(
        height: bannerAd.size.height.toDouble(),
        width: bannerAd.size.width.toDouble(),
        child: AdWidget(ad:bannerAd),
      ),
    );
  }
}
