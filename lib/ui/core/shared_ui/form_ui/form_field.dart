import 'package:flutter/material.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/form_field_view_model.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this._fieldController,
    required this._hint,
    required this._labelText,
    this._textInputType,
    bool hideText = false,
    this.isPassword = false,
  }) : _initialHideText = hideText;

  final TextEditingController _fieldController;
  final String _hint;
  final String _labelText;
  final TextInputType? _textInputType;
  final bool _initialHideText;
  final bool isPassword;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final FormFieldViewModel _viewModel = FormFieldViewModel();
  final OutlineInputBorder enabledFocusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Color.fromARGB(70, 6, 6, 6), width: 1),
    borderRadius: BorderRadius.circular(10),
  );

  final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(173, 241, 11, 11),
      width: 1,
    ),
    borderRadius: BorderRadius.circular(10),
  );

  late bool hideText;
  bool? isFieldValid;
  @override
  void initState() {
    super.initState();
    hideText = widget._initialHideText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget._labelText,
          style: const TextStyle(fontFamily: 'GeneralSans', fontSize: 18),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget._fieldController,
          keyboardType: widget._textInputType,
          obscureText: hideText,
          validator: (value) {
            String? errorMessage;

            if (value == null || value.isEmpty) {
              errorMessage = 'Please enter your ${widget._labelText}';
            } else {
              switch (widget._labelText) {
                case 'Email':
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    errorMessage = 'Please enter a valid email';
                  }
                  break;
                case 'Full Name':
                  // Removed JavaScript regex slashes
                  if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
                    errorMessage =
                        "Names can't contain numbers or special characters";
                  }
                  break;
                case 'Password':
                  if (!RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                  ).hasMatch(value)) {
                    errorMessage = "Please choose a strong Password";
                  }
                  break;
              }
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  isFieldValid = errorMessage == null;
                });
              }
            });
            return errorMessage;
          },
          decoration: InputDecoration(
            suffixIcon: _viewModel.buildSuffixIcon(
              isFieldValid: isFieldValid,
              isPassword: widget.isPassword,
              hideText: hideText,
              onPressed: () {
                setState(() {
                  hideText != hideText;
                });
              },
            ),
            contentPadding: const EdgeInsets.all(18),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: widget._hint,
            hintStyle: const TextStyle(
              fontFamily: 'GeneralSans',
              fontSize: 16,
              fontWeight: FontWeight.w100,
              color: Color.fromARGB(255, 149, 149, 149),
            ),
            enabledBorder: enabledFocusedBorder,
            focusedBorder: enabledFocusedBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
          ),
        ),
      ],
    );
  }
}
