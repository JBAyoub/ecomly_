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
    this.isRegistration,
    this.onValidityChanged,
  }) : _initialHideText = hideText;

  final TextEditingController _fieldController;
  final String _hint;
  final String _labelText;
  final TextInputType? _textInputType;
  final bool _initialHideText;
  final bool isPassword;
  final bool? isRegistration;
  final ValueChanged<bool>? onValidityChanged;

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
  final OutlineInputBorder validFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      style: .solid,
      color: Color(0xFF0C9409),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(10),
  );

  late bool hideText;
  bool? isFieldValid;
  String? _errorText;
  // ignore: unused_field
  bool _hasInteracted = false;

  @override
  void initState() {
    super.initState();
    hideText = widget._initialHideText;
    widget._fieldController.addListener(_onChanged);
  }

  @override
  void dispose() {
    widget._fieldController.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    final value = widget._fieldController.text;
    final errorMessage = _validate(value);
    final isValid = errorMessage == null;

    setState(() {
      _hasInteracted = true;
      _errorText = errorMessage;
      isFieldValid = isValid;
    });
    widget.onValidityChanged?.call(isValid);
  }

  String? _validate(String value) {
    if (value.isEmpty) {
      return 'Please enter your ${widget._labelText}';
    }
    switch (widget._labelText) {
      case 'Email':
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        break;
      case 'Full Name':
        if (!RegExp(r'^[A-Za-z\s]+$').hasMatch(value)) {
          return "Names can't contain numbers or special characters";
        }
        break;
      case 'Password':
        if (widget.isRegistration != null) {
          if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$',
          ).hasMatch(value)) {
            return "Please choose a strong Password";
          }
        }
        break;
    }
    return null;
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
          decoration: InputDecoration(
            errorText: isFieldValid == false ? _errorText : null,
            suffixIcon: _viewModel.buildSuffixIcon(
              isFieldValid: isFieldValid,
              isPassword: widget.isPassword,
              hideText: hideText,
              onPressed: () {
                setState(() {
                  hideText = !hideText;
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
            enabledBorder: isFieldValid == true
                ? validFieldBorder
                : enabledFocusedBorder,
            focusedBorder: isFieldValid == true
                ? validFieldBorder
                : enabledFocusedBorder,

            // Flutter automatically uses these when the validator returns an error string
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
          ),
        ),
      ],
    );
  }
}
