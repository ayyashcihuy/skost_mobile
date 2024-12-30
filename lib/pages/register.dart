import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: _register()
      ),
    );
  }

  Column _register() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _searchBar(),
        SizedBox(height: 92),
        _title(),
        _titleDescription(),
      ],
    );
  }

  Padding _title() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20),
      child: Text(
        'Daftar Akun',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontFamily: 'JakartaSans',
          letterSpacing: -0.1
        ),
      ),
    );
  }

  Padding _titleDescription() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20),
      child: Text(
        'Temukan kenyamanan dan keamanan di Kos Keluarga. Daftarkan diri Anda segera sebelum kehabisan!',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'JakartaSans',
          height: 1.5,
        ),
      ),
    );
  }
}