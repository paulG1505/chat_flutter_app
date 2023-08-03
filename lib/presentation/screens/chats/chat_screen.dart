import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/550x/35/f6/71/35f6716adc65383508eca7cfda5b5594.jpg'),
            ),
          ),
          title: const Text('Contact'),
          centerTitle: false,
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: _ChatView(),
        ));
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //llamado al provider
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];
                //identificamos de quien es el mensaje
                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message:message)
                    : MyMessageBubble(message:message);
              },
            )),
            const MassageFieldBox()
          ],
        ),
      ),
    );
  }
}
