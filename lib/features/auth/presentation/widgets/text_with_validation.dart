import 'package:flutter/material.dart';

class TextSubmitWidget extends StatefulWidget {
  const TextSubmitWidget({
    super.key,
    required this.onChange,
    this.labelText = 'Input',
    this.hintText = 'Masukkan input',
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isPassword = false, // Add this parameter
  });

  final ValueChanged<String> onChange;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword; // Indicate if this field is for password input

  @override
  State<TextSubmitWidget> createState() => _TextSubmitWidgetState();
}

class _TextSubmitWidgetState extends State<TextSubmitWidget> {
  bool _obscureText = true; // Manage password visibility state

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 20),
          child: Text(
            widget.labelText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: 'JakartaSans',
              letterSpacing: 0,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              alignLabelWithHint: false,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Color(0xFFDBDBDB), width: 1),
              ),
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF757575),
                fontFamily: 'JakartaSans',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Color(0xFFDBDBDB), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Color(0xFFDBDBDB), width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Color(0xFFDBDBDB), width: 2),
              ),
              errorStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFFE74C3C),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
              errorText: null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
            ),
            keyboardType: widget.keyboardType,
            textInputAction: TextInputAction.next,
            onChanged: widget.onChange,
            validator: widget.validator,
            obscureText: widget.isPassword ? _obscureText : false, // Hide text if password
          ),
        ),
      ],
    );
  }
}
