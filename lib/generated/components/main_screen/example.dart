import 'package:figma_to_code_light/generated/components/app_button/app_button.dart';
import 'package:figma_to_code_light/generated/components/auto_complete/auto_complete.dart';
import 'package:figma_to_code_light/generated/components/base_avatar/base_avatar.dart';
import 'package:figma_to_code_light/generated/components/base_badge/base_badge.dart';
import 'package:figma_to_code_light/generated/components/base_checkbox/base_checkbox.dart';
import 'package:figma_to_code_light/generated/components/base_dropdown_button/base_dropdown_button.dart';
import 'package:figma_to_code_light/generated/components/base_switch/base_switch.dart';
import 'package:figma_to_code_light/generated/components/tab_item/tab_item.dart';
import 'package:figma_to_code_light/generated/components/tag/tag.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBECF5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '08:15',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: const Color(0xFF535367),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 17,
                        height: 11,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF535367),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          children: [
                            Container(width: 3, height: 4),
                            Container(width: 3, height: 6),
                            Container(width: 3, height: 8),
                            Container(width: 3, height: 11),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 15,
                        height: 11,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF535367),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 24,
                        height: 11,
                        decoration: BoxDecoration(
                          color: const Color(0xFF535367),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: BaseDropdownButton(
                          text: 'Türkçe',
                          onTap: () {},
                          backgroundColor: Colors.transparent,
                          borderColor: const Color(0xFFD9D9D9),
                          borderWidth: 1,
                          borderRadius: 6,
                          textColor: Colors.black,
                          iconColor: Colors.black,
                          horizontalPadding: 16,
                          verticalPadding: 8,
                          spacing: 4,
                          height: 32,
                          width: 95,
                        ),
                      ),
                      const SizedBox(height: 32),
                      /*Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TabItem(
                            title: 'Tüm Kullanıcılar',
                            state: TabItemState.active,
                            indicatorPosition: TabIndicatorPosition.bottom,
                            showBadge: true,
                            badgeCount: 4,
                            badgeText: '4',
                            onTap: () {},
                            titleStyle: Theme.of(context).textTheme.bodyMedium,
                            activeColor: const Color(0xFF583D97),
                            indicatorColor: const Color(0xFF583D97),
                            badgeBackgroundColor: const Color(0xFF583D97),
                            badgeTextColor: Colors.white,
                            padding: const EdgeInsets.all(12),
                            minWidth: 80,
                            height: 48,
                          ),
                          TabItem(
                            title: 'Kayıtlı',
                            state: TabItemState.defaultState,
                            indicatorPosition: TabIndicatorPosition.bottom,
                            showBadge: true,
                            badgeCount: 4,
                            badgeText: '4',
                            onTap: () {},
                            titleStyle: Theme.of(context).textTheme.bodyMedium,
                            defaultColor: Colors.black.withOpacity(0.88),
                            badgeBackgroundColor: Colors.black.withOpacity(
                              0.06,
                            ),
                            badgeTextColor: Colors.black.withOpacity(0.88),
                            padding: const EdgeInsets.all(12),
                            minWidth: 80,
                            height: 48,
                          ),
                        ],
                      ),*/
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              BaseAvatar(
                                type: AvatarType.text,
                                size: AvatarSize.medium,
                                text: 'YP',
                                backgroundColor: const Color(0xFF583D97),
                                foregroundColor: Colors.white,
                                borderRadius: 32,
                                textStyle: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Yeşim Poyraz',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Colors.black.withOpacity(0.88),
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Tag(
                                    text: 'UI/U Designer',
                                    variant: TagVariant.addNew,
                                    backgroundColor: Colors.black.withOpacity(
                                      0.02,
                                    ),
                                    borderColor: const Color(0xFFD9D9D9),
                                    textColor: Colors.black.withOpacity(0.88),
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                    borderRadius: 4,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          BaseBadge(
                            text: 'Aktif',
                            status: BadgeStatus.success,
                            showIndicator: true,
                            indicatorColor: const Color(0xFF52C41A),
                            indicatorBorderColor: Colors.white,
                            indicatorSize: 6,
                            indicatorBorderWidth: 2,
                            textColor: Colors.black.withOpacity(0.88),
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            spacing: 8,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      AutoComplete(
                        isOpen: true,
                        value: 'Yeş',
                        label: 'Ad Soyad',
                        options: const [
                          'Yeşim Poyraz',
                          'Yeşim Polat',
                          'Yeşim Poyrazoğlu',
                        ],
                        selectedOptionIndex: 0,
                        isFocused: true,
                        onChanged: (value) {},
                        onOptionSelected: (option) {},
                        onTap: () {},
                        width: double.infinity,
                        inputHeight: 60,
                        maxDropdownHeight: 168,
                        borderRadius: 6,
                        itemBorderRadius: 4,
                        inputPadding: const EdgeInsets.all(12),
                        dropdownPadding: const EdgeInsets.all(4),
                        itemPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        backgroundColor: Colors.white,
                        borderColor: const Color(0xFF2C5DD6),
                        focusedBorderColor: const Color(0xFF2C5DD6),
                        dropdownBackgroundColor: Colors.white,
                        dropdownBorderColor: Colors.white,
                        itemHoverColor: Colors.black.withOpacity(0.04),
                        labelColor: const Color(0xFF2C5DD6),
                        valueColor: Colors.black.withOpacity(0.25),
                        labelStyle: Theme.of(context).textTheme.bodySmall
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 9,
                              color: const Color(0xFF2C5DD6),
                            ),
                        valueStyle: Theme.of(context).textTheme.bodyMedium,
                        itemTextStyle: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: Colors.black.withOpacity(0.88)),
                      ),
                      const SizedBox(height: 24),
                      AutoComplete(
                        isOpen: false,
                        value: '',
                        label: 'Mesleği',
                        placeholder: 'Mesleği',
                        options: const [],
                        onChanged: (value) {},
                        onTap: () {},
                        width: double.infinity,
                        inputHeight: 60,
                        borderRadius: 6,
                        inputPadding: const EdgeInsets.all(12),
                        backgroundColor: Colors.white,
                        borderColor: const Color(0xFFD9D9D9),
                        placeholderColor: Colors.black.withOpacity(0.25),
                        placeholderStyle: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: Colors.black.withOpacity(0.25)),
                      ),
                      const SizedBox(height: 24),
                      Tag(
                        text: 'Yeni Kişi Ekle',
                        variant: TagVariant.addNew,
                        backgroundColor: Colors.transparent,
                        borderColor: const Color(0xFFD9D9D9),
                        textColor: Colors.black.withOpacity(0.88),
                        textStyle: Theme.of(context).textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                        borderRadius: 4,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 1,
                        ),
                        isDashed: true,
                        leadingIcon: Icon(Icons.add),
                        iconColor: Colors.black.withOpacity(0.45),
                        iconSize: 12,
                        spacing: 4,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 24),
                      BaseSwitch(
                        value: true,
                        onChanged: (value) {},
                        label: 'Listeye Ekle',
                        size: SwitchSize.large,
                        showLabel: true,
                        activeTrackColor: const Color(0xFF583D97),
                        thumbColor: Colors.white,
                        labelColor: Colors.black.withOpacity(0.88),
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        trackWidth: 44,
                        trackHeight: 22,
                        thumbSize: 18,
                        labelSpacing: 8,
                      ),
                      const SizedBox(height: 24),
                      BaseCheckbox(
                        value: true,
                        onChanged: (value) {},
                        label: 'Giriş Bilgilerini Kaydet',
                        isActive: true,
                        checkedColor: const Color(0xFF583D97),
                        checkColor: Colors.white,
                        labelColor: Colors.black.withOpacity(0.88),
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        borderRadius: 4,
                        spacing: 8,
                      ),
                      const SizedBox(height: 24),
                      AppButton(
                        type: AppButtonType.standard,
                        size: AppButtonSize.large,
                        text: 'Giriş Yap',
                        showText: true,
                        onPressed: () {},
                        backgroundColor: const Color(0xFF583D97),
                        foregroundColor: Colors.white,
                        borderRadius: 8,
                        width: double.infinity,
                        height: 40,
                        textStyle: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
