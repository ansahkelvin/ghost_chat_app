import 'package:flutter/material.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({Key? key}) : super(key: key);

  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  String message = '';

  void send() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 8,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Send a message",
                  contentPadding: EdgeInsets.only(left: 8),
                ),
                onChanged: (value) {
                  setState(() {
                    message = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple,
            ),
            child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: message.trim().isEmpty ? () {} : send),
          ),
        ],
      ),
    );
  }
}
