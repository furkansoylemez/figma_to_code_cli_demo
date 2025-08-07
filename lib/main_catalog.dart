import 'package:flutter/material.dart';
import 'generated/components/base_dropdown_menu_item/example.dart';
import 'generated/components/search_input_field/example.dart';

void main() {
  runApp(ComponentCatalogApp());
}

class ComponentCatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Component Catalog',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: AppBarTheme(centerTitle: true, elevation: 0),
        cardTheme: CardThemeData(
          elevation: 2,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: ComponentCatalogHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ComponentCatalogHome extends StatelessWidget {
  final List<ComponentInfo> components = [
    ComponentInfo(
      name: 'BaseDropdownMenuItem',
      description: 'Customizable dropdown menu item component',
      icon: Icons.arrow_drop_down_circle,
      page: BaseDropdownMenuItemExamplePage(),
    ),
    ComponentInfo(
      name: 'SearchInputField',
      description: 'Advanced search input field with filtering capabilities',
      icon: Icons.search,
      page: SearchInputFieldExamplePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Component Catalog',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withOpacity(0.8),
            ],
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 16),
          itemCount: components.length,
          itemBuilder: (context, index) {
            final component = components[index];
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => component.page),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          component.icon,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              component.name,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 4),
                            Text(
                              component.description,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ComponentInfo {
  final String name;
  final String description;
  final IconData icon;
  final Widget page;

  ComponentInfo({
    required this.name,
    required this.description,
    required this.icon,
    required this.page,
  });
}
