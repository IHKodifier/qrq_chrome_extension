import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrq_chrome_extension/app.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 900,
          height: 650,
          child: ResponsiveRowColumn(
            layout: ResponsiveRowColumnType.ROW,
            // width: 500,
            children: [
              ResponsiveRowColumnItem(
                child: ResponsiveBreakpoints.of(context).isMobile
                    ? const Text('Mobile')
                    : Container(),
                //  ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                //   // mainAxisSize: MainAxisSize.min,
                //   shrinkWrap: true,
                //   children: <Widget>[
                //         ResponsiveBreakpoints.of(context).isMobile?const Text('Mobile'):Container(),
                //         ResponsiveBreakpoints.of(context).isTablet?const Text('Tablet'):Container(),
                //         ResponsiveBreakpoints.of(context).isDesktop?const Text('Desktop'):Container(),
                //         // ResponsiveBreakpoints.of(context).is?Text('Mobile'):Container(),
                //         // ResponsiveBreakpoints.of(context).smallerThan('TABLET')?Text('Less than tablet'):Container(),

                //     welcomeToText(context),
                //     qrQodeTitle(context),
                //     const SizedBox(height: 50),
                //     textBox(),
                //     const SizedBox(height: 50),
                //     qrText.isEmpty ? Container() : qrImageViewer(context),
                //     LayoutBuilder(
                //       builder: (context, constraints) =>
                //        Container(
                //         width: constraints.maxWidth/21,
                //         height: 100,
                //         child: IconButton(
                //           onPressed: onAddQRCode,
                //           icon: const Icon(
                //             Icons.save,
                //           ),
                //         ),
                //       ),
                //     ),

                //   ],
                // ),
              ),
              ResponsiveRowColumnItem(
                child: ResponsiveBreakpoints.of(context).isTablet
                    ? const Text('Tablet')
                    : Container(), 
              ),
              ResponsiveRowColumnItem(
                child: ResponsiveBreakpoints.of(context).isDesktop
                    ? const Text('Desktop')
                    : Container(), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
