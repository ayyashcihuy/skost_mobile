import 'package:flutter/material.dart';

class BottomSheetDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String hint;
  final String label;
  final String Function(T) itemLabelBuilder;
  final String notFoundValidation;

  const BottomSheetDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hint,
    required this.label,
    required this.itemLabelBuilder,
    required this.notFoundValidation,
  });

  void _showBottomSheet(BuildContext context, FormFieldState<T?> state) {
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
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Color(0xFFDBDBDB),
                    thickness: 1,
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final bool isSelected = item == value;
                    return ListTile(
                      title: Text(itemLabelBuilder(item)),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle)
                          : const Icon(Icons.circle_outlined),
                      onTap: () {
                        onChanged(item);
                        state.didChange(item); // Notify FormField of value change
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
    return FormField<T?>(
      validator: (value) => value == null ? notFoundValidation : null,
      builder: (state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                label,
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
              margin: const EdgeInsets.only(top: 8),
              child: GestureDetector(
                onTap: () => _showBottomSheet(context, state),
                child: InputDecorator(
                  decoration: InputDecoration(
                    filled: true,
                    alignLabelWithHint: false,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 16, right: 16),
                    hintText: hint,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF757575),
                      fontFamily: 'JakartaSans',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: Color(0xFFDBDBDB), width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: Color(0xFFDBDBDB)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                    ),
                    errorStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFE74C3C),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                      const BorderSide(color: Colors.black, width: 1),
                    ),
                    errorText: state.errorText, // Display validation error
                  ),
                  child: Text(
                    value != null ? itemLabelBuilder(value as T) : hint,
                    style: TextStyle(
                      color: value == null ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
