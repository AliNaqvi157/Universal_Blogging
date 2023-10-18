// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  // Make sure to set the WebView.platform for Android and iOS
  // if (Platform.isAndroid) {
  //   WebViewController.fromPlatform() = AndroidWebView();
  // } else if (Platform.isIOS) {
  //   WebView.platform = CupertinoWebView();
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Universal  Blogging',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 77, 17, 180)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Universal Blogging"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var controller = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   ..setBackgroundColor(const Color(0x00000000))
  //   ..setNavigationDelegate(
  //     NavigationDelegate(
  //       onProgress: (int progress) {
  //         // Update loading bar.
  //       },
  //       onPageStarted: (String url) {},
  //       onPageFinished: (String url) {},
  //       onWebResourceError: (WebResourceError error) {},
  //       onNavigationRequest: (NavigationRequest request) {
  //         if (request.url.startsWith('https://www.youtube.com/')) {
  //           return NavigationDecision.prevent;
  //         }
  //         return NavigationDecision.navigate;
  //       },
  //     ),
  //   )
  //   ..loadRequest(Uri.parse('https://www.universalblogging.com/'));

  // @override
  // void dispose() {
  //   // controller.dispose(); // Dispose the controller to free resources
  //   super.dispose();
  // }
  int progress = 0;
  late InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Universal Blogging',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 13, 1, 49),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
                url: Uri.parse(
                    "https://www.universalblogging.com/")), //https://techanzy.com/
            // onWebViewCreated: (InAppWebViewController controller {
            //   inAppWebViewController = controller;
            // }),
            onProgressChanged:
                (InAppWebViewController controller, int progress) =>
                    {progress = (progress / 100) as int},
          )
        ],
      ), // WebViewWidget(controller: controller),
    );
  }
}
