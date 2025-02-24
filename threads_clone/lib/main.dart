import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:threads_clone/features/users/repos/theme_config_repo.dart';
import 'package:threads_clone/features/users/view_models/theme_config_vm.dart';
import 'package:threads_clone/firebase_options.dart';
import 'package:threads_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = ThemeConfigRepository(preferences);

  runApp(
    ProviderScope(overrides: [
      ThemeConfigProvider.overrideWith(
        () => ThemeConfigViewModel(repository),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'Threads Clone',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        //useMaterial3: true,
        textTheme: Typography.blackMountainView,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}
