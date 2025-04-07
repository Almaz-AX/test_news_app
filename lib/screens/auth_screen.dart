import 'package:flutter/material.dart';
import 'package:test_news_app/injection_container.dart';
import 'package:test_news_app/local_storage/app_database.dart';
import 'package:test_news_app/navigation/main_navigation.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String login = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shrinkWrap: true,
          children: [
            CustomTextFormField(
              onChanged:
                  (value) => setState(() {
                    login = value;
                  }),
              formName: 'Login',
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              onChanged:
                  (value) => setState(() {
                    password = value;
                  }),
              formName: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: (login.isEmpty || password.isEmpty) ? null : auth,
              child: const Text('SignIn'),
            ),
          ],
        ),
      ),
    );
  }

  void auth() {
    sl<AppDatabase>().changeAuthStatus(true);
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainNavigationRouteNames.main,
      (Route<dynamic> route) => false,
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.formName,
    required this.onChanged,
    this.obscureText = false,
  });
  final String formName;
  final void Function(String value) onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        hintText: formName,
      ),
      obscureText: obscureText,
    );
  }
}
