import 'package:flutter/material.dart';
import 'generated/components/base_checkbox/example.dart';
import 'generated/components/base_button/example.dart';

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
      ),
      home: ComponentCatalogHome(),
    );
  }
}

class ComponentCatalogHome extends StatelessWidget {
  final List<ComponentItem> components = [
    ComponentItem(
      name: 'BaseCheckbox',
      description: 'Customizable checkbox component',
      icon: Icons.check_box,
      page: BaseCheckboxExamplePage(),
    ),
    ComponentItem(
      name: 'BaseButton',
      description: 'Flexible button component',
      icon: Icons.smart_button,
      page: BaseButtonExamplePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Component Catalog'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: components.length,
          itemBuilder: (context, index) {
            final component = components[index];
            return Card(
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => component.page,
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        component.icon,
                        size: 48,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(height: 12),
                      Text(
                        component.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      Text(
                        component.description,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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

class ComponentItem {
  final String name;
  final String description;
  final IconData icon;
  final Widget page;

  ComponentItem({
    required this.name,
    required this.description,
    required this.icon,
    required this.page,
  });
}