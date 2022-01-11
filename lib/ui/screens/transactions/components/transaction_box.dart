import 'package:flutter/material.dart';
import 'package:follow_fan/data/models/transaction_model.dart';
import 'package:follow_fan/ui/controllers/transactions_controller.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';

class TransactionBox extends StatelessWidget {
  TransactionBox({Key? key, required this.transaction}) : super(key: key);

  final TransactionModel transaction;

  final TransactionsController controller = Get.find<TransactionsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 70,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: kPrimaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "0${controller.transactions.indexOf(transaction) + 1}",
                        style: TextStyle(
                            fontFamily: kFontFamilySecondary,
                            fontSize: 8,
                            color: kGrayColor),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            controller.getTransactionType(transaction.type),
                            style: TextStyle(fontSize: 12, color: kWhiteColor),
                          ),
                        ],
                      ),
                      Spacer(),
                      Visibility(
                        visible: transaction.money != null,
                        child: Row(
                          children: [
                            Text(
                              "${transaction.money?.value}",
                              style: TextStyle(
                                  fontFamily: kFontFamilySecondary,
                                  fontSize: 12,
                                  color: kWhiteColor),
                            ),
                            Transform.translate(
                              offset: Offset(0, 2),
                              child: Text(
                                "\$",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: kGrayColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "${transaction.points}${transaction.points.isNegative ? "-" : "+"}",
                        style: TextStyle(
                            fontFamily: kFontFamilySecondary,
                            fontSize: 12,
                            color: kWhiteColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "نقطة",
                        style: TextStyle(fontSize: 12, color: kGrayColor),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 70 / 2 - 5,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: transaction.status == "completed"
                      ? kGreenColor
                      : transaction.status == "pending"
                          ? kOrangeColor
                          : kRedColor),
            ),
          )
        ],
      ),
    );
  }
}
