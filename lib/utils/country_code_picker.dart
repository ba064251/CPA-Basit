import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneDropdown extends StatelessWidget {
  final TextEditingController phoneController;
  const PhoneDropdown({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: phoneController,
      initialCountryCode: 'US',
      // focusNode: focusNode,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
