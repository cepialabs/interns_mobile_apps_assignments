import 'package:flutter/material.dart';
// import '../widgets/email_field.dart';23.

import '../../widgets/login_button.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              const SizedBox(height: 16),

              const Icon(Icons.lock_reset, size: 80),

              const SizedBox(height: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  const Text(
                    'Enter your email to receive a reset link',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Reused widget
              // const EmailField(),
              const SizedBox(height: 24),

              //  Reused button with custom label
              SizedBox(
                height: 56,
                child: LoginButton(
                  label: 'Send Reset Link',
                  textStyle: TextStyle(fontSize: 18),
                  onTap: () {},
                ),
              ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  context.go('/login');
                },
                child: const Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
