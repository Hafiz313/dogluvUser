import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewPage extends StatefulWidget {

  static const id="web_view_page";
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final _key = UniqueKey();
  bool isLoading=true;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        backgroudColor:kGrayColorBG ,
        backgroundImage: false,
      body: Center(
        child:
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WebView(

                  key:  _key,
                  initialUrl: 'https://dogluv.io/',
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: (finish){
                    setState(() {
                      isLoading= false;
                    });
                  }
              ),
            ) ,isLoading ? Center( child: CircularProgressIndicator(),)
                : Stack(),
          ],
        ),
      ),

    );
  }
}
