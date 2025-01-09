import 'package:flutter/cupertino.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class QuotationRequests extends StatefulWidget {
  const QuotationRequests({super.key});

  @override
  State<QuotationRequests> createState() => _QuotationRequestsState();
}

class _QuotationRequestsState extends State<QuotationRequests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.09,
      height: 20.51,
      padding: const EdgeInsets.symmetric(horizontal: 5.01, vertical: 1.25),
      decoration: ShapeDecoration(
        color: Color(0xFFEF9040),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.51),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Quotation Requests x',
            style: TextStyle(
              color: Color(0xFFE9F0FD),
              fontSize: 12,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
