import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgets_app/views/providers/counter_provider.dart';
import 'package:widgets_app/views/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme(:titleLarge) = Theme.of(context).textTheme;
    final int clickCounter = ref.watch(counterProvider);
    // final bool isDark = ref.watch(isDarkThemeProvider);
    final bool isDark = ref.watch(themeNotifierProvider).isDarkmode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode_outlined),
            onPressed: () {
              // ref.read(isDarkThemeProvider.notifier)
              //   .update((isDarkMode) => !isDarkMode);
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            },
          ),
        ],
      ),

      body: Center(
        child: Text('Valor: $clickCounter', style: titleLarge),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}