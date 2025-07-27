import 'package:flutter/material.dart';
import '../../data/products_data.dart';
import '../../models/product_model.dart';
// import '../../widgets/product_card.dart';
import '../../widgets/search_bar_row.dart';
import '../../widgets/filter_bottom_sheet.dart';
import '../../widgets/product_list_view.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}





class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  RangeValues _priceRange = const RangeValues(0, 200);

  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = products;
  }

  void _performSearch() {
    String keyword = _searchController.text.toLowerCase();
    String category = _categoryController.text.toLowerCase();

    setState(() {
      _filteredProducts = products.where((product) {
        bool matchesKeyword = product.title.toLowerCase().contains(keyword);
        bool matchesCategory = category.isEmpty ||
            product.subtitle.toLowerCase().contains(category);
        bool matchesPrice = product.price >= _priceRange.start &&
            product.price <= _priceRange.end;

        return matchesKeyword && matchesCategory && matchesPrice;
      }).toList();
    });
  }

  void _openFilterSheet() {
    showModalBottomSheet( 
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return FilterBottomSheet(
          categoryController: _categoryController,
          priceRange: _priceRange,
          onPriceChanged: (newRange) {
            setState(() => _priceRange = newRange);
          },
          onApply: () {
            Navigator.pop(context);
            _performSearch();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Search Product',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            SearchBarRow(
              searchController: _searchController,
              onSearch: _performSearch,
              onFilterTap: _openFilterSheet,
            ),
            const SizedBox(height: 20),
            ProductListView(products: _filteredProducts),
          ],
        ),
      ),
    );
  }
}
