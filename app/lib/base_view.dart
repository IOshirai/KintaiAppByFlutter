import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class BaseView extends StatefulWidget {
  const BaseView({
    super.key
  });
}

/// 各画面で共通して使用する処理を呼び出すためのインターフェース
class BaseViewController {
  void Function()? redirectToLogin;
  void Function(bool isVisible)? showLoading;
}

abstract class BaseViewState extends State<BaseView> {
  final BaseViewController controller = BaseViewController();
  bool _isMenuVisible = true;
  bool _isProgressVisible = false;

  @override
  void initState() { // 画面表示時の処理を記載
    super.initState();

    // 各画面共通で使用する処理のインターフェースを設定
    controller.redirectToLogin = redirectToLogin;
    controller.showLoading = setProgressVisibility;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 画面表示完了時に呼び出す処理を記載
    });
  }

  @override
  void dispose() {
    // 画面が閉じられる時に呼び出す処理を記載
    super.dispose();
  }

  /// 左上のメニューを表示するか？
  /// trueの場合は表示
  void setMenuVisibility(bool visible) {
    setState(() {
      _isMenuVisible = visible;
    });
  }

  /// 全体プログレスを表示するか？
  /// trueの場合は表示
  void setProgressVisibility(bool visible) {
    setState(() {
      _isProgressVisible = visible;
    });
  }

  /// ログイン画面を表示
  void redirectToLogin() {
    context.go('/login');
  }

  /// ベースとなるレイアウトの定義
  Widget buildBaseLayout({String title = '', required Widget child}) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: _isMenuVisible ? Builder(
          builder: (context) =>
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ): null,
      ),
      drawer: _isMenuVisible ? Drawer( //
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('メニュー', style: TextStyle(color: Colors.white)),
            ),
            ListTile(title: Text('項目1')),
            ListTile(title: Text('項目2')),
          ],
        ),
      ): null,
      body: Stack(
        children: [
          child,
          if (_isProgressVisible) // プログレス表示
            AbsorbPointer(
              absorbing: true,
              child: Container(
                color: Colors.black45,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
