import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zoomart/presentation/screens/wooppay_screen/wooppay_presenter.dart';
import 'package:zoomart/presentation/screens/wooppay_screen/wooppay_view_model.dart';

import '../../base/base_screen_state.dart';

class WooppayScreen extends StatefulWidget {
  const WooppayScreen({Key? key}) : super(key: key);

  @override
  _WooppayScreenState createState() => _WooppayScreenState();
}

class _WooppayScreenState extends State<WooppayScreen> {
  final WooppayPresenter _presenter = WooppayPresenter(WooppayViewModel(ScreenState.none));

  @override
  void didChangeDependencies() {
    _presenter.initWithContext(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  const WebView(
        initialUrl: "https://www.test.wooppay.com/invoice/operation?id=323756&key=e987671f8ab9aaa007a95a6c1741cec7",
        javascriptMode: JavascriptMode.unrestricted,

    );
  }
}

