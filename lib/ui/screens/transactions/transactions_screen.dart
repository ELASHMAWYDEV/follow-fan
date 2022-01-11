import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/controllers/transactions_controller.dart';
import 'package:follow_fan/ui/screens/transactions/components/transaction_box.dart';
import 'package:get/get.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({Key? key}) : super(key: key);

  final TransactionsController controller = Get.put(TransactionsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionsController>(builder: (_) {
      return MainLayout(
          title: "المعاملات",
          onRefresh: () async {
            await _.getMyTransactions();
          },
          body: Column(
            children: [
              Visibility(
                visible: _.transactions.length != 0,
                child: Column(
                  children: _.transactions.reversed
                      .map((transaction) => TransactionBox(
                            transaction: transaction,
                          ))
                      .toList(),
                ),
              ),
              Visibility(
                visible: _.transactions.length == 0,
                child: Center(child: Text("لا يوجد معاملات لعرضها")),
              )
            ],
          ));
    });
  }
}
