import 'package:flutter/material.dart';

class TextFielWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  const TextFielWidget(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.obscureText});

  @override
  State<TextFielWidget> createState() => _TextFielWidgetState();
}

class _TextFielWidgetState extends State<TextFielWidget> {
  late FocusNode focusNode;
  bool isInFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isInFocused = true;
        });
      } else {
        setState(() {
          isInFocused = false;
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
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            isInFocused
                ? BoxShadow(
                    color: Colors.orange.withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                : BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
          ]),
          child: TextField(
            focusNode: focusNode,
            obscureText: widget.obscureText,
            controller: widget.controller,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange,
                  width: 1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
