import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:feel_log/router/router_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class FeelLogApp extends ConsumerWidget {
  const FeelLogApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routeProvider),
      title: 'FeelLog',
      themeMode: ThemeMode.system,
      theme: ThemeData(
          useMaterial3: true,
          //brightness: Brightness.light,
          textTheme: GoogleFonts.notoSansKrTextTheme(),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: Color(0xFF010101),
          //scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.black,
            //titleTextStyle: TextStyle(),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          sliderTheme: SliderThemeData(
            thumbColor: Color(0xFF010101),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
            inactiveTickMarkColor: Color(0xFF010101),
            activeTrackColor: Colors.red,
            trackHeight: 4.0,
          ),
          datePickerTheme: DatePickerThemeData(
            backgroundColor: Colors.white,
            confirmButtonStyle: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Color(0xFF010101)),
            ),
            cancelButtonStyle: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Color(0xFF010101)),
            ),
          )),
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   //brightness: Brightness.dark,
      //   textTheme: GoogleFonts.afacadTextTheme(),
      //   splashColor: Colors.transparent,
      //   highlightColor: Colors.transparent,
      //   scaffoldBackgroundColor: Colors.white,
      //   appBarTheme: AppBarTheme(
      //     elevation: 0,
      //     backgroundColor: Colors.white,
      //     //titleTextStyle: TextStyle(),
      //   ),
      //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     elevation: 0,
      //     backgroundColor: Colors.transparent,
      //   ),
      // ),
    );
  }
}
