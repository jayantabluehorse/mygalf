import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/colors.dart';
import 'package:my_galf/pages/blog_page/blog_page.dart';
import './pages/about_page/about_page.dart';
import './pages/download_app_page/download_app_page.dart';
import './pages/contact_page/contact_page.dart';
import 'package:my_galf/pages/events_page/events_page.dart';
import 'package:my_galf/pages/home_page/homepage.dart';
import 'package:my_galf/pages/lounge_page/lounge_page.dart';
import 'package:my_galf/pages/panelist/panelist.dart';
import 'package:my_galf/pages/product_details_page/product_details_page.dart';
import 'package:my_galf/pages/product_page/product_page.dart';
import 'package:my_galf/pages/services_page/services_page.dart';
import 'package:my_galf/pages/corporate_wellness_page/corporate_wellness_page.dart';
import './pages/service_details_page/service_details_page.dart';
import './pages/event_details_page/event_details_page.dart';
import 'pages/cart/cart.dart';
import 'pages/checkOut/checkout.dart';
import 'pages/forgotPassword/forgotpassword.dart';
import 'pages/login/login.dart';
import 'pages/signup/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: const MaterialColor(
          0xFF222F38, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
          <int, Color>{
            50: mainThemeColor, //10%
            100: mainThemeColor, //20%
            200: mainThemeColor, //30%
            300: mainThemeColor, //40%
            400: mainThemeColor, //50%
            500: mainThemeColor, //60%
            600: mainThemeColor, //70%
            700: mainThemeColor, //80%
            800: mainThemeColor, //90%
            900: mainThemeColor, //100%
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/events",
          page: () => const EventsPage(),
        ),
        GetPage(
          name: "/",
          page: () => const Homepage(),
        ),
        GetPage(
          name: "/services",
          page: () => const ServicesPage(),
        ),
        GetPage(
          name: "/products",
          page: () => const ProductPage(),
        ),
        GetPage(
          name: "/corporate-wellness",
          page: () => const CorporateWellnessPage(),
        ),
        GetPage(
          name: "/lounge",
          page: () => const LoungePage(),
        ),
        GetPage(
          name: "/pdp",
          page: () => const ProductDetailsPage(),
        ),
        GetPage(
          name: "/panelist",
          page: () => const Panelist(),
        ),
        GetPage(
          name: "/about-us",
          page: () => const AboutPage(),
        ),
        GetPage(
          name: "/blog",
          page: () => const BlogPage(),
        ),
        GetPage(
          name: "/service-details",
          page: () => ServiceDetailsPage(),
        ),
        GetPage(
          name: "/download-app",
          page: () => const DownloadAppPage(),
        ),
        GetPage(
          name: "/contact-us",
          page: () => const ContactPage(),
        ),
        GetPage(
          name: "/event-details",
          page: () => const EventDetailsPage(),
        ),
        GetPage(
          name: "/cart",
          page: () => cartPage(),
        ),
        GetPage(
          name: "/checkOut",
          page: () => checkoutPage(),
        ),
        GetPage(
          name: "/login",
          page: () => loginPage(),
        ),
        GetPage(
          name: "/signup",
          page: () => SignUpPage(),
        ),
        GetPage(name: "/recover/password", page: () => ForgotPasswordPage())
      ],
    );
  }
}
