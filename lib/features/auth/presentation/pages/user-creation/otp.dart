import 'package:flutter/material.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/otp_input.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/title_widget.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _formInput(),
      ),
    );
  }

  Column _formInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 92),
        TitleWidget(title: 'Verifikasi OTP', description: "Masukkan kode OTP yang telah kami kirimkan ke email Anda untuk melanjutkan"),
        SizedBox(height: 16),
        OtpWidget(
          length: 5,
          onCompleted: (otp) {
            setState(() {
              print("OTP: $otp");
              // Navigator.pushNamed(context, '/createPassword');
            });
          },
        )
      ],
    );
  }
}