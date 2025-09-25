import 'package:flutter/material.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String displayText = '';

  void numberPressed(String number) {
    setState(() {
      displayText += number;
    });
  }
  void clear() {
    setState(() {
      displayText = '';
    });
  }
  void solve() {
    String finalQuestion = displayText;
    String number = '';
    int z = finalQuestion.length - 1;
    List<String> equation = [];
    finalQuestion = finalQuestion.replaceAll('x', '*');
    finalQuestion = finalQuestion.replaceAll('÷', '/');
    finalQuestion = finalQuestion.replaceAll('%', '/100');
    finalQuestion = finalQuestion.replaceAll('-/+', '-1*');
    finalQuestion = finalQuestion.replaceAll('+-', '-');
    finalQuestion = finalQuestion.replaceAll('--', '+');
    finalQuestion = finalQuestion.replaceAll('++', '+');
    finalQuestion = finalQuestion.replaceAll('/+', '/');
    finalQuestion = finalQuestion.replaceAll('*+', '*');
    for (int i = 0; i < finalQuestion.length; i++) {
      if (finalQuestion[i] == '+' || finalQuestion[i] == '-' || finalQuestion[i] == '*' || finalQuestion[i] == '/') {
        equation.add(finalQuestion.substring(0, i));
        equation.add(finalQuestion[i]);
        equation.add(number);
        finalQuestion = finalQuestion.substring(i + 1);
        i = 0;
      }
      else {
        number += finalQuestion[i];
      }
    }
    for (int i = 0; i < z; i++) {
      if (equation[i] == '*' || equation[i] == '/' || equation[i] == '') {
        if (i == 0 || i+1 == finalQuestion.length - 1 || finalQuestion[i+1] == '*' || finalQuestion[i+1] == '/') {
          displayText = 'Error: Invalid syntax';
          return;
        }
        else {
          finalQuestion = finalQuestion.replaceRange(i - 1, i + 1, operate(double.parse(finalQuestion[i-1]), finalQuestion[i], double.parse(finalQuestion[i+1])).toString());
          i-=3;
          z-=2;

        }
      }
    }
    for (int i = 0; i < z; i++) {
      if (finalQuestion[i] == '+' || finalQuestion[i] == '-') {
        if (i == 0 || i+1 == finalQuestion.length - 1 || finalQuestion[i+1] == '+' || finalQuestion[i+1] == '-') {
          displayText = 'Error: Invalid syntax';
          return;
        }
        else {
          finalQuestion = finalQuestion.replaceRange(i - 1, i + 1, operate(double.parse(finalQuestion[i-1]), finalQuestion[i], double.parse(finalQuestion[i+1])).toString());
          i-=3;
          z-=2;

        }
      }
    }
    setState(() {
      displayText = finalQuestion; 
    });
  }
  double operate(double left, String op, double right) {
    double resulted = 0;
    if (op == '*') {
      resulted = left * right;
    } else if (op == '/') {
      resulted = left / right;
    } else if (op == '+') {
      resulted = left + right;
    } else if (op == '-') {
      resulted = left - right;
    }
    return resulted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children:[
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              height: 80,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child:  Text(displayText, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,),),
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => numberPressed('1'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('1')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('2'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('2')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('3'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('3')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => clear(), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('AC')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('÷'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('÷')),
                SizedBox(width: 3),
              ],
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => numberPressed('4'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('4')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('5'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('5')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('6'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('6')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: null, style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('-/+')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('x'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('×')),
                SizedBox(width: 3),
              ],
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => numberPressed('7'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('7')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('8'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('8')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('9'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('9')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: null, style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('%')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('-'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('-')),
                SizedBox(width: 3),
              ],
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: null ,style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: const Icon(Icons.calculate),),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('0'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('0')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('.'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('.')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => solve(), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('=')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('+'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('+')),
                SizedBox(width: 3),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
