import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../admob/ad_mob.dart';

class AdmobView extends StatefulWidget {
  const AdmobView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AdmobViewState createState() => _AdmobViewState();
}

class _AdmobViewState extends State<AdmobView> {
  final AdMob _adMob = AdMob();

  @override
  void initState() {
    super.initState();
    _adMob.load();
  }

  @override
  void dispose() {
    _adMob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AdSize.getAnchoredAdaptiveBannerAdSize(
          Orientation.portrait, MediaQuery.of(context).size.width.truncate()),
      builder: (BuildContext context,
          AsyncSnapshot<AnchoredAdaptiveBannerAdSize?> snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: double.infinity,
            child: _adMob.getAdBanner(),
          );
        } else {
          return Container(
            height: _adMob.getAdBannerHeight(),
            color: Colors.white,
          );
        }
      },
    );
  }
}
