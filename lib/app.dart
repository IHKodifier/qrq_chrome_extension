import 'package:flutter/material.dart';
import 'package:qrq_chrome_extension/main.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
// ResponsiveWr
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(

        child: LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(constraints: BoxConstraints(
                      minWidth: 300, minHeight: constraints.maxHeight),
                      child: child!,);
        },), 
        breakpoints: [
        const Breakpoint(start: 200, end: 650, name: MOBILE,),
        const Breakpoint(start: 651, end: 1200, name: TABLET),
        const Breakpoint(start: 1201, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1200, end: 1200, name: 'EXPAND_SIDE_PANEL') ,
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ]),
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
      home: const MyHomePage(title: 'QR Qode Chrome Extension'),
    );
  }
}
