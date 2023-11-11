import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
            style: Theme.of(context).textTheme.displayLarge,
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
    return  Center(
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
}


class ScreenDimensions extends StatelessWidget {
  const ScreenDimensions({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Text('WIDTH: ${width.toString()}'),
        Text('HEIGHT: ${height.toString()}'),
      ],
    );
  }
}