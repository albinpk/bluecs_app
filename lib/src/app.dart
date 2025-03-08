import 'package:flutter/material.dart';

import 'core/theme.dart';
import 'screens/profile_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProfileScreen(),
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.dark(),
    );
  }
}
