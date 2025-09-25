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
                ElevatedButton(onPressed: () => numberPressed('1'), child: Text('1')),
                ElevatedButton(onPressed: () => numberPressed('2'), child: Text('2')),
                ElevatedButton(onPressed: () => numberPressed('3'), child: Text('3')),
                ElevatedButton(onPressed: null, child: Text('AC')),
                ElevatedButton(onPressed: null, child: Text('÷')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => numberPressed('4'), child: Text('4')),
                ElevatedButton(onPressed: () => numberPressed('5'), child: Text('5')),
                ElevatedButton(onPressed: () => numberPressed('6'), child: Text('6')),
                ElevatedButton(onPressed: null, child: Text('-/+')),
                ElevatedButton(onPressed: null, child: Text('×')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => numberPressed('7'), child: Text('7')),
                ElevatedButton(onPressed: () => numberPressed('8'), child: Text('8')),
                ElevatedButton(onPressed: () => numberPressed('9'), child: Text('9')),
                ElevatedButton(onPressed: null, child: Text('%')),
                ElevatedButton(onPressed: null, child: Text('-'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: null ,child: const Icon(Icons.calculate),),
                ElevatedButton(onPressed: () => numberPressed('0'), child: Text('0')),
                ElevatedButton(onPressed: () => numberPressed('.'), child: Text('.')),
                ElevatedButton(onPressed: null, child: Text('=')),
                ElevatedButton(onPressed: null, child: Text('+')),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
