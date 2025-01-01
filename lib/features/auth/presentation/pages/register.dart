import 'package:flutter/material.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/dropdown_with_value.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/text_with_validation.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGenderValue;

  // Controller
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController(text: 'male');
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _register(),
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
        SizedBox(height: 32,),
        TextSubmitWidget(
          labelText: "Nama Lengkap",
          hintText: "Masukkan nama lengkap Anda",
          onSubmit: (value) {
            _fullNameController.text = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Nama lengkap harus diisi';
            }
            return null;
          },
        ),
        SizedBox(height: 16,),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: BottomSheetDropdown<String>(
            items: ['male', 'female'],
            value: _selectedGenderValue,
            onChanged: (value) {
              setState(() {
                _selectedGenderValue = value;
                _genderController.text = value ?? '';
              });
            },
            hint: _selectedGenderValue != null ? 'Pilih jenis kelamin Anda' : 'Pilih jenis kelamin Anda',
            label: 'Jenis Kelamin',
            itemLabelBuilder: (value) => value == 'male' ? 'Laki-laki' : 'Perempuan',
          ),
        ),
        SizedBox(height: 16,),
        TextSubmitWidget(
          labelText: "Nomor HP",
          hintText: "Masukkan nomor HP Anda",
          onSubmit: (value) {
            _phoneNumberController.text = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Nomor HP harus diisi';
            }
            return null;
          },
        ),
        SizedBox(height: 16,),
        TextSubmitWidget(
          labelText: "Email",
          hintText: "Masukkan email Anda",
          onSubmit: (value) {
            _emailController.text = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email harus diisi';
            }
            return null;
          },
        ),
        SizedBox(height: 16,),
        TextSubmitWidget(
          labelText: "Pekerjaan",
          hintText: "Masukkan pekerjaan Anda",
          onSubmit: (value) {
            _occupationController.text = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Pekerjaan harus diisi';
            }
            return null;
          },
        ),
        SizedBox(height: 16,),
        _registerButton(),
        SizedBox(height: 16,),
        _toLoginPage(context)
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

  Container _registerButton() {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
      child: ElevatedButton(
        onPressed: () {
          
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: Color(0xFF2A2E54),
          minimumSize: Size(double.infinity, 50),
        ),
        child: Text("Daftar",
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

  Row _toLoginPage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'Sudah punya akun?',
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
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text("Masuk",
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
}