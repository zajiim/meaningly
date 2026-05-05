import 'package:flutter/material.dart';

class PartOfSpeechSelector extends StatelessWidget {
  final List<String> partsOfSpeech;
  final String selected;
  final Function(String) onSelected;

  const PartOfSpeechSelector({
    super.key,
    required this.partsOfSpeech,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: partsOfSpeech.length,
        separatorBuilder: (context, index) => const SizedBox(width: 0),
        itemBuilder: (context, index) {
          final pos = partsOfSpeech[index];
          final isSelected = pos == selected;
          return GestureDetector(
            onTap: () => onSelected(pos),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
                borderRadius: _getBorderRadius(index, partsOfSpeech.length),
              ),
              child: Center(
                child: Text(
                  pos,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BorderRadius _getBorderRadius(int index, int total) {
    if (total == 1) return BorderRadius.circular(8);
    if (index == 0) return const BorderRadius.horizontal(left: Radius.circular(8));
    if (index == total - 1) return const BorderRadius.horizontal(right: Radius.circular(8));
    return BorderRadius.zero;
  }
}
