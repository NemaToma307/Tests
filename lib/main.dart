import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetesting/Fake_Api/dummyjson/comments/home_page_comments.dart';
import 'package:firebasetesting/Fake_Api/jsonPlaceHolder/home_page.dart';
import 'package:firebasetesting/Fake_Api/jsonPlaceHolder/home_page_WithCarouselSlider.dart';
import 'package:firebasetesting/barcode/home_page_barcode.dart';
import 'package:firebasetesting/firebase_options.dart';
import 'package:firebasetesting/flutter_carousel_slider/carousel_slider_homePage.dart';
import 'package:firebasetesting/flutter_hover/motion_home_page.dart';
import 'package:firebasetesting/local_auth_biometrics/home_page_biometrics.dart' show localAuthBiometrics;
import 'package:firebasetesting/notification/firebase_api.dart';
import 'package:firebasetesting/notification/notification_page.dart';
import 'package:flutter/material.dart';

final navigateKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   await FireBaseApi().initNotifications();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigateKey,
      home:  HomePageBarcode(),
      //CommentsPage(),
      //homePageCarouselSlider(),
      //homePage(),
      //carouselSlider(),
      //ExamplePage(),
      //localAuthBiometrics(),
      //const MyHomePage(title: 'Flutter Demo Home Page'),
      // routes: {
      //   notePage.route :(context) => notePage()
      // },
      routes: {
        '/note_screen': (context) => notePage(),
      },
    );
  }
}

// Future gg() async {
//  return await FireBaseApi().initNotifications();
//
// }


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    // gg();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
