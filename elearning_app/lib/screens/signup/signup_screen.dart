import 'package:flutter/material.dart';
// import '../widgets/auth_layout.dart';
import '../../widgets/email_field.dart';
import '../../widgets/password_field.dart';
import '../../widgets/login_button.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/auth_illustration.dart';
import '../../widgets/name_field.dart';
import '../../services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

// class SignupScreen extends StatelessWidget {
// const SignupScreen({super.key});
class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AuthIllustration(
                imagePath:
                    'https://res.cloudinary.com/dvkwwzd6v/image/upload/v1769966270/auth_learning_illustration_jxmudl.png',
              ),

              const Text(
                'Create Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),
              //reused widget
              NAMEField(controller: nameController),

              const SizedBox(height: 16),

              EmailField(controller: emailController),

              const SizedBox(height: 16),

              PasswordField(controller: passwordController),

              const SizedBox(height: 16),

              SizedBox(
                height: 56,
                child: LoginButton(
                  label: 'Sign Up',
                  textStyle: TextStyle(fontSize: 18),
                  onTap: () async {
                    final success = await authService.signUp(
                      emailController.text,
                      passwordController.text,
                    );

                    if (success && context.mounted) {
                      context.go('/login', extra: 'signup_success');
                    }
                  },
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
