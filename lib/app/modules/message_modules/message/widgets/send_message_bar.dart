import 'package:flutter/material.dart';
import 'package:superup/app/modules/message_modules/message/widgets/round_input.dart';


class SendMessageBar extends StatefulWidget {
  final ValueChanged<String> _handleSubmitted;

    const SendMessageBar(this._handleSubmitted, {Key? key}) : super(key: key);

  @override
  _SendMessageBarState createState() => _SendMessageBarState();
}

class _SendMessageBarState extends State<SendMessageBar> {
  final _textController = TextEditingController();
  bool _showMic = true;

  _handleSubmittedLocal() {
    final text = _textController.text;

    // deal with local first
    _textController.clear();
    setState(() {
      _showMic = true;
    });

    // deal with parent later
    widget._handleSubmitted(text);
  }

  void _handleChange(String text) {
    setState(() {
      _showMic = text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RoundInput(
              textController: _textController,
              handleSubmitted: (String text) {
                _handleSubmittedLocal();
              },
              handleChange: _handleChange,
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: _handleSubmittedLocal,
            child: CircleAvatar(
              child: Icon(_showMic ? Icons.mic : Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
