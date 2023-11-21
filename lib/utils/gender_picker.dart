import 'package:cpa/data/dummy.dart';
import 'package:flutter/material.dart';

class GenderDropdown extends StatefulWidget {
  String? SelectedValue;
  GenderDropdown({Key? key, this.SelectedValue = "Gender"}) : super(key: key);

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  // String selectedGender = 'Gender';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DropdownButton<String>(
          value: widget.SelectedValue,
          onChanged: (String? newValue) {
            setState(() {
              widget.SelectedValue = newValue!;
              gender = newValue.toString();
            });
          },
          items: <String>['Gender', 'Male', 'Female', 'Others']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text(widget.SelectedValue!),
        ),
      ],
    );
  }
}
