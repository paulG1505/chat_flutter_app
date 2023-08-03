import 'package:flutter/material.dart';

class MassageFieldBox extends StatelessWidget {
  const MassageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(15));
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print('button $textValue');
          textController.clear();
        },
      ),
    );

    return TextFormField(
        onTapOutside: (event) {
          focusNode.unfocus(); //cuando click afuera quita el foco
        },
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          textController.clear();
          focusNode.requestFocus(); //despues que se limpia el foco se mantine
        });
  }
}
