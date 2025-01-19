import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_apps/features/auth/api/register.dart';
import 'package:mobile_apps/features/auth/data/models/register.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/dropdown_with_value.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/text_with_validation.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/title_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGenderValue;
  bool _isLoading = false;

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
        child: _formInput(),
      ),
    );
  }

  Future<void> registerCustomer(Map<String, dynamic> body) async {
    String apiUrl = dotenv.env['DEV_BASE_URL'] ?? '';

    try {
      // Add headers if needed (e.g., for JSON content type)
      await RegisterClient().register(
        '$apiUrl/api/v1/customer/register',
        body: body, // Pass the request body here
      );
      
      // Process the response if needed (e.g., show success dialog/snackbar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration successful!')),
      );
    } catch (e) {
      // Handle exceptions or show error messages to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed!: $e')),
      );
      rethrow;
    }
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final body = RegisterAlbum(
        full_name: _fullNameController.text,
        gender: _selectedGenderValue,
        email: _emailController.text,
        phone: _phoneNumberController.text,
        occupation: _occupationController.text,
      ).toJson();

      try {
        await registerCustomer(body);
        // Show success message (e.g., Snackbar or dialog)
        Navigator.pushNamed(context, '/otp');
      } catch (e) {
        // Show error message
        rethrow;
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Column _register() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _searchBar(),
        SizedBox(height: 92),
        TitleWidget(title: 'Daftar Akun', description: 'Temukan kenyamanan dan keamanan di Kos Keluarga. Daftarkan diri Anda segera sebelum kehabisan!'),
        SizedBox(height: 32,),
        TextSubmitWidget(
          labelText: "Nama Lengkap",
          hintText: "Masukkan nama lengkap Anda",
          onChange: (value) {
            setState(() {
              _fullNameController.text = value;
            });
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
            notFoundValidation: "Pilih jenis kelamin Anda",
          ),
        ),
        SizedBox(height: 16,),
        TextSubmitWidget(
          labelText: "Nomor HP",
          hintText: "Masukkan nomor HP Anda",
          onChange: (value) {
            setState(() {
              _phoneNumberController.text = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Nomor HP harus diisi';
            }
            return null;
          },
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16,),
        TextSubmitWidget(
          labelText: "Email",
          hintText: "Masukkan email Anda",
          onChange: (value) {
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
          onChange: (value) {
            setState(() {
              _occupationController.text = value;
            });
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

  Form _formInput() {
    return Form(
      key: _formKey,
      child: _register()
    );
  }

  Container _registerButton() {
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
        ) : Text("Daftar",
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