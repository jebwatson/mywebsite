import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mywebsite/constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jeb Watson",
      theme: ThemeData.dark().copyWith(
        accentColor: Color.fromARGB(255, 69, 27, 111),
        primaryColor: Color.fromARGB(255, 36, 30, 48),
        backgroundColor: Color.fromARGB(255, 03, 03, 03),
      ),
      home: MyHomePage(title: 'My Samples Portfolio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final Size size = queryData.size;
    final ThemeData theme = Theme.of(context);

    return Container(
      color: theme.backgroundColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: _buildHeader(theme, size),
          ),
          Expanded(
            child: _buildBody(theme, size),
            flex: 6,
          ),
          Expanded(
            child: _buildFooter(theme, size),
          )
        ],
      ),
    );
  }
}

Widget _buildHeader(ThemeData theme, Size size) {
  return Container(
    child: Padding(
      padding: standardContainerPadding,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: AnimatedTextKit(
          // Replace this with three distinct widgets that wait on each other and replace the with static text once the animation is complete
          animatedTexts: [
            TypewriterAnimatedText(
              "Welcome, my name's Jeb",
              speed: const Duration(milliseconds: 60),
              textStyle: theme.textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ],
          isRepeatingAnimation: false,
        ),
      ),
    ),
    color: theme.backgroundColor,
  );
}

Widget _buildBody(ThemeData theme, Size size) {
  return Container(
    child: Center(
      child: Text(
        "App Samples Go Here",
        style: theme.textTheme.headline6,
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      color: theme.primaryColor,
    ),
  );
}

Widget _buildFooter(ThemeData theme, Size size) {
  return Container(
    child: Center(
      child: TextButton(
        child: const Text("Contact Me"),
        onPressed: () => {print("You pressed the button")},
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          primary: Colors.white,
          backgroundColor: theme.accentColor,
          textStyle: theme.textTheme.bodyText1,
        ),
      ),
    ),
    color: theme.primaryColor,
  );
}
