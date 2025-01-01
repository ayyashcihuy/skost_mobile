import 'package:flutter/material.dart';

class BottomSheetDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String hint;
  final String label;
  final String Function(T) itemLabelBuilder;

  const BottomSheetDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hint,
    required this.label,
    required this.itemLabelBuilder,
  });

  @override
  State<BottomSheetDropdown<T>> createState() => _BottomSheetDropdownState<T>();
}

class _BottomSheetDropdownState<T> extends State<BottomSheetDropdown<T>> {
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: widget.items.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Color(0xFFDBDBDB),
                    thickness: 1,
                    height: 1,
                    indent: 16,
                    endIndent: 16
                  ),
                  itemBuilder: (context, index) {
                    final item = widget.items[index];
                    final bool isSelected = item == widget.value;
                    return ListTile(
                      title: Text(widget.itemLabelBuilder(item)),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle)
                          : const Icon(Icons.circle_outlined),
                      onTap: () {
                        widget.onChanged(item);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(padding: const EdgeInsets.only(right: 20), 
          child: Text(
            widget.label,
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
          margin: EdgeInsets.only(top: 8),
          child: GestureDetector(
            onTap: _showBottomSheet,
            child: InputDecorator(
              decoration: InputDecoration(
                filled: true,
                alignLabelWithHint: false,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 16, right: 16),
                hintText: 'Masukkan nama lengkap Anda',
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
              child: Text(
                widget.value != null
                    ? widget.itemLabelBuilder(widget.value as T)
                    : widget.hint,
                style: TextStyle(
                  color: widget.value == null ? Colors.grey : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
