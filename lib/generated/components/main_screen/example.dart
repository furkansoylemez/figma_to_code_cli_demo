import 'package:flutter/material.dart';
import '../base_dropdown_button/base_dropdown_button.dart';
import '../tab_item/tab_item.dart';
import '../user_info/user_info.dart';
import '../auto_complete/auto_complete.dart';
import '../tag/tag.dart';
import '../base_toggle_switch/base_toggle_switch.dart';
import '../base_checkbox/base_checkbox.dart';
import '../base_button/base_button.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  bool isToggleSwitchValue = true;
  bool isCheckboxValue = true;
  String nameFieldValue = 'Yeş';
  String jobFieldValue = 'Mesleği';
  bool isNameFieldFocused = true;
  bool isNameAutoCompleteOpen = true;
  int selectedNameOption = 0;

  final List<String> nameOptions = [
    'Yeşim Poyraz',
    'Yeşim Polat',
    'Yeşim Poyrazoğlu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBECF5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '08:15',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF535466),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.signal_cellular_4_bar,
                  size: 16,
                  color: const Color(0xFF535466),
                ),
                const SizedBox(width: 5),
                Icon(Icons.wifi, size: 16, color: const Color(0xFF535466)),
                const SizedBox(width: 5),
                Container(
                  width: 24,
                  height: 12,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF535466).withOpacity(0.35),
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 1,
                        top: 1,
                        bottom: 1,
                        child: Container(
                          width: 18,
                          decoration: BoxDecoration(
                            color: const Color(0xFF535466),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      Positioned(
                        right: -2,
                        top: 3,
                        child: Container(
                          width: 2,
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFF535466).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BaseDropdownButton(
                  text: 'Türkçe',
                  onTap: () {},
                  backgroundColor: Colors.transparent,
                  borderColor: const Color(0xFFD9D9D9),
                  borderWidth: 1,
                  borderRadius: 6,
                  textColor: Colors.black.withOpacity(0.88),
                  horizontalPadding: 16,
                  verticalPadding: 8,
                  icon: Icons.keyboard_arrow_down,
                  iconColor: Colors.black.withOpacity(0.88),
                  iconSize: 14,
                ),
              ],
            ),
            const SizedBox(height: 32),
            /*Row(
              children: [
                TabItem(
                  title: 'Tüm Kullanıcılar',
                  state: 'active',
                  indicatorPosition: 'bottom',
                  showBadge: true,
                  badgeCount: 4,
                  activeColor: const Color(0xFF583D97),
                  defaultColor: Colors.black.withOpacity(0.88),
                  indicatorColor: const Color(0xFF583D97),
                  indicatorWidth: 2,
                  badgeBackgroundColor: const Color(0xFF583D97),
                  badgeTextColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  minWidth: 80,
                  height: 48,
                  onTap: () {},
                ),
                TabItem(
                  title: 'Kayıtlı',
                  state: 'default',
                  indicatorPosition: 'bottom',
                  showBadge: true,
                  badgeCount: 4,
                  activeColor: const Color(0xFF583D97),
                  defaultColor: Colors.black.withOpacity(0.88),
                  indicatorColor: const Color(0xFF583D97),
                  indicatorWidth: 1,
                  badgeBackgroundColor: Colors.black.withOpacity(0.06),
                  badgeTextColor: Colors.black.withOpacity(0.88),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  minWidth: 80,
                  height: 48,
                  onTap: () {},
                ),
              ],
            ),*/
            const SizedBox(height: 32),
            UserInfo(
              userInitials: 'YP',
              userName: 'Yeşim Poyraz',
              jobTitle: 'UI/UX Designer',
              statusText: 'Aktif',
              isActive: true,
              avatarBackgroundColor: const Color(0xFF583D97),
              width: 343,
              onTap: () {},
            ),
            const SizedBox(height: 32),
            AutoComplete(
              isOpen: isNameAutoCompleteOpen,
              value: nameFieldValue,
              label: 'Ad Soyad',
              placeholder: 'Ad Soyad',
              options: nameOptions,
              selectedOptionIndex: selectedNameOption,
              isFocused: isNameFieldFocused,
              onChanged: (value) {
                setState(() {
                  nameFieldValue = value;
                });
              },
              onOptionSelected: (index) {
                setState(() {
                  selectedNameOption = int.parse(index);
                  nameFieldValue = nameOptions[int.parse(index)];
                  isNameAutoCompleteOpen = false;
                });
              },
              onTap: () {
                setState(() {
                  isNameAutoCompleteOpen = !isNameAutoCompleteOpen;
                });
              },
              onFocusChanged: () {},
              width: 343,
              backgroundColor: Colors.white,
              borderColor: const Color(0xFF2C5DA8),
              focusedBorderColor: const Color(0xFF2C5DA8),
              dropdownBackgroundColor: Colors.white,
              labelColor: const Color(0xFF2C5DA8),
              valueColor: Colors.black.withOpacity(0.25),
              placeholderColor: Colors.black.withOpacity(0.25),
              itemTextColor: Colors.black.withOpacity(0.88),
              itemHoverColor: Colors.black.withOpacity(0.04),
              borderRadius: 6,
              inputHeight: 60,
            ),
            const SizedBox(height: 24),
            AutoComplete(
              isOpen: false,
              value: jobFieldValue,
              label: 'Mesleği',
              placeholder: 'Mesleği',
              options: const [
                'UI/UX Designer',
                'Frontend Developer',
                'Backend Developer',
              ],
              selectedOptionIndex: 0,
              isFocused: false,
              onChanged: (value) {
                setState(() {
                  jobFieldValue = value;
                });
              },
              onOptionSelected: (index) {},
              onTap: () {},
              onFocusChanged: () {},
              width: 343,
              backgroundColor: Colors.white,
              borderColor: const Color(0xFFD9D9D9),
              focusedBorderColor: const Color(0xFF2C5DA8),
              dropdownBackgroundColor: Colors.white,
              labelColor: Colors.black.withOpacity(0.65),
              valueColor: Colors.black.withOpacity(0.25),
              placeholderColor: Colors.black.withOpacity(0.25),
              itemTextColor: Colors.black.withOpacity(0.88),
              itemHoverColor: Colors.black.withOpacity(0.04),
              borderRadius: 6,
              inputHeight: 60,
            ),
            const SizedBox(height: 24),
            Tag(
              text: 'Yeni Kişi Ekle',
              variant: TagVariant.addNew,
              backgroundColor: Colors.transparent,
              borderColor: const Color(0xFFD9D9D9),
              textColor: Colors.black.withOpacity(0.88),
              borderRadius: 4,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              spacing: 4,
              leadingIcon: Icon(Icons.add),
              iconColor: Colors.black.withOpacity(0.45),
              iconSize: 12,
              isDashed: true,
              borderWidth: 1,
              onPressed: () {},
            ),
            const SizedBox(height: 24),
            BaseToggleSwitch(
              value: isToggleSwitchValue,
              onChanged: (value) {
                setState(() {
                  isToggleSwitchValue = value;
                });
              },
              size: BaseToggleSwitchSize.defaultSize,
              showLabel: true,
              labelText: 'Listeye Ekle',
              activeTrackColor: const Color(0xFF583D97),
              inactiveTrackColor: Colors.grey.shade300,
              activeThumbColor: Colors.white,
              inactiveThumbColor: Colors.white,
              labelColor: Colors.black.withOpacity(0.88),
              spacing: 8,
              trackWidth: 44,
              trackHeight: 22,
              thumbRadius: 9,
            ),
            const SizedBox(height: 24),
            BaseCheckbox(
              value: isCheckboxValue,
              onChanged: (value) {
                setState(() {
                  isCheckboxValue = value ?? false;
                });
              },
              label: 'Giriş Bilgilerini Kaydet',
              checkedColor: const Color(0xFF583D97),
              uncheckedColor: Colors.transparent,
              borderColor: const Color(0xFF583D97),
              checkColor: Colors.white,
              labelColor: Colors.black.withOpacity(0.88),
              borderRadius: 4,
              spacing: 8,
            ),
            const SizedBox(height: 24),
            BaseButton(
              text: 'Giriş Yap',
              onPressed: () {},
              backgroundColor: const Color(0xFF583D97),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              borderRadius: 8,
              minimumHeight: 40,
              showText: true,
              showIconLeft: false,
              showIconRight: false,
            ),
          ],
        ),
      ),
    );
  }
}
