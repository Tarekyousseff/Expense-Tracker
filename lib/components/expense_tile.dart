// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  void Function(BuildContext)? onPressed;
  ExpenseTile(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.amount,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: onPressed,
          icon: Icons.delete,
          backgroundColor: Colors.red,
        )
      ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(amount),
      ),
    );
  }
}
