import 'package:flutter/material.dart';
import '../../components/dropdown_button_basic/dropdown_button_basic.dart';
import '../../components/tab_item/tab_item.dart';
import '../../components/user_info/user_info.dart';
import '../../components/auto_complete_true/auto_complete_true.dart';
import '../../components/custom_autocomplete/custom_autocomplete.dart';
import '../../components/tag/tag.dart';
import '../../components/app_checkbox/app_checkbox.dart';
import '../../components/primary_button/primary_button.dart';
import '../../theme/color_theme.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  String selectedLanguage = 'Türkçe';
  int activeTabIndex = 0;
  String? selectedUser;
  String jobTitle = 'Mesleği';
  bool isListToggled = true;
  bool saveCredentials = true;
  bool isLoading = false;
  
  final List<String> languages = ['Türkçe', 'English', 'Deutsch'];
  final List<String> userNames = ['Yeşim Poyraz', 'Yeşim Polat', 'Yeşim Poyrazoğlu'];
  final List<String> tabs = ['Tüm Kullanıcılar', 'Kayıtlı'];
  final List<int> tabCounts = [4, 4];

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Scaffold(
      backgroundColor: const Color(0xFFEBECF5),
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          decoration: BoxDecoration(
            color: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildStatusBar(context, customColors),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildLanguageSelector(),
                      const SizedBox(height: 32),
                      _buildTabBar(),
                      const SizedBox(height: 32),
                      _buildUserInfo(),
                      const SizedBox(height: 32),
                      Expanded(
                        child: _buildFormSection(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar(BuildContext context, CustomColors? customColors) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '08:15',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: customColors?.textColorText?.withOpacity(0.88) ?? 
                     Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Row(
            children: [
              Container(
                width: 17,
                height: 11,
                child: Row(
                  children: List.generate(4, (index) {
                    return Container(
                      width: 3,
                      height: 4 + (index * 2).toDouble(),
                      margin: const EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                        color: customColors?.textColorText?.withOpacity(0.88) ?? 
                               Theme.of(context).colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.wifi,
                size: 15,
                color: customColors?.textColorText?.withOpacity(0.88) ?? 
                       Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 5),
              Container(
                width: 22,
                height: 11,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: customColors?.textColorText?.withOpacity(0.35) ?? 
                           Theme.of(context).colorScheme.onSurface.withOpacity(0.35),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: customColors?.textColorText?.withOpacity(0.88) ?? 
                             Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Align(
      alignment: Alignment.centerRight,
      child: DropdownButtonBasic(
        text: selectedLanguage,
        onPressed: () {
          _showLanguageMenu();
        },
        width: 95,
      ),
    );
  }

  void _showLanguageMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: languages.map((lang) {
            return ListTile(
              title: Text(lang),
              onTap: () {
                setState(() {
                  selectedLanguage = lang;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      children: tabs.asMap().entries.map((entry) {
        int index = entry.key;
        String title = entry.value;
        return Expanded(
          child: TabItem(
            title: title,
            badgeCount: tabCounts[index],
            showBadge: true,
            isActive: activeTabIndex == index,
            onTap: () {
              setState(() {
                activeTabIndex = index;
              });
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildUserInfo() {
    return const UserInfo(
      name: 'Yeşim Poyraz',
      role: 'UI/UX Designer',
      initials: 'YP',
      status: 'Aktif',
    );
  }

  Widget _buildFormSection() {
    return Column(
      children: [
        AutoCompleteTrue(
          placeholder: 'Yeş',
          options: userNames,
          value: selectedUser,
          onChanged: (value) {
            setState(() {
              selectedUser = value;
            });
          },
        ),
        const SizedBox(height: 24),
        CustomAutocomplete(
          placeholder: jobTitle,
          options: const ['Designer', 'Developer', 'Product Manager', 'Analyst'],
          value: jobTitle == 'Mesleği' ? null : jobTitle,
          onChanged: (value) {
            setState(() {
              jobTitle = value ?? 'Mesleği';
            });
          },
        ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: Tag(
            text: 'Yeni Kişi Ekle',
            type: TagType.addNew,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Yeni kişi ekleme formu açılacak')),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Switch(
              value: isListToggled,
              onChanged: (value) {
                setState(() {
                  isListToggled = value;
                });
              },
            ),
            const SizedBox(width: 8),
            const Text(
              'Listeye Ekle',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        const SizedBox(height: 24),
        AppCheckbox(
          label: 'Giriş Bilgilerini Kaydet',
          value: saveCredentials,
          onChanged: (value) {
            setState(() {
              saveCredentials = value ?? false;
            });
          },
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          text: isLoading ? 'Giriş Yapılıyor...' : 'Giriş Yap',
          onPressed: isLoading ? null : () {
            setState(() {
              isLoading = true;
            });
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                isLoading = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Giriş başarılı!')),
              );
            });
          },
        ),
      ],
    );
  }
}