import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author u
/// @date 2020/6/12.
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: FutureBuilder(
        future: rootBundle.loadString('assets/code_mirror_phone.html'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('loading'));
          }
          return WebView(
            initialUrl: snapshot.data?? '''<button>hello world</button>''',
          );
        },
      ),
    ),
  ));
}
