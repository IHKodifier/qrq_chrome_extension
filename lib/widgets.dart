import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Center(
          child: Text(
            'Welcome to ',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
    ),
    Center(
          child: SelectableText(
            'QR QODE',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        )
       ],
     );
  }
}

class QRImg extends StatelessWidget {
    const QRImg({super.key, required this.qrText});
  final String qrText;

  @override
  Widget build(BuildContext context) {
    return  Card(
      surfaceTintColor: Theme.of(context).primaryColor,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: QrImageView(
            data: qrText,
            eyeStyle: QrEyeStyle(
                color: Theme.of(context).primaryColor,
                eyeShape: QrEyeShape.square),
            dataModuleStyle: QrDataModuleStyle(
              color: Theme.of(context).primaryColor,
              dataModuleShape: QrDataModuleShape.square,
            ),
            size: 200 ), 
      ),
    );
  }
}


class ScreenDimensions extends StatelessWidget {
  const ScreenDimensions({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Text('${width.toInt().toString()}-W X ${height.toInt().toString()}-H'),
        // Text('HEIGHT: ${height.toString()}'),
      ],
    );
  }
}
class CodesGrid extends StatelessWidget {
  const CodesGrid({super.key, required this.data});
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return  Container(
                        margin: const EdgeInsets.symmetric(vertical: 12), 
                        color: Colors.blueGrey.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ResponsiveGridView.builder(
                            shrinkWrap: true,
                            alignment: Alignment.center,
                            itemCount: data.length,
                            // maxRowCount: 3,
                            gridDelegate: const ResponsiveGridDelegate(
                              childAspectRatio: 1.618033988749894,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              maxCrossAxisExtent: 400,
                              minCrossAxisExtent: 200,
                            ),
                            itemBuilder: gridItemBuilder,
                          ),
                        ),
                      );
  }
  
  Widget gridItemBuilder(BuildContext context, int index) {
    var img = QrImageView(
      data: data[index],
      size: 110,
    );
    return Card(
      color: Theme.of(context).cardColor,
      child:
          // Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // children: [
          Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Row(
              children: [
                Flexible(
                  child: Tooltip(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                    message: data[index],
                    child: Text(
                      data[index].toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 9, 
                      // style: Theme.of(context).textTheme.titleSmall
                      // ?.copyWith(color: Colors.black45),
                    ),
                  ),
                ),
                img,
              ],
            ),
          ),
        ],
      ),
      // ],
      // ),
    );
  }
}