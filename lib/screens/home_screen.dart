import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarcopenia/providers/auth_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider);

    return Scaffold(
      appBar: AppBar(title: Text('홈')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            auth.signOut();
          },
          child: Text('로그아웃'),
        ),
      ),
    );
  }
}
