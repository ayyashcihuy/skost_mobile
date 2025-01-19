import 'package:flutter/material.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/text_with_validation.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/title_widget.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: createPasswordFormInput(),
      ),
    );
  }

  Column createPasswordFormInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 92),
        TitleWidget(title: "Buat Kata Sandi", description: "Buat kata sandi yang kuat dengan kombinasi huruf besar, huruf kecil, angka dan simbol."),
        SizedBox(height: 32,),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextSubmitWidget(
                labelText: "Kata Sandi",
                hintText: "Masukan kata sandi anda",
                isPassword: true,
                onChange: (value) {
                 setState(() {
                   _passwordController.text = value;
                 });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password harus diisi";
                  }

                  return null;
                },
              ),
              SizedBox(height: 16,),
              TextSubmitWidget(
                labelText: "Ulangi Kata Sandi",
                hintText: "Ulangi kata sandi anda",
                isPassword: true,
                onChange: (value) {
                  setState(() {
                    _confirmPasswordController.text = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Konfirmasi password harus diisi";
                  }

                  return null;
                },
              ),
              SizedBox(height: 32,),
              _createPasswordButton()
            ]
          )
        )
      ],
    );
  }

  Container _createPasswordButton() {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
      child: ElevatedButton(
        onPressed: () {
          if(_formKey.currentState!.validate()){

          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: Color(0xFF2A2E54),
          minimumSize: Size(double.infinity, 50),
        ),
        child: Text("Buat Kata Sandi",
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