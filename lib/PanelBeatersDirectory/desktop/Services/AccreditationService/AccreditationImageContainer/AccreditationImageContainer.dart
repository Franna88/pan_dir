import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/myutility.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AccreditationImageComp/ImageBox.dart';

class AccreditationImageContainer extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  const AccreditationImageContainer({super.key, required this.data});

  @override
  State<AccreditationImageContainer> createState() =>
      _AccreditationImageContainerState();
}

class _AccreditationImageContainerState
    extends State<AccreditationImageContainer> {
  final ScrollController _scrollController = ScrollController();

  final List<List<Widget>> imageColumns = List.generate(
    4,
    (columnIndex) => List.generate(6, (rowIndex) => ImageBox()),
  );

  void _launchURL(String url) async {
    if (url != '0') {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var isMobile = MyUtility(context).width < 600;
    return Container(
      width: isMobile
          ? MyUtility(context).width - 25
          : MyUtility(context).width * 0.42,
      height: isMobile
          ? MyUtility(context).height * 0.45
          : MyUtility(context).height * 0.715,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 6, 4, 6),
        child: DraggableScrollbar.rrect(
          controller: _scrollController,
          backgroundColor: Colors.grey,
          alwaysVisibleScrollThumb: true,
          child: GridView.builder(
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 4, // Number of columns in the grid
              childAspectRatio: 3 / 3, // Aspect ratio for each grid item
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            padding: EdgeInsets.all(10),
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              final accreditation = widget.data[index];
              return MouseRegion(
                child: GestureDetector(
                  onTap: () {
                    final url = accreditation[
                        'link']; // Assuming each accreditation has a 'link' key
                    if (url != null) {
                      _launchURL(url);
                    }
                  },
                  child: Card(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 121.04,
                          height: 116.04,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Image.network(accreditation['imageUrl'])
                                  .image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
