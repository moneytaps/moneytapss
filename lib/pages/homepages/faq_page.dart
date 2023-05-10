import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class LearnMore extends StatelessWidget {
  const LearnMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Help & Learn more',
          style: TextStyle(
            color: Colors.white,
            fontSize: 29,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Container(
                height: 80,
                width: 300,
                child: Text(
                  '  Loans Your Way',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(thickness: 1.5, color: Colors.black),
            Container(
              child: Text(
                'Why choose MoneyTap loans?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ExpandableText(
                "If you need loans to supplement your income or you simply want to prepare for emergencies, you can rely on MoneyTap to help you build financial security. Tala empowers you with access to loans that are flexible with continuous opportunities for growth.\n\n"
                "Were not just another loan provider in the market. As your trusted financial partner, it is our mission to support and guide you through the ups and downs of managing your finances",
                collapseText: 'Show Less',
                expandText: 'Show more',
                collapseOnTextTap: true,
                maxLines: 5,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.black,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text(
                  'Why is MoneyTap offering a new type of loan?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ExpandableText(
                  "Were continuously improving MoneyTap loans by listening to customer feedback  that includes you.\n"
                  "Many customers have shared that having the flexibility to choose when to repay their loans can help them manage their cash flow and financial obligations better.\n\n"
                  "So to give you more control, Tala now empowers you to choose your own repayment date. This allows you to be more confident that you can repay on time, and gives you the opportunity to pay less fees if you can pay earlier.",
                  collapseText: 'Show Less',
                  expandText: 'Show more',
                  collapseOnTextTap: true,
                  maxLines: 5,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Divider(thickness: 1.5, color: Colors.black),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'what are the new features of Moneytap loans?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ExpandableText(
                  "The new MoneyTap loans allow you to have more control and peace-of-mind with the following features and benefits:\n\n"
                  "The ability to choose a repayment date up to 90 days.\n"
                  "The security of having continuous access to loans which means that you can always borrow again after repaying your current balance..",
                  collapseText: 'Show Less',
                  expandText: 'Show more',
                  collapseOnTextTap: true,
                  maxLines: 5,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Divider(thickness: 1.5, color: Colors.black),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'What are the payment terms and fees for the MoneyTap loans?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ExpandableText(
                  "MoneyTap now gives you the flexibility to choose when to repay your loan. You can choose a repayment date up to 61 days from the day that you avail your loan.\n\n"
                  "MoneyTap also makes sure that our fees are fair and transparent. There are no access fees, processing fees, or any other hidden fees, so you can be assured that you only pay for the service of using a loan.",
                  collapseText: 'Show Less',
                  expandText: 'Show more',
                  collapseOnTextTap: true,
                  maxLines: 5,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
