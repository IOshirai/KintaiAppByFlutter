import 'package:flutter/material.dart';

import 'base_view.dart';

class ViewLogin extends BaseView {
  const ViewLogin({super.key});

  @override
  State createState() => _ViewLoginState();
}

class _ViewLoginState extends BaseViewState {
  @override
  Widget build(BuildContext context) {
    return buildBaseLayout(
      title: 'ログイン画面',
      // childに画面レイアウトを記載
      child: Center(
        child: ElevatedButton(
          child: const Text('テスト'),
          onPressed: () {
            final state = context.findAncestorStateOfType<BaseViewState>();
            state?.redirectToLogin();
          },
        ),
      ),
    );
  }
}
