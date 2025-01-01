import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  bool passwordVisible=true;

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
        _formInput(context)
      ],
    );
  }

  Column _formInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        SizedBox(height: 8),
        _titleDescription(),
        SizedBox(height: 32,),
        _emailInput(),
        SizedBox(height: 32,),
        _passwordInput(),
        SizedBox(height: 16,),
        _loginSubmission(context)
      ],
    );
  }

  Column _loginSubmission(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _forgetPassword(),
        SizedBox(height: 16,),
        _loginButton(),
        SizedBox(height: 16,),
        _toRegisterPage(context)
      ]
    );
  }

  Row _toRegisterPage(BuildContext context) {
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
    );
  }

  Column _passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(left:16, right: 20), 
          child: Text(
            'Password',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: 'JakartaSans',
              letterSpacing: 0
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, left: 16, right: 16),
          child: TextField(
            obscureText: passwordVisible,
            decoration: InputDecoration(
              filled: true,
              alignLabelWithHint: false,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 16, right: 16),
              hintText: 'Masukkan password Anda',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF757575),
                fontFamily: 'JakartaSans',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Color(0xFFDBDBDB))
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Colors.black, width: 2)  
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
              errorStyle: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFFE74C3C)
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Colors.black, width: 2)
              ),
              errorText: null, // Changes with error states
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
          ),
        )
      ],
    );
  }

  Column _emailInput() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(left:16, right: 20), 
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'JakartaSans',
                  letterSpacing: 0
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 16, right: 16),
                  hintText: 'Masukkan email Anda',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF757575),
                    fontFamily: 'JakartaSans',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Color(0xFFDBDBDB))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.black, width: 2)  
                  ),
                  errorStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFE74C3C)
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.black, width: 2)
                  ),
                  errorText: null, // Changes with error states
                ),
              ),
            )
          ],
        );
  }

  Padding _titleDescription() {
    return Padding(
          padding: const EdgeInsets.only(left: 16, right: 20),
          child: Text(
            'Masuk untuk melihat kamar yang tersedia dan pilih yang sesuai dengan kebutuhan Anda',
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

  Padding _title() {
    return Padding(
          padding: const EdgeInsets.only(left: 16, right: 20),
          child: Text(
            'Masuk',
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