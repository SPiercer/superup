import 'package:flutter/material.dart';

class RoundInput extends StatelessWidget {
  final Color _color;
  final TextEditingController _textController;
  final ValueChanged<String> _handleSubmitted;
  final ValueChanged<String> _handleChange;

    const RoundInput({Key? key,
    required TextEditingController textController,
    required ValueChanged<String> handleSubmitted,
    required ValueChanged<String> handleChange,
    color,
  })  : _textController = textController,
        _handleSubmitted = handleSubmitted,
        _handleChange = handleChange,
        _color = color ?? Colors.white, super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: _color,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 8.0,
            ),
            Icon(
              Icons.insert_emoticon,
              size: 30.0,
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Type a message',
                  border: InputBorder.none,
                ),
                controller: _textController,
                onSubmitted: _handleSubmitted,
                onChanged: (String text) {
                  if (_handleChange == null) {
                    return;
                  }

                  _handleChange(text);
                },
              ),
            ),
            Icon(
              Icons.attach_file,
              size: 30.0,
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Icon(
              Icons.camera_alt,
              size: 30.0,
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(
              width: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
