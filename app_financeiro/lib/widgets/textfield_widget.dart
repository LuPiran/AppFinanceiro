

import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final bool obscureText;
  final TextEditingController controller;
  final String hintText;
  final Color color;
  const TextFieldWidget({
    Key? key,
    required this.obscureText,
    required this.hintText,
    required this.color,
    required this.controller
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode focuNode;
  bool isInFocus = false;

  @override
  void initState() {
    super.initState();
    focuNode = FocusNode();

    focuNode.addListener(() {
      if(focuNode.hasFocus){
        setState(() {
          isInFocus = true;
        });
      }else {
        setState(() {
          isInFocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: TextField(
            controller: widget.controller,
            focusNode: focuNode,
            obscureText: widget.obscureText,
            maxLines: 1,
            cursorColor: Colors.grey[400]!,
            decoration: InputDecoration(
              fillColor: widget.color,
              filled: true,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
