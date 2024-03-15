import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import '../../../presentation.dart';

class NotiItem extends StatelessWidget {
  final Msg msg;
  const NotiItem({required this.msg, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: msg.isseen ? Colors.white : const Color.fromARGB(255, 189, 225, 255),
      child: ListTile(
        title: Text(
          'Cảnh báo! - ${msg.time} 🗓️',
          style: TextStyle(fontSize: 18.rps, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(msg.body),
      ),
    );
  }
}
