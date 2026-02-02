import 'package:flutter/material.dart';
import '../../widgets/email_field.dart';
import '../../widgets/password_field.dart';
import '../../widgets/login_button.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/auth_illustration.dart';
import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// class LoginScreen extends StatelessWidget {
//  const LoginScreen({super.key});
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _shownSignupMessage = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_shownSignupMessage) return;

    final state = GoRouterState.of(context);
    final message = state.extra;

    if (message == 'signup_success') {
      _shownSignupMessage = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully. Please log in.'),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              const AuthIllustration(
                imagePath:
                    'https://res.cloudinary.com/dvkwwzd6v/image/upload/v1769966270/auth_learning_illustration_jxmudl.png',
              ),

              // const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  const SizedBox(height: 16),
                  SizedBox(
                    width: 280,
                    child: Text(
                      'Log in to access your courses and track your progress.',
                      textAlign: TextAlign.center,
                      textWidthBasis: TextWidthBasis.longestLine,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              // reused widget
              EmailField(controller: emailController),
              const SizedBox(height: 16),
              PasswordField(controller: passwordController),
              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context.go('/forgot-password');
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF2F6FED),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 56,
                child: LoginButton(
                  label: 'Login',
                  textStyle: TextStyle(fontSize: 18),
                  onTap: () async {
                    final errorMessage = await authService.login(
                      emailController.text,
                      passwordController.text,
                    );

                    if (!context.mounted) return;

                    if (errorMessage != null) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(errorMessage)));
                    } else {
                      context.go('/explore');
                    }
                  },
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      context.go('/signup');
                    },
                    child: const Text('Sign Up'),
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
