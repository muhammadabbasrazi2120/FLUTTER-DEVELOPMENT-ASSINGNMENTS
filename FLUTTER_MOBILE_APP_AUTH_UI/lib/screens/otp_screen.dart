import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/primary_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _verify() {
    String otp = _controllers.map((c) => c.text).join();
    if (otp.length == 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP Verified successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter all 4 digits')),
      );
    }
  }

  Widget _buildOtpField(int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '-',
            hintStyle: TextStyle(color: Colors.black38),
          ),
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          onChanged: (value) {
            if (value.isNotEmpty) {
              if (index < 3) {
                _focusNodes[index + 1].requestFocus();
              } else {
                _focusNodes[index].unfocus();
              }
            } else if (value.isEmpty) {
              if (index > 0) {
                _focusNodes[index - 1].requestFocus();
              }
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.black),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Verify Code',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Please enter the code we just sent to email\nmuhammad@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => _buildOtpField(index)),
              ),
              const SizedBox(height: 48),
              const Text(
                "Don't Receive OTP?",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('OTP Resent!')),
                  );
                },
                child: const Text(
                  'Resend code',
                  style: TextStyle(
                    color: Color(0xFFE85D45),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFE85D45),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                text: 'Verify',
                onPressed: _verify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
