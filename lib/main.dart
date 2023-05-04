import 'package:url_strategy/url_strategy.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/colors.dart';
import 'package:my_galf/components/request_callback/request_callback_binding.dart';
import 'package:my_galf/pages/about_page/about_binding.dart';
import 'package:my_galf/pages/blog_page/blog_page.dart';
import 'package:my_galf/pages/corporate_wellness_page/wellness_page.dart';
import 'package:my_galf/pages/event_details_page/event_details_binding.dart';
import 'package:my_galf/pages/events_page/events_binding.dart';
import 'package:my_galf/pages/login/login_binding.dart';
import 'package:my_galf/pages/lounge_page/lounge_binding.dart';
import 'package:my_galf/pages/product_details_page/product_details_binding.dart';
import 'package:my_galf/pages/product_page/product_binding.dart';
import 'package:my_galf/pages/profile/profile_binding.dart';
import 'package:my_galf/pages/profile/profile_page.dart';
import 'package:my_galf/pages/service_details_page/service_details_binding.dart';
import 'package:my_galf/pages/services_page/service_binding.dart';
import 'package:my_galf/pages/signup/signup_binding.dart';
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
import 'pages/404Page/page_notfound.dart';
import 'pages/checkOut/checkout.dart';
import 'pages/checkOut/checkout_binding.dart';
import 'pages/forgotPassword/forgotpassword.dart';
import 'pages/login/login.dart';
import 'pages/newCart/cart.dart';
import 'pages/orderConfirmation/orderConfirmation.dart';
import 'pages/read_more_page/read_more_page.dart';

import 'pages/signup/sign_up.dart';
import './pages/contact_page/contact_binding.dart';
import './pages/cart/cart_binding.dart';
import './pages/newLogin/auth_binding.dart';

void main() async {
  // ********************************
  //  dotenv.env['ANOTHER_VARIABLE']
  // await dotenv.load(fileName: ".env");

  // await dotenv.load();

  // ********************************

  // ! bindings
  EventBinding().dependencies();
  EventDetailsBinding().dependencies();
  ProductBinding().dependencies();
  ServiceBinding().dependencies();
  ProductDetailsBinding().dependencies();
  LoungeBinding().dependencies();
  ContactBinding().dependencies();
  SignupBinding().dependencies();
  LoginBinding().dependencies();
  CartBinding().dependencies();
  CheckoutBinding().dependencies();
  ProfileBinding().dependencies();
  ServiceBinding().dependencies();
  AboutBinding().dependencies();
  RequestCallbackBinding().dependencies();
  ServiceDetailsBinding().dependencies();
  AuthBinding().dependencies();

// ! for Url removeing hastag
  setPathUrlStrategy();

  // ! Run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: Theme.of(context).lightTheme,

      theme: ThemeData(
        fontFamily: "rubik",
        textTheme: const TextTheme(),

        //  GoogleFonts.rubikTextTheme(
        //   Theme.of(context).textTheme,
        // ),
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
      // home: const Homepage(),
      initialRoute: "/",
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
      getPages: [
        GetPage(
          name: "/events",
          page: () => EventsPage(),
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
        // GetPage(
        //   name: "/corporate-wellness",
        //   page: () => const CorporateWellnessPage(),
        // ),
        GetPage(
          name: "/lounge",
          page: () => const LoungePage(),
        ),
        GetPage(
          name: "/products/:id",
          page: () => const ProductDetailsPage(),
        ),
        GetPage(
          name: "/panelist/:id",
          page: () => const Panelist(),
        ),
        GetPage(
          name: "/about-us",
          page: () => const AboutPage(),
        ),
        GetPage(
          name: "/profile",
          page: () => const ProfilePage(),
        ),
        GetPage(
          name: "/order-confrim/:id",
          page: () => OrderConfirmation(),
        ),
        // GetPage(
        //   name: "/blog",
        //   page: () => const BlogPage(),
        // ),
        GetPage(
          name: "/blog",
          page: () => const BlogPage(),
        ),
        GetPage(
          name: "/service-details/:id",
          page: () => const ServiceDetailsPage(),
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
          name: "/event-details/:id",
          page: () => const EventDetailsPage(),
        ),
        GetPage(
          name: "/cart",
          page: () => const NewCart(),
        ),
        GetPage(
          name: "/checkout",
          page: () => const checkoutPage(),
        ),
        GetPage(
          name: "/login",
          page: () => const LoginPage(),
        ),
        GetPage(
          name: "/signup",
          page: () => const SignUpPage(),
        ),
        GetPage(name: "/recover/password", page: () => ForgotPasswordPage()),

        GetPage(
          name: "/lounge",
          page: () => const LoungePage(),
        ),
        GetPage(
          name: "/orderconfirm",
          page: () => OrderConfirmation(),
        ),
        GetPage(
          name: "/error",
          page: () => const ErrorPage(),
        ),
        GetPage(
          name: "/readmore",
          page: () => const ReadMorePage(),
        ),
        GetPage(
          name: "/wellnesspage",
          page: () => const WellnessPage(),
        )
      ],
    );
  }
}

// ///
// ///
// ///
// ///
// ///
// //
// //Mobile app

// import 'package:flutter/material.dart';
// import 'package:my_galf/mobile/screens/LandingPage/landingPage.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.indigo),
//       home: LandingPage(),
//     );
//   }
// }
