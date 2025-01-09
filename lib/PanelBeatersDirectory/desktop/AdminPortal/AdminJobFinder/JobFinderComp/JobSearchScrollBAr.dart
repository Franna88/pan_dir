import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class JobSearchScrollBar extends StatefulWidget {
  final Function(String) onSearchChanged;
  const JobSearchScrollBar({super.key, required this.onSearchChanged});

  @override
  State<JobSearchScrollBar> createState() => _JobSearchScrollBarState();
}

class _JobSearchScrollBarState extends State<JobSearchScrollBar> {
  final List<String> _allOptions = [
    "Software Engineer",
    "Data Analyst",
    "Project Manager",
    "Graphic Designer",
    "Sales Executive",
    "Marketing Manager",
    // Add more preselected options here
  ];

  List<String> _filteredOptions = [];
  String _searchText = "";
  final _textController = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _filteredOptions = _allOptions;
  }

  void _filterSearch(String query) {
    setState(() {
      _searchText = query;
      _filteredOptions = _allOptions
          .where((option) => option.toLowerCase().contains(query.toLowerCase()))
          .toList();

      if (_filteredOptions.isNotEmpty && query.isNotEmpty) {
        _showOverlay();
      } else {
        _removeOverlay();
      }

      // Notify parent about the search query
      widget.onSearchChanged(query);
    });
  }

  void _showOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)!.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) {
        return Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, size.height),
            child: Material(
              elevation: 4.0,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _filteredOptions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_filteredOptions[index]),
                      onTap: () {
                        _textController.text = _filteredOptions[index];
                        _removeOverlay();
                        // Notify parent about the selection
                        widget.onSearchChanged(_filteredOptions[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MyUtility(context).height * 0.05,
              decoration: BoxDecoration(
                color: const Color(
                    0xFF0E1013), // Background color of the search bar
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white, // Color of the search icon
                      size: 22.0,
                    ),
                  ),
                  const Text(
                    "Search:",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'raleway',
                      fontSize: 15.0,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Container(
                        height: 35.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          controller: _textController,
                          onChanged: _filterSearch,
                          decoration: const InputDecoration(
                            hintText: "Type to search",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0),
                            isCollapsed: true,
                            alignLabelWithHint: true,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
