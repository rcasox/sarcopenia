import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sarcopenia/providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authActionProvider);

    return Scaffold(
      appBar: AppBar(title: Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(aspectRatio: 10 / 4),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: '회원번호'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: '비밀번호'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                if (email.isNotEmpty && password.isNotEmpty) {
                  await auth
                      .signInWithEmail(email: email, password: password)
                      .catchError((error) {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  title: Text('로그인 실패'),
                                  content: Text('회원번호나 비밀번호가 잘못되었습니다.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('확인'),
                                    ),
                                  ],
                                ),
                          );
                        }

                        return error;
                      });
                  // TODO: navigate to survay
                } else {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text('오류'),
                          content: Text('모든 필드를 입력하세요.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('확인'),
                            ),
                          ],
                        ),
                  );
                }
              },
              child: Text('로그인'),
            ),
            TextButton(
              onPressed: () {
                context.push('/signup');
              },
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
