import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgets_app/config/theme/app_theme.dart';


final isDarkThemeProvider = StateProvider((ref) => false);

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

// Instance<AppTheme>
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

// Controller/Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // state = AppTheme instance
  ThemeNotifier(): super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
