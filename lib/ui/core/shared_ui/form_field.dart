import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormField extends StatefulWidget {
  CustomFormField({
    super.key,
    required this._fieldController,
    required this._hint,
    required this._labelText,
    this._textInputType,
    this.hideText = false,
    this.isPassword = false,
  });

  final TextEditingController _fieldController;
  final String _hint;
  final String _labelText;
  final TextInputType? _textInputType;
  bool hideText;
  final bool isPassword;
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final OutlineInputBorder enabledFocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(70, 6, 6, 6), width: 1),
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text(
          widget._labelText,
          style: TextStyle(fontFamily: 'GeneralSans', fontSize: 18),
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your ${widget._labelText}';
            }
            switch (widget._labelText) {
              case 'Email':
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                break;
              case 'Full Name':
                if (!RegExp(r'/^[A-Za-z]+$/').hasMatch(value)) {
                  return "Names can't contain numbers or special characters";
                }
                break;
              case 'Password':
                if (!RegExp(
                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                ).hasMatch(value)) {
                  return "Please choose a strong Password";
                }
            }
            return null;
          },
          obscureText: widget.hideText,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    color: const Color.fromARGB(100, 0, 0, 0),
                    icon: Icon(
                      widget.hideText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.hideText = !widget.hideText;
                      });
                    },
                  )
                : null,
            contentPadding: const EdgeInsets.all(18),
            floatingLabelBehavior: .never,
            hint: Text(
              widget._hint,
              style: TextStyle(
                fontFamily: 'GeneralSans',
                fontSize: 16,
                fontWeight: .w100,
                color: const Color.fromARGB(255, 149, 149, 149),
              ),
            ),
            enabledBorder: enabledFocusedBorder,
            focusedBorder: enabledFocusedBorder,
          ),
          autocorrect: false,
          controller: widget._fieldController,
          keyboardType: widget._textInputType,
          enableSuggestions: true,
        ),
      ],
    );
  }
}
