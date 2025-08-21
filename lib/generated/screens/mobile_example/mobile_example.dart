import 'package:figma_to_code_light/generated/components/badge_text/badge_text.dart';
import 'package:flutter/material.dart';
import '../../components/dropdown_basic_inline/dropdown_basic_inline.dart';
import '../../components/tab_item/tab_item.dart';
import '../../components/user_info/user_info.dart';
import '../../components/auto_complete_field/auto_complete_field.dart';
import '../../components/custom_autocomplete_field/custom_autocomplete_field.dart';
import '../../components/tag/tag.dart';
import '../../components/custom_switch/custom_switch.dart';
import '../../components/custom_checkbox/custom_checkbox.dart';
import '../../components/primary_button/primary_button.dart';
import '../../theme/color_theme.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  String _selectedLanguage = 'Türkçe';
  TabState _allUsersTabState = TabState.active;
  TabState _registeredTabState = TabState.inactive;
  bool _addToListSwitch = true;
  bool _saveLoginInfo = true;
  String? _selectedJob;

  final List<String> _users = [
    'Yeşim Poyraz',
    'Yeşim Polat',
    'Yeşim Poyrazoğlu',
  ];
  final List<String> _jobs = [
    'UI/UX Designer',
    'Frontend Developer',
    'Backend Developer',
  ];

  void _handleTabSwitch() {
    setState(() {
      if (_allUsersTabState == TabState.active) {
        _allUsersTabState = TabState.inactive;
        _registeredTabState = TabState.active;
      } else {
        _allUsersTabState = TabState.active;
        _registeredTabState = TabState.inactive;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      backgroundColor:
          customColors?.backgroundColorBgContainer ??
          Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: const Color(0xFFEBECF5),
            child: Center(
              child: Container(
                width: 390,
                margin: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color:
                      customColors?.backgroundColorBgContainer ??
                      Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    _buildStatusBar(),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildTopSection(),
                          const SizedBox(height: 32),
                          _buildTabSection(),
                          const SizedBox(height: 32),
                          _buildUserInfoSection(),
                          const SizedBox(height: 32),
                          _buildFormSection(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '08:15',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color:
                  customColors?.textColorText ??
                  Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Row(
            children: [
              Container(
                width: 17,
                height: 11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color:
                        customColors?.textColorText ??
                        Theme.of(context).colorScheme.onSurface,
                    width: 0.5,
                  ),
                ),
                child: const Icon(Icons.signal_cellular_alt, size: 8),
              ),
              const SizedBox(width: 4),
              Container(
                width: 15,
                height: 11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color:
                        customColors?.textColorText ??
                        Theme.of(context).colorScheme.onSurface,
                    width: 0.5,
                  ),
                ),
                child: const Icon(Icons.wifi, size: 8),
              ),
              const SizedBox(width: 4),
              Container(
                width: 24,
                height: 11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    color:
                        customColors?.textColorText?.withOpacity(0.35) ??
                        Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.35),
                    width: 1,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color:
                        customColors?.textColorText ??
                        Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropdownBasicInline(
              text: _selectedLanguage,
              onPressed: () {
                setState(() {
                  _selectedLanguage = _selectedLanguage == 'Türkçe'
                      ? 'English'
                      : 'Türkçe';
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabSection() {
    return Row(
      children: [
        Expanded(
          child: TabItem(
            title: 'Tüm Kullanıcılar',
            state: _allUsersTabState,
            badgeCount: 4,
            onTap: _handleTabSwitch,
          ),
        ),
        Expanded(
          child: TabItem(
            title: 'Kayıtlı',
            state: _registeredTabState,
            badgeCount: 4,
            onTap: _handleTabSwitch,
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfoSection() {
    return const UserInfo(
      userName: 'Yeşim Poyraz',
      userInitials: 'YP',
      roleText: 'UI/U Designer',
      statusText: 'Aktif',
      badgeStatus: BadgeStatus.success,
    );
  }

  Widget _buildFormSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AutoCompleteField(
          options: _users,
          labelText: 'Ad Soyad',
          hintText: 'Yeş',
          initialValue: 'Yeş',
          showDropdown: true,
          onSelected: (value) {},
        ),
        const SizedBox(height: 20),
        CustomAutocompleteField<String>(
          displayStringForOption: (p0) => p0,
          options: _jobs,
          hintText: 'Mesleği',
          initialValue: _selectedJob,
          onSelected: (value) {
            setState(() {
              _selectedJob = value;
            });
          },
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Tag(
              text: 'Yeni Kişi Ekle',
              type: TagType.addNew,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Yeni kişi ekleme özelliği')),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomSwitch(
          value: _addToListSwitch,
          label: 'Listeye Ekle',
          onChanged: (value) {
            setState(() {
              _addToListSwitch = value;
            });
          },
        ),
        const SizedBox(height: 24),
        CustomCheckbox(
          value: _saveLoginInfo,
          label: 'Giriş Bilgilerini Kaydet',
          onChanged: (value) {
            setState(() {
              _saveLoginInfo = value ?? false;
            });
          },
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          text: 'Giriş Yap',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Giriş işlemi başlatıldı')),
            );
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
