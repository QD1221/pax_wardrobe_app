import 'package:flutter/material.dart';

class DoorsPage extends StatefulWidget {
  const DoorsPage({Key? key}) : super(key: key);

  @override
  State<DoorsPage> createState() => _DoorsPageState();
}

class _DoorsPageState extends State<DoorsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Door UI'),
    );
  }
}
