// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    required this.value,
    required this.selectedValue,
    required this.label,
    required this.onChanged,
    super.key,
  });
  final String value;
  final String selectedValue;
  final String label;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == selectedValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 5,
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                  ),
                )),
            const SizedBox(width: 10),
            Text(
              label,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.txtLabel, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
