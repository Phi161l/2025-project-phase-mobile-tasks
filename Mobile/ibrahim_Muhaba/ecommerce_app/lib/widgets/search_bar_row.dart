import 'package:flutter/material.dart';

class SearchBarRow extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onSearch;
  final VoidCallback onFilterTap;

  const SearchBarRow({
    super.key,
    required this.searchController,
    required this.onSearch,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Leather',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  onPressed: onSearch,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF3F63F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: onFilterTap,
          ),
        ),
      ],
    );
  }
}
