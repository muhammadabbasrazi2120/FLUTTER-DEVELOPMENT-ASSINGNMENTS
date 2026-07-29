import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Login...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                const Icon(
                  Icons.landscape,
                  size: 40,
                  color: Color(0xFFE85D45), // Approximate deep orange/red
                ),
                const SizedBox(height: 8),
                const Text(
                  'Hipcamp',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 40),
                // Social Logins
                SocialButton(
                  text: 'Continue with Google',
                  icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red, size: 20),
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                SocialButton(
                  text: 'Continue with Facebook',
                  icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 20),
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                SocialButton(
                  text: 'Continue with Apple',
                  icon: const FaIcon(FontAwesomeIcons.apple, color: Colors.black, size: 24),
                  onPressed: () {},
                ),
                const SizedBox(height: 40),
                // Form Fields
                CustomTextField(
                  labelText: 'Email or username',
                  hintText: 'muhammad@gmail.com', // Adjusted to match mockup closely
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email or username';
                    }
                    return null;
                  },
                  suffixIcon: const Icon(Icons.check_circle, color: Color(0xFF139D54)),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                // Login Button
                PrimaryButton(
                  text: 'Log in',
                  onPressed: _login,
                ),
                const SizedBox(height: 24),
                // Bottom Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have Account ? ",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: const Text(
                        "Please Sign up.",
                        style: TextStyle(
                          color: Color(0xFFE85D45),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
