import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  static const String routeName = '/category-card-list';
  final String category;
  const CardList({super.key, required this.category});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(child: Text(widget.category),),);
  }
}