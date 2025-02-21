import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:threads_clone/features/users/view_models/theme_config_vm.dart';

bool isDarkMode(BuildContext context) =>
    (MediaQuery.of(context).platformBrightness == Brightness.dark) &&
    context.watch<ThemeConfigViewModel>().darkTheme;
