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
  late NativeAd nativeAd;

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

  initBanner() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdsManager.bannerAdId,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            print('>>>>>> banner ads loaded');
          },
          onAdFailedToLoad: (ad, error) {
            // Releases an ad resource when it fails to load
            ad.dispose();
            print('>>>>>>> banner Ad load failed (code=${error.code} message=${error.message})');
          },
        ),
        request: const AdRequest());
    bannerAd.load();

    nativeAd = NativeAd(
        factoryId: '',
        adUnitId: AdsManager.nativeAdUnitId,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
           print('>>>>> native ad loaded');
          },
          onAdFailedToLoad: (ad, error) {
            // Releases an ad resource when it fails to load
            ad.dispose();
            print('>>>>> native Ad load failed (code=${error.code} message=${error.message})');       },
        ),
        request: const AdRequest());
    nativeAd.load();
  }

  Future<InitializationStatus> initAds() {
    return MobileAds.instance.initialize();
  }


  @override
  void dispose() {
    bannerAd.dispose();
    nativeAd.dispose();
    super.dispose();
  }
}
