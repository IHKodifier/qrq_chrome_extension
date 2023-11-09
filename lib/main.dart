import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Qode',
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
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'QR Qode Chome Extension'),
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
  final codesList = <Map<String, QrImageView>>[];
  String qrText = '';
  late final TextEditingController qrTextController;

  @override
  void initState() {
    qrTextController = TextEditingController(text: qrText);
    super.initState();
  }

  Center qrImageViewer(BuildContext context) {
    return Center(
      child: QrImageView(
          data: qrText,
          eyeStyle: QrEyeStyle(
              color: Theme.of(context).primaryColor,
              eyeShape: QrEyeShape.circle),
          dataModuleStyle: QrDataModuleStyle(
            color: Theme.of(context).primaryColor,
            dataModuleShape: QrDataModuleShape.square,
          ),
          size: 200),
    );
  }

  Padding textBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: qrTextController,
        maxLines: null,
        decoration: InputDecoration(
            hintText: 'enter a URL or text',
            floatingLabelBehavior: FloatingLabelBehavior.never,
            label: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('generate QR code'),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        onChanged: (value) => setState(() {
          qrText = value;
        }),
      ),
    );
  }

  Center qrQodeTitle(BuildContext context) {
    return Center(
      child: SelectableText(
        'QR QODE',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }

  Center welcomeToText(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to ',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }

  void onAddQRCode() {}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          shrinkWrap: true,
          children: <Widget>[
            welcomeToText(context),
            qrQodeTitle(context),
            const SizedBox(height: 50),
            textBox(),
            const SizedBox(height: 50),
            qrText.isEmpty ? Container() : qrImageViewer(context),
            LayoutBuilder(
              builder: (context, constraints) => 
               Container(
                width: constraints.maxWidth/21,
                height: 100,
                child: IconButton(
                  onPressed: onAddQRCode,
                  icon: Icon(
                    Icons.save,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton:  const FloatingActionButton.extended(
      //   onPressed: null,
      //   label: Text('Save'),
      //   icon: Icon(Icons.save_as_outlined,),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
