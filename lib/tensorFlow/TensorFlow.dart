import 'package:flutter/material.dart';
import 'package:flutter_app/drawer/MyDrawer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class TensorFlow extends StatefulWidget {
  @override
  _TensorFlowState createState() => _TensorFlowState();
}

WebViewController webViewctrl;
class _TensorFlowState extends State<TensorFlow> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('일별 예측'),
      ),
      drawer: new MyDrawer(),
      body: Center(
        child: Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: false,
          child: WebView(
            initialUrl: 'https://stockpago.github.io/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
              webViewctrl = webViewController;
            },
            javascriptChannels: <JavascriptChannel>[
              _test(context),
            ].toSet(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed: () {
          webViewctrl.evaluateJavascript("test()").then((String text) {
            print(text);
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

JavascriptChannel _test(BuildContext context) {
  return JavascriptChannel(
      name: 'test',
      onMessageReceived: (JavascriptMessage message) {
        /*String result = scanBarcode(context);
        ******I got result of scanned barcode in result variable*******/
      });
}