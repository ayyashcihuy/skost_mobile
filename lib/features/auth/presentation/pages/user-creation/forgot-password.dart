import 'package:flutter/material.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/text_with_validation.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/title_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({ super.key });

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailFrgotPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: forgotPasswordFormInput(),
      ),
    );
  }

  Column forgotPasswordFormInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 92),
        TitleWidget(title: 'Lupa Kata Sandi', description: 'Masukkan alamat email terdaftar Anda untuk mendapatkan kode verifikasi dan reset kata sandi Anda'),
        SizedBox(height: 32,),
        TextSubmitWidget(
          labelText: "Email",
          hintText: "Masukkan email Anda",
          onChange: (value) {
           setState(() {
             _emailFrgotPasswordController.text = value;
           });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email harus diisi';
            }
            return null;
          },
        ),
        SizedBox(height: 16,),
        _forgotPasswordButton(),
      ]
    );
  }

  Container _forgotPasswordButton() {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
      child: ElevatedButton(
        onPressed: () {
          if(_formKey.currentState!.validate()){
            Navigator.pushNamed(context, "/otp");
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: Color(0xFF2A2E54),
          minimumSize: Size(double.infinity, 50),
        ),
        child: Text("Reset",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'JakartaSans',
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}