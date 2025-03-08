import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarcopenia/providers/auth_provider.dart';

class SignupScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authActionProvider);

    return Scaffold(
      appBar: AppBar(title: Text('회원가입')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: '이메일'),
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
                  await auth.signUpWithEmail(email: email, password: password);
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
              child: Text('계정 생성'),
            ),
          ],
        ),
      ),
    );
  }
}
