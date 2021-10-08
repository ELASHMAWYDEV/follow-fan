import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/screens/transactions/components/transaction_box.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "المعاملات",
      onRefresh: () async {
        print("refreshed");
      },
      body: Column(
        children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
            .map((e) => TransactionBox())
            .toList(),
      ),
    );
  }
}
