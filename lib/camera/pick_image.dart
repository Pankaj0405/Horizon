import 'package:flutter/material.dart';

class FilePicker extends StatefulWidget {
  const FilePicker({super.key});

  @override
  State<FilePicker> createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePicker> {
  @override
  Widget build(BuildContext context) {
    return content();
  }

  Widget content() {
    return Center(
      child: Container(
        width: 100,
        height: 50,
        color: Colors.lightBlue,
      ),
    );
  }
}
