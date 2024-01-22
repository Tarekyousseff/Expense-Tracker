// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  ExpenseTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(amount),
    );
    
  }
}
