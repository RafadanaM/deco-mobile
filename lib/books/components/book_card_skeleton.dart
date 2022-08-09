import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/components/shimmer_widget.dart';

class BooksCardSkeleton extends StatelessWidget {
  const BooksCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          leading: const ShimmerWidget.circular(width: 48, height: 48),
          title: Align(
            alignment: Alignment.centerLeft,
            child: ShimmerWidget.rectangular(
              height: 16,
              width: MediaQuery.of(context).size.width * 0.2,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          subtitle: ShimmerWidget.rectangular(
            height: 14,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      );
}
