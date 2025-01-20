import 'package:flutter/material.dart';

class OtpWidget extends StatefulWidget {
  final int length;
  final ValueChanged<String> onCompleted;

  const OtpWidget({
    super.key,
    this.length = 6,
    required this.onCompleted,
  });

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  late List<String> _otpValues;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _otpValues = List.generate(widget.length, (_) => '');
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  void _onChanged(String value, int index) {
    if (value.isEmpty) return;

    setState(() {
      _otpValues[index] = value;
    });

    if (index < widget.length - 1 && value.isNotEmpty) {
      _focusNodes[index + 1].requestFocus();
    }

    if (_otpValues.join().length == widget.length) {
      widget.onCompleted(_otpValues.join());
    }
  }

  void _onBackspace(int index) {
    if (index > 0 && _otpValues[index].isEmpty) {
      _focusNodes[index - 1].requestFocus();
      setState(() {
        _otpValues[index - 1] = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(widget.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: OtpInputField(
              focusNode: _focusNodes[index],
              onChanged: (value) => _onChanged(value, index),
              onBackspace: () => _onBackspace(index),
            ),
          );
        }
      )
    );
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }

    super.dispose();
  }
}

class OtpInputField extends StatelessWidget {
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback onBackspace;

  const OtpInputField({
    super.key,
    required this.focusNode,
    required this.onChanged,
    required this.onBackspace,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: TextFormField(
        focusNode: focusNode,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          counterText: '', // Hides the character counter
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
        onEditingComplete: onBackspace,
      ),
    );
  }
}