class AdHelper {
  static const bool isTest = true;
  static String get detectAd {
    if (isTest) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }
    //real add
    return 'ca-app-pub-2400508280875448/5546059890';
  }

  static String get bannerAd {
    if (isTest) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return 'ca-app-pub-2400508280875448/6859141564';
  }
}
