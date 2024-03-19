import 'package:flutter/material.dart';
import 'package:siakad_app/core/constants/colors.dart';

enum InputFieldStyle {
  text,
  email,
  password,
  number,
}

class InputField extends StatefulWidget {
  final InputFieldStyle style;
  final String label;
  final TextInputType inputType;
  final TextEditingController controller;

  const InputField.text({
    super.key,
    required this.label,
    required this.controller,
    this.inputType = TextInputType.text,
    this.style = InputFieldStyle.text,
  });

  const InputField.email({
    super.key,
    required this.label,
    required this.controller,
    this.inputType = TextInputType.emailAddress,
    this.style = InputFieldStyle.email,
  });

  const InputField.password({
    super.key,
    required this.label,
    required this.controller,
    this.inputType = TextInputType.visiblePassword,
    this.style = InputFieldStyle.password,
  });

  const InputField.number({
    super.key,
    required this.label,
    required this.controller,
    this.inputType = TextInputType.number,
    this.style = InputFieldStyle.number,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: widget.controller,
            keyboardType: widget.inputType,
            textCapitalization: widget.style == InputFieldStyle.text
                ? TextCapitalization.words
                : TextCapitalization.none,
            textInputAction: widget.style == InputFieldStyle.password
                ? TextInputAction.done
                : TextInputAction.next,
            obscureText:
                _obscureText ? widget.style == InputFieldStyle.password : false,
            cursorColor: AppColor.primary,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
            decoration: InputDecoration(
              hintText: 'Enter your ${widget.label.toLowerCase()}',
              hintStyle: greyTextStyle.copyWith(
                fontSize: 12,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColor.border,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColor.primary,
                  width: 1,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 12.0,
              ),
              suffixIcon: widget.style == InputFieldStyle.password
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: _obscureText ? AppColor.grey : AppColor.primary,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}