import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SendMeassge extends StatefulWidget {
  final WebSocketChannel channel;
  const SendMeassge({Key? key, required this.channel}) : super(key: key);

  @override
  State<SendMeassge> createState() => _SendMeassgeState();
}

class _SendMeassgeState extends State<SendMeassge> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web Socket"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Send any message"),
                controller: editingController,
              ),
            ),
            StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: _sendMyMessage,
      ),
    );
  }

  void _sendMyMessage() {
    if (editingController.text.isNotEmpty) {
      widget.channel.sink.add(editingController.text);
      print(editingController.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
