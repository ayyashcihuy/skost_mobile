import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_apps/features/auth/api/register.dart';
import 'package:mobile_apps/features/auth/data/models/otp.dart';
import 'package:mobile_apps/features/auth/data/states/registration_state.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/otp_input.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/title_widget.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Otp Controller
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _formInput(),
      ),
    );
  }

  Future<void> otpSubmission(Map<String, dynamic> body) async {
    String apiUrl = dotenv.env['DEV_BASE_URL'] ?? '';

    try {
      // Add headers if needed (e.g., for JSON content type)
      await RegisterClient().otpSubmission(
        '$apiUrl/api/v1/customer/otp',
        body: body, // Pass the request body here
      );
      
      // Process the response if needed (e.g., show success dialog/snackbar)
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verifikasi OTP berhasil!')),
      );
    } catch (e) {
      // Handle exceptions or show error messages to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verifikasi OTP gagal!: $e')),
      );
      rethrow;
    }
  }

  Future<void> otpResend() async {
    String apiUrl = dotenv.env['DEV_BASE_URL'] ?? '';

    try {
      // Add headers if needed (e.g., for JSON content type)
      await RegisterClient().otpResend(
        '$apiUrl/api/v1/customer/otp/refresh',
        body: {
          'email': context.read<RegistrationState>().email,
        },
      );
      
      // Process the response if needed (e.g., show success dialog/snackbar)
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Silahkan check email Anda untuk melakukan verifikasi OTP')),
      );
    } catch (e) {
      // Handle exceptions or show error messages to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verifikasi OTP gagal!: $e')),
      );
      rethrow;
    }
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final body = OtpSubmissionAlbum(
        email: context.read<RegistrationState>().email,
        otp: _otpController.text,
      ).toJson();

      try {
        // await otpSubmission(body);

        // // Add headers if needed (e.g., for JSON content type)
        // if (!mounted) return;
        Navigator.pushNamed(context, '/createPassword');
      } catch (e) {
        // Handle exceptions or show error messages to the user
        rethrow;
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  void _resendOtp() async {
    try {
      await otpResend();

      setState(() {
        _otpController.text = '';
      });

      if (!mounted) return;
    } catch (e) {
      // Handle exceptions or show error messages to the user
      rethrow;
    }
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
              _otpController.text = otp;
            });
          },
        ),
        SizedBox(height: 16,),
        _refreshOtp(),
        _OtpSubmissionButton(),
      ],
    );
  }

  Row _refreshOtp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(),
          child: Text(
            'Tidak menerima OTP?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontFamily: 'JakartaSans',
              letterSpacing: 0,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        TextButton(
          onPressed: _resendOtp,
          child: Text("Klik disini",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2A2E54),
              fontFamily: 'JakartaSans',
              letterSpacing: 0,
            ),
          ),
        )
      ],
    );
  }

  Container _OtpSubmissionButton() {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
      child: ElevatedButton(
        onPressed: _isLoading ? null : submitForm,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: Color(0xFF2A2E54),
          minimumSize: Size(double.infinity, 50),
        ),
        child: _isLoading ? SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3,
          ),
        ) : Text("Verifikasi",
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