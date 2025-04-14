import 'package:flutter/material.dart';

class MFilledButton extends StatelessWidget {
  const MFilledButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: (){}, style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
        backgroundColor: WidgetStatePropertyAll(Colors.blue.shade50),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))), child: Text('View All',style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.black),),);
  }
}
