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
                ElevatedButton(onPressed: () => numberPressed('1'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('1')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('2'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('2')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: () => numberPressed('3'), style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('3')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: null, style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('AC')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: null, style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('÷')),
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
                ElevatedButton(onPressed: null, style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('×')),
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
                ElevatedButton(onPressed: null, style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('-')),
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
                ElevatedButton(onPressed: null, style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('=')),
                SizedBox(width: 3),
                ElevatedButton(onPressed: null, style: ElevatedButton.styleFrom(fixedSize: const Size(75,40)), child: Text('+')),
                SizedBox(width: 3),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
