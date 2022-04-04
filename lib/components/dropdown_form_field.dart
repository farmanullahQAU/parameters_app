import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropDownField extends StatelessWidget {
  final String hintText;
  final String? value;
  final Function? validator;

  final Function onChanged;
  final List<dynamic> items;
  const DropDownField(
      {Key? key,
      required this.items,
      required this.hintText,
      required this.onChanged,
      this.value,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
        
      value: value ?? null,
      validator: (value) =>
          this.validator != null ? this.validator!(value) : null,
      items: items.map((dynamic category) {
        return new DropdownMenuItem(
          
            value: category,
            child: Row(
              children: <Widget>[
                Text(category.toString()),
              ],
            ));
      }).toList(),
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
        
        hintText: hintText,
        filled: true,
        // fillColor: bgColor,
        // hoverColor: bgColor,

        //  helperText: 'Helper text',
      ),
    ));
  }
}
