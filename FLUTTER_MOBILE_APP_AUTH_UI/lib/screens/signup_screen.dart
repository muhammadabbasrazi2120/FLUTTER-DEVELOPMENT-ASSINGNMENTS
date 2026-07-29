import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import 'otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OtpScreen()),
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
                  color: Color(0xFFE85D45),
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
                  labelText: 'Name',
                  hintText: 'Muhamamd',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  suffixIcon: const Icon(Icons.check_circle, color: Color(0xFF139D54)),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'muhammad@gmail.com',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
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
                // Sign Up Button
                PrimaryButton(
                  text: 'Create Account',
                  onPressed: _signUp,
                ),
                const SizedBox(height: 24),
                // Bottom Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have An Account ? ",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Please Login.",
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
