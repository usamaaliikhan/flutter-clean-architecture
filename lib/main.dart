import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_clean/features/global/routes/app_routes.dart';
import 'package:todo_clean/features/home/presentation/pages/home/home_view.dart';
import 'package:todo_clean/features/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(Injector(routerWidget: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp(
          title: 'Todo App',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
            useMaterial3: true,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: const Color(0xffCE93D0),
              selectionColor: const Color(0xffCE93D0).withOpacity(0.25),
              selectionHandleColor: const Color(0xffCE93D0),
            ),
          ),
          fallbackLocale: const Locale('en', 'US'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'), // English
          ],
          localeResolutionCallback:
              (Locale? deviceLocale, Iterable<Locale> supportedLocales) {
            for (var locale in supportedLocales) {
              if (locale.languageCode == deviceLocale?.languageCode &&
                  locale.countryCode == deviceLocale?.countryCode) {
                return deviceLocale;
              }
            }
            return supportedLocales.first;
          },
          debugShowCheckedModeBanner: false,
          getPages: AppRoutes.pages,
          initialRoute: HomeView.route,
        ),
      );
    });
  }
}
