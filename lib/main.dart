import 'package:flexinote/constants.dart';
import 'package:flutter/material.dart';
import 'main_menu.dart';
import 'package:flexinote/ebook_pages/ebook_main_page.dart';
import 'package:flexinote/ebook_pages/ebook_viewer.dart';
import 'package:flexinote/catatan_pages/catatan_main_page.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexinote',
      debugShowCheckedModeBanner: false,
      home: const MainMenuHolder(),
      routes: <String, WidgetBuilder>{
        '/ebook/main': (BuildContext context) => const EbookMainPage(),
        '/ebook/book-content': (BuildContext context) => BookViewer(path:
        ModalRoute.of(context)!.settings.arguments as String), //Passes the argument
        '/catatan/main': (BuildContext context) => const CatatanMainPage(),
      },
      theme: ThemeData(
        fontFamily: 'Fredoka',
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 32,
            fontFamily: 'Fredoka',
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}

    //
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("FlexiNote"),
    //     backgroundColor: const Color.fromRGBO(69, 60, 103, 1),
    //   ),
    //   body: Center(
    //       child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         MenuButton(
    //           text: "Gyatt Zhu yuan 100cm",
    //           onPressed: () {
    //             //action
    //           },
    //         ),
    //         MenuButton(
    //           text: "Hoshino Cunny banget",
    //           color: Colors.pink,
    //           onPressed: () {
    //             //action
    //           },
    //         ),
    //       ],
    //     )
    //   ),
    // );

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // Application root
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       //Title when in Browser
//       title: 'Flexinote',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(69, 60, 103, 100)),
//         useMaterial3: true,
//       ),
//       home:
//           //Header title
//           const MyHomePage(title: 'Flexinote'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Center(
//           child: Text(widget.title),
//         )
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }