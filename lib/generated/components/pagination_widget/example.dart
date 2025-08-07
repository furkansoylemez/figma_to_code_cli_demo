import 'package:flutter/material.dart';
import './pagination_widget.dart';

class PaginationWidgetExamplePage extends StatefulWidget {
  const PaginationWidgetExamplePage({super.key});

  @override
  State<PaginationWidgetExamplePage> createState() => _PaginationWidgetExamplePageState();
}

class _PaginationWidgetExamplePageState extends State<PaginationWidgetExamplePage> {
  int currentPage = 1;
  List<int> pages = [1, 2, 3, 4, 5];
  bool showPreviousButton = true;
  bool showNextButton = true;
  bool showInformation = true;
  bool showPageCount = true;
  bool showItemsPerPage = true;
  double pageButtonSize = 32.0;
  double borderRadius = 6.0;
  String informationText = '1.000 veriden 10 tanesi listeleniyor.';
  String pageCountText = '10 / 50';
  String itemsPerPageText = '10 / Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pagination_widget Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interactive Section',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildControls(),
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 16),
                    PaginationWidget(
                      pages: pages,
                      currentPage: currentPage,
                      showPreviousButton: showPreviousButton,
                      showNextButton: showNextButton,
                      previousButtonEnabled: currentPage > 1,
                      nextButtonEnabled: currentPage < pages.length,
                      showInformation: showInformation,
                      showPageCount: showPageCount,
                      showItemsPerPage: showItemsPerPage,
                      pageButtonSize: pageButtonSize,
                      borderRadius: borderRadius,
                      informationText: informationText,
                      pageCountText: pageCountText,
                      itemsPerPageText: itemsPerPageText,
                      onPreviousPressed: () {
                        if (currentPage > 1) {
                          setState(() {
                            currentPage--;
                          });
                        }
                      },
                      onNextPressed: () {
                        if (currentPage < pages.length) {
                          setState(() {
                            currentPage++;
                          });
                        }
                      },
                      onPagePressed: (page) {
                        setState(() {
                          currentPage = page;
                        });
                      },
                      onItemsPerPagePressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Items per page dropdown pressed')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Basic Examples',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildBasicExample(
              'Simple Pagination',
              'Basic pagination with default styling',
              PaginationWidget(
                pages: const [1, 2, 3],
                currentPage: 2,
                onPagePressed: (page) {},
              ),
            ),
            const SizedBox(height: 16),
            _buildBasicExample(
              'Minimal Pagination',
              'Pagination without information and page count sections',
              PaginationWidget(
                pages: const [1, 2, 3, 4, 5, 6],
                currentPage: 3,
                showInformation: false,
                showPageCount: false,
                showItemsPerPage: false,
                onPagePressed: (page) {},
              ),
            ),
            const SizedBox(height: 16),
            _buildBasicExample(
              'Custom Styled',
              'Pagination with custom colors and larger buttons',
              PaginationWidget(
                pages: const [1, 2, 3, 4],
                currentPage: 1,
                pageButtonSize: 40.0,
                borderRadius: 12.0,
                activePageColor: Colors.blue,
                activePageTextColor: Colors.white,
                onPagePressed: (page) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Current Page'),
                  Slider(
                    value: currentPage.toDouble(),
                    min: 1,
                    max: pages.length.toDouble(),
                    divisions: pages.length - 1,
                    label: currentPage.toString(),
                    onChanged: (value) {
                      setState(() {
                        currentPage = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Page Button Size'),
                  Slider(
                    value: pageButtonSize,
                    min: 24.0,
                    max: 48.0,
                    divisions: 12,
                    label: pageButtonSize.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        pageButtonSize = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Border Radius'),
                  Slider(
                    value: borderRadius,
                    min: 0.0,
                    max: 20.0,
                    divisions: 20,
                    label: borderRadius.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        borderRadius = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Wrap(
          spacing: 16,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: showPreviousButton,
                  onChanged: (value) {
                    setState(() {
                      showPreviousButton = value ?? true;
                    });
                  },
                ),
                const Text('Show Previous'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: showNextButton,
                  onChanged: (value) {
                    setState(() {
                      showNextButton = value ?? true;
                    });
                  },
                ),
                const Text('Show Next'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: showInformation,
                  onChanged: (value) {
                    setState(() {
                      showInformation = value ?? true;
                    });
                  },
                ),
                const Text('Show Information'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: showPageCount,
                  onChanged: (value) {
                    setState(() {
                      showPageCount = value ?? true;
                    });
                  },
                ),
                const Text('Show Page Count'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: showItemsPerPage,
                  onChanged: (value) {
                    setState(() {
                      showItemsPerPage = value ?? true;
                    });
                  },
                ),
                const Text('Show Items Per Page'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBasicExample(String title, String description, Widget widget) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 16),
            widget,
          ],
        ),
      ),
    );
  }
}