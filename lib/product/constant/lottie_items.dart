enum LottieItems { themeChange }

extension LottieItemsExtension on LottieItems {
  String path() {
    switch (this) {
      case LottieItems.themeChange:
        return 'lottie_theme_changes.json';
    }
  }

  String get lottiePath => 'assets/lottie/${path()}';
}
