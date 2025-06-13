import 'package:flutter/material.dart';

import 'base_view.dart';

class ViewTop extends BaseView {
  const ViewTop({super.key});

  @override
  State createState() => _ViewTopState();
}

class _ViewTopState extends BaseViewState {
  @override
  Widget build(BuildContext context) {
    return buildBaseLayout(
      title: 'ホーム',
      // childに画面レイアウトを記載
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.redirectToLogin?.call();
              },
              child: const Text('ログインへ遷移'),
            ),
          ],
        ),
      ),
    );
  }
}
