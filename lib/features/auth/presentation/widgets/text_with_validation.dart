import 'package:flutter/material.dart';

class TextSubmitWidget extends StatefulWidget {
  const TextSubmitWidget({ 
    super.key, 
    required this.onSubmit, 
    this.labelText = 'Input',
    this.hintText = 'Masukkan input',
    this.keyboardType = TextInputType.text,
    this.validator
  });

  final ValueChanged<String> onSubmit;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  State<TextSubmitWidget> createState() => _TextSubmitWidgetState();
}

class _TextSubmitWidgetState extends State<TextSubmitWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(padding: const EdgeInsets.only(left:16, right: 20), 
          child: Text(
            widget.labelText,
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
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              alignLabelWithHint: false,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 16, right: 16),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF757575),
                fontFamily: 'JakartaSans',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Color(0xFFDBDBDB)),
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
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama lengkap harus diisi';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}