import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'view_login.dart';
import 'view_top.dart';

void main() {
  runApp(const Main());
}

/// 画面定義
final _router = GoRouter(
  initialLocation: '/', // 初期表示画面
  routes: [
    GoRoute( // Top画面
      path: '/',
      builder: (context, state) => const ViewTop(),
    ),
    GoRoute( // ログイン画面
      path: '/login',
      builder: (context, state) => const ViewLogin(),
    ),
  ],
);

/// エントリーポイントとなるクラス
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "勤怠管理システム（仮）",
      routerConfig: _router,
    );
  }
}