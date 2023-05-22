import 'package:flutter/material.dart';
import 'package:flutter_animated_card_list/flutter_animated_card_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Animated Card List Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          elevation: 0,
          //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: CreditCardListWidget(
          cardsData: [
            CreditCardData(
              cvvText: "981",
              cardHolderName: "Mr. Marcia Fadel",
              cardNumber: "4660 9282 5392 9728",
              validUntill: "7/2026",
              cardtype: CardType.masterCard,
              backgroundColor: Colors.indigo[900],
            ),
            CreditCardData(
              cvvText: "619",
              cardHolderName: "Mr. Shailendra Rajput",
              cardNumber: "4559 0395 5274 0362",
              validUntill: "10/2027",
              cardtype: CardType.americanExpress,
              backgroundColor: Colors.grey.shade900,
            ),
            CreditCardData(
              cvvText: "671",
              cardHolderName: "Mr. Sahil Khatri",
              cardNumber: "4710 6952 7901 6125",
              validUntill: "9/2028",
              cardtype: CardType.discover,
              backgroundColor: Colors.lightBlue[700],
            ),
            CreditCardData(
              cardHolderName: "Archie Zboncak",
              cardNumber: "4137 0646 3410 8181",
              cvvText: "081",
              validUntill: "8/2027",
              cardtype: CardType.visa,
              backgroundColor: const Color(0xff3b1a5c),
            ),
            CreditCardData(
              cvvText: "062",
              cardHolderName: "Brent Rolfson",
              cardNumber: "4451 7631 7161 1055",
              validUntill: "8/2028",
              cardtype: CardType.rupay,
              backgroundColor: const Color(0xffc11e79),
            ),
          ],
        ));
  }
}
