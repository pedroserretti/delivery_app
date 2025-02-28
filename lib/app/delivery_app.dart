import 'package:delivery_app/app/core/provider/application_binding.dart';
import 'package:delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:delivery_app/app/pages/auth/login/login_page.dart';
import 'package:delivery_app/app/pages/home/home_router.dart';
import 'package:delivery_app/app/pages/product_detail/product_detail_router.dart';
import 'package:delivery_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'pages/auth/register/register_router.dart';

class DwDeliveryApp extends StatelessWidget {
  const DwDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(debugShowCheckedModeBanner: false, title: 'Delivery App', theme: ThemeConfig.theme, routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => HomeRouter.page,
        '/productDetail': (context) => ProductDetailRouter.page,
        '/auth/login': (context) => const LoginPage(),
        '/auth/register': (context) => RegisterRouter.page,
      }),
    );
  }
}
