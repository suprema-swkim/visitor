import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitor/1_presentation/sample_page/sample_page.dart';
import 'package:visitor/2_data/datasources/local/shared_preference.dart';

void main() async {
  // 내부 스토리지 생성
  var prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp(
        title: 'Flutter Riverpod',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SamplePage(),
      ),
    );
  }
}

// Overlay(samplepage)
// sample2

// home/users/setting1
// home/users/setting2
// home/users/setting3

// home/users2/setting1

// week.monday(String title,int name)
// week.setasr(title,name)

// week.monday(title)
// week.seatrr(name)