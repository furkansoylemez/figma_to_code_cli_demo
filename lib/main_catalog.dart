import 'package:flutter/material.dart';
import 'generated/components/base_avatar/example.dart';
import 'generated/components/base_dropdown_button/example.dart';

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
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade700,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      home: ComponentCatalogHome(),
    );
  }
}

class ComponentCatalogHome extends StatelessWidget {
  final List<ComponentItem> components = [
    ComponentItem(
      name: 'BaseAvatar',
      description: 'Avatar component with customizable styling',
      icon: Icons.account_circle,
      page: BaseAvatarExamplePage(),
    ),
    ComponentItem(
      name: 'BaseDropdownButton',
      description: 'Dropdown button with enhanced functionality',
      icon: Icons.arrow_drop_down_circle,
      page: BaseDropdownButtonExamplePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Component Catalog'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.2,
          ),
          itemCount: components.length,
          itemBuilder: (context, index) {
            final component = components[index];
            return ComponentCard(
              component: component,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => component.page,
                  ),
                );
              },
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

class ComponentCard extends StatelessWidget {
  final ComponentItem component;
  final VoidCallback onTap;

  const ComponentCard({
    Key? key,
    required this.component,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
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
              SizedBox(height: 8),
              Flexible(
                child: Text(
                  component.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}