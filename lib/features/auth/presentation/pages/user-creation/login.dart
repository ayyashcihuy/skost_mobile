import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/text_with_validation.dart';
import 'package:mobile_apps/features/auth/presentation/widgets/title_widget.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final _formkey = GlobalKey<FormState>();

    // Controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(),
      body: SingleChildScrollView(
        child: _login(context),
      ),
    );
  }

  Column _login(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _searchBar(),
        SizedBox(height: 92),
        _input()
      ],
    );
  }

  Form _input() {
    return Form(
      key: _formkey,
      child: _formInput(),
    );
  }

  Column _formInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(title: 'Masuk', description: 'Masuk untuk melihat kamar yang tersedia dan pilih yang sesuai dengan kebutuhan Anda'),
        SizedBox(height: 32,),
        _emailInput(),
        SizedBox(height: 32,),
        TextSubmitWidget(
          labelText: "Password",
          hintText: "Masukkan password Anda",
          isPassword: true,
          onChange: (value) {
           setState(() {
             _passwordController.text = value;
           });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password harus diisi';
            }
            return null;
          },
        ),
        _forgetPassword(),
        _loginButton(),
        SizedBox(height: 16,),
        _toRegisterPage()
      ],
    );
  }

  Row _toRegisterPage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right:5),
          child: Text(
            'Belum punya akun?',
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
            Navigator.pushNamed(context, '/register');
          },
          child: Text("Daftar Sekarang",
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

  Container _loginButton() {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
      child: ElevatedButton(
        onPressed: () {
          if (_formkey.currentState!.validate()) {

          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: Color(0xFF2A2E54),
          minimumSize: Size(double.infinity, 50),
        ),
        child: Text("Masuk",
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

  Padding _forgetPassword() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/forgotPassword');
        },
        child: Text(
          'Lupa kata sandi?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: 'JakartaSans',
            letterSpacing: 0,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  Column _emailInput() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSubmitWidget(
              labelText: "Email",
              hintText: "Masukkan email Anda",
              onChange: (value) {
                setState(() {
                  _emailController.text = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email harus diisi';
                }
                return null;
              },
            ),
          ],
        );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('BOOKOST',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Colors.black,
          fontFamily: 'JakartaSans',
        ),
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
    leading: GestureDetector(
      onTap: () {
        
      },
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          'assets/icons/left-arrow.svg',
          width: 10,
          height: 10,
        ),
      ),
    ), 
    actions: [
      GestureDetector(
        onTap: () {

        },
        child: Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/ellipsis-dots-h.svg',
            width: 30,
            height: 30,
          ),
        ),
      ),
    ],
  );
  }
}