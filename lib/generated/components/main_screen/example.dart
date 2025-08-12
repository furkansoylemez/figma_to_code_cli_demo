import 'package:flutter/material.dart';
import '../base_dropdown_button/base_dropdown_button.dart';
import '../tab_item/tab_item.dart';
import '../user_info/user_info.dart';
import '../auto_complete/auto_complete.dart';
import '../tag/tag.dart';
import '../base_switch/base_switch.dart';
import '../base_checkbox/base_checkbox.dart';
import '../app_button/app_button.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  bool isSwitchActive = true;
  bool isCheckboxChecked = true;
  String nameValue = 'Yeş';
  String jobValue = 'Mesleği';
  bool isNameAutoCompleteOpen = true;
  bool isJobAutoCompleteOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F6),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 390,
            height: 844,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                // Status bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 23,
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '08:15',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF343443),
                        ),
                      ),
                      Row(
                        children: [
                          // Signal bars
                          Container(
                            width: 17,
                            height: 10.67,
                            child: Row(
                              children: [
                                Container(
                                  width: 3,
                                  height: 4,
                                  color: Color(0xFF343443),
                                ),
                                SizedBox(width: 2),
                                Container(
                                  width: 3,
                                  height: 6,
                                  color: Color(0xFF343443),
                                ),
                                SizedBox(width: 2),
                                Container(
                                  width: 3,
                                  height: 8.33,
                                  color: Color(0xFF343443),
                                ),
                                SizedBox(width: 2),
                                Container(
                                  width: 3,
                                  height: 10.67,
                                  color: Color(0xFF343443),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5),
                          // WiFi icon
                          Icon(Icons.wifi, size: 15, color: Color(0xFF343443)),
                          SizedBox(width: 5),
                          // Battery
                          Container(
                            width: 24.33,
                            height: 11.33,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF343443).withOpacity(0.35),
                              ),
                              borderRadius: BorderRadius.circular(2.67),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 18,
                                height: 7.33,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Color(0xFF343443),
                                  borderRadius: BorderRadius.circular(1.33),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(23),
                    child: Column(
                      children: [
                        // Language dropdown
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BaseDropdownButton(
                              text: 'Türkçe',
                              backgroundColor: Colors.transparent,
                              borderColor: Color(0xFFD9D9D9),
                              textColor: Colors.black.withOpacity(0.88),
                              borderRadius: 6,
                              horizontalPadding: 16,
                              verticalPadding: 8,
                              onTap: () {},
                            ),
                          ],
                        ),

                        SizedBox(height: 32),

                        // Tabs
                        /*Row(
                          children: [
                            TabItem(
                              title: 'Tüm Kullanıcılar',
                              state: TabItemState.active,
                              indicatorPosition: TabIndicatorPosition.bottom,
                              showBadge: true,
                              badgeCount: 4,
                              activeColor: Color(0xFF583D97),
                              badgeBackgroundColor: Color(0xFF583D97),
                              badgeTextColor: Colors.white,
                              minWidth: 172,
                              height: 48,
                              onTap: () {},
                            ),
                            TabItem(
                              title: 'Kayıtlı',
                              state: TabItemState.defaultState,
                              indicatorPosition: TabIndicatorPosition.bottom,
                              showBadge: true,
                              badgeCount: 4,
                              defaultColor: Colors.black.withOpacity(0.88),
                              badgeBackgroundColor: Colors.black.withOpacity(
                                0.06,
                              ),
                              badgeTextColor: Colors.black.withOpacity(0.88),
                              minWidth: 171,
                              height: 48,
                              onTap: () {},
                            ),
                          ],
                        ),*/
                        SizedBox(height: 32),

                        // User info
                        UserInfo(
                          userInitials: 'YP',
                          userName: 'Yeşim Poyraz',
                          jobTitle: 'UI/U Designer',
                          statusText: 'Aktif',
                          isActive: true,
                          avatarBackgroundColor: Color(0xFF583D97),
                          width: 343,
                          onTap: () {},
                        ),

                        SizedBox(height: 32),

                        // Form content
                        Expanded(
                          child: Column(
                            children: [
                              // Name autocomplete
                              AutoComplete(
                                isOpen: isNameAutoCompleteOpen,
                                value: nameValue,
                                label: 'AD SOYAD',
                                placeholder: 'Yeş',
                                options: [
                                  'Yeşim Poyraz',
                                  'Yeşim Polat',
                                  'Yeşim Poyrazoğlu',
                                ],
                                selectedOptionIndex: 0,
                                isFocused: true,
                                width: 343,
                                backgroundColor: Colors.white,
                                borderColor: Color(0xFFD9D9D9),
                                focusedBorderColor: Color(0xFF2C5DA8),
                                labelColor: Color(0xFF2C5DA8),
                                valueColor: Colors.black.withOpacity(0.25),
                                borderRadius: 6,
                                dropdownBackgroundColor: Colors.white,
                                itemHoverColor: Colors.black.withOpacity(0.04),
                                onChanged: (value) {
                                  setState(() {
                                    nameValue = value;
                                  });
                                },
                                onOptionSelected: (value) {
                                  setState(() {
                                    nameValue = value;
                                    isNameAutoCompleteOpen = false;
                                  });
                                },
                                onTap: () {
                                  setState(() {
                                    isNameAutoCompleteOpen =
                                        !isNameAutoCompleteOpen;
                                  });
                                },
                              ),

                              SizedBox(height: 24),

                              // Job autocomplete
                              AutoComplete(
                                isOpen: isJobAutoCompleteOpen,
                                value: jobValue,
                                label: 'MESLEĞI',
                                placeholder: 'Mesleği',
                                options: ['Designer', 'Developer', 'Manager'],
                                selectedOptionIndex: -1,
                                isFocused: false,
                                width: 343,
                                backgroundColor: Colors.white,
                                borderColor: Color(0xFFD9D9D9),
                                focusedBorderColor: Color(0xFF2C5DA8),
                                labelColor: Colors.black.withOpacity(0.65),
                                valueColor: Colors.black.withOpacity(0.25),
                                borderRadius: 6,
                                onChanged: (value) {
                                  setState(() {
                                    jobValue = value;
                                  });
                                },
                                onOptionSelected: (value) {
                                  setState(() {
                                    jobValue = value;
                                    isJobAutoCompleteOpen = false;
                                  });
                                },
                                onTap: () {
                                  setState(() {
                                    isJobAutoCompleteOpen =
                                        !isJobAutoCompleteOpen;
                                  });
                                },
                              ),

                              SizedBox(height: 24),

                              // Add new person tag
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Tag(
                                  text: 'Yeni Kişi Ekle',
                                  variant: TagVariant.addNew,
                                  backgroundColor: Colors.transparent,
                                  borderColor: Color(0xFFD9D9D9),
                                  textColor: Colors.black.withOpacity(0.88),
                                  leadingIcon: Icon(Icons.add),
                                  iconColor: Colors.black.withOpacity(0.45),
                                  isDashed: true,
                                  borderRadius: 4,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 1,
                                  ),
                                  onPressed: () {},
                                ),
                              ),

                              SizedBox(height: 24),

                              // Switch
                              Align(
                                alignment: Alignment.centerLeft,
                                child: BaseSwitch(
                                  value: isSwitchActive,
                                  label: 'Listeye Ekle',
                                  showLabel: true,
                                  activeTrackColor: Color(0xFF583D97),
                                  thumbColor: Colors.white,
                                  labelColor: Colors.black.withOpacity(0.88),
                                  size: SwitchSize.large,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitchActive = value;
                                    });
                                  },
                                ),
                              ),

                              SizedBox(height: 24),

                              // Checkbox
                              Align(
                                alignment: Alignment.centerLeft,
                                child: BaseCheckbox(
                                  value: isCheckboxChecked,
                                  label: 'Giriş Bilgilerini Kaydet',
                                  checkedColor: Color(0xFF583D97),
                                  checkColor: Colors.white,
                                  labelColor: Colors.black.withOpacity(0.88),
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckboxChecked = value ?? false;
                                    });
                                  },
                                ),
                              ),

                              SizedBox(height: 24),

                              // Login button
                              AppButton(
                                type: AppButtonType.standard,
                                size: AppButtonSize.large,
                                text: 'Giriş Yap',
                                showText: true,
                                backgroundColor: Color(0xFF583D97),
                                foregroundColor: Colors.white,
                                width: 343,
                                height: 40,
                                borderRadius: 8,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
