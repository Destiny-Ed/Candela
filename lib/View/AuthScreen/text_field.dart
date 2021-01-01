import 'package:candela/decorations/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController _controller;
  bool obscure;
  String hint;
  bool password;

  CustomTextField(this._controller,
      {Key? key, this.password = true, this.obscure = false, this.hint = ''})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Icon visibility = const Icon(Icons.visibility);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        color: MyColors().white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors().purple!, width: 2.0),
      ),
      child: TextFormField(
        key: widget.key,
        controller: widget._controller,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: widget.password == true
              ? GestureDetector(
                key: widget.key,
                  onTap: () {
                    //Show and hide password
                    if (widget.obscure == true) {
                      setState(() {
                        widget.obscure = false;
                        visibility = const Icon(Icons.visibility_off);
                      });
                    } else {
                      setState(() {
                        widget.obscure = true;
                        visibility = const Icon(Icons.visibility);
                      });
                    }
                  },
                  child: visibility,
                )
              : const Text(""),
          isDense: true,
          contentPadding: const EdgeInsets.only(
            top: 15,
            bottom: 10,
          ),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
