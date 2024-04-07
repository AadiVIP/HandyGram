import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:handygram/src/common/cubits/colors.dart';
import 'package:handygram/src/common/cubits/text.dart';
import 'package:handygram/src/common/misc/localizations.dart';
import 'package:handygram/src/router/router.dart';

class HandyGramApp extends StatelessWidget {
  const HandyGramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorStyles, ColorScheme>(
      builder: (context, scheme) => BlocBuilder<TextStyles, TextTheme>(
        builder: (context, theme) => MaterialApp.router(
          routerConfig: router,
          supportedLocales: AppLocalizations.delegate.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData.from(
            colorScheme: scheme,
            textTheme: theme,
            useMaterial3: true,
          ).copyWith(
            // Use black background to save battery.
            scaffoldBackgroundColor: Colors.black,
          ),
          title: "HandyGram",
        ),
      ),
    );
  }
}