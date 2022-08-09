import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/components/shimmer_widget.dart';

class BookCard extends StatelessWidget {
  final String title;
  final bool isSkeleton;
  const BookCard({Key? key, required this.title, this.isSkeleton = false})
      : super(key: key);
  const BookCard.loading({Key? key, this.title = "", this.isSkeleton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: !isSkeleton
            ? const Icon(
                Icons.image_outlined,
                size: 48,
              )
            : const ShimmerWidget.circular(width: 48, height: 48),
        title: !isSkeleton
            ? Text(title)
            : Align(
                alignment: Alignment.centerLeft,
                child: ShimmerWidget.rectangular(
                  height: 16,
                  width: MediaQuery.of(context).size.width * 0.2,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
        subtitle: !isSkeleton
            ? const Text("A subtitle")
            : ShimmerWidget.rectangular(
                height: 14,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
      ),
    );
  }
}
