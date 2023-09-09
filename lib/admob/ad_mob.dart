import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_helper.dart';

// 広告を呼び出すクラス
class AdMob {
  BannerAd? _bannerAd;
  AdMob() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
          },
        ),
        request: const AdRequest());
  }

  void load() {
    _bannerAd!.load();
  }

  void dispose() {
    _bannerAd!.dispose();
  }

  Widget getAdBanner() {
    return Container(
      alignment: Alignment.center,
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }

  double getAdBannerHeight() {
    return _bannerAd!.size.height.toDouble();
  }
}
