import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrq_chrome_extension/app.dart';
import 'package:qrq_chrome_extension/widgets.dart';
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
  final codesList = <Map<String, dynamic>>[];
  String qrText = '';
  late final TextEditingController qrTextController;
  dynamic  img;
  double width = 0;

  @override
  void initState() {
    qrTextController = TextEditingController(text: qrText);
    super.initState();
  }

  //

  Container textBox() {
    return Container(
      width: width / 2.9,
      child: Padding(
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
            // img=QrImageView(data: value,
            // size: 200,);
          }),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: width,
          height: 650,
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const ScreenDimensions(),
                const PageHeader(),
                const SizedBox(height: 40,),
                textBox(),
                const SizedBox(height: 40,), 
                QRImg(qrText: qrText),
                const SizedBox(height: 40,), 
             ElevatedButton(onPressed: onAddToList, child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: const Icon(Icons.add,size: 50 ,),
             )),
codesList.isNotEmpty?
                Container(
                  height: 500,
                  child: ResponsiveGridView.builder(
                    shrinkWrap: true,
                    alignment: Alignment.center,
                    itemCount: codesList.length,
                    maxRowCount: 3, 
                    gridDelegate: const ResponsiveGridDelegate(
                      childAspectRatio: 1.618033988749894,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      maxCrossAxisExtent: 300,
                      // minCrossAxisExtent: 300,
                    ),
                    itemBuilder: gridItemBuilder,
                  ),
                ):
                Container(
                  color: Colors.blueGrey.shade100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget gridItemBuilder(BuildContext context, int index) {
    img=QrImageView(data: qrText,
    size: 50,);
    return  Card(
      child: Row(
        children: [
          Text(codesList[index]['qrText'].toString(),
          // style: Theme.of(context).textTheme.titleSmall
          // ?.copyWith(color: Colors.black45),
          ),
          img,
        ],
      ),
    );
  }

  Future<void> onAddToList() async {
    setState(() {
       codesList.add({'qrText': qrText,
    'img': QRImg(qrText: qrText)});
    });
   
  }
}
