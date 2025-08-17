// class ApiConstants {
//   // Base URL of the API
//   static const String baseUrl = 'https://65f85c2cdf151452460f6d1b.mockapi.io/api/v1';

//   // Products endpoints
//   static const String products = '$baseUrl/products';

//   static String productById(String id) => '$products/$id';
// }





// simulating real Api 
import '../../features/product/data/models/product_model.dart';

class ApiConstants {
  // Base URL of the API
  static const String baseUrl = 'https://65f85c2cdf151452460f6d1b.mockapi.io/api/v1';

  // Products endpoints
  static const String products = '$baseUrl/products';
  static String productById(String id) => '$products/$id';

  // Sample data for local development and learning
  static final List<ProductModel> sampleProducts = [
    ProductModel(
      id: '1',
      name: 'Nike Air Max 270',
      description: 'Comfortable running shoes with excellent cushioning and breathable mesh upper. Perfect for daily runs and casual wear.',
      price: 129.99,
      imageUrl: 'assets/shoes_1.jpg',
    ),
    ProductModel(
      id: '2',
      name: 'Adidas Ultraboost 22',
      description: 'Premium running shoes featuring responsive Boost midsole technology and Primeknit upper for ultimate comfort.',
      price: 179.99,
      imageUrl: 'assets/shoes_2.jpg',
    ),
    ProductModel(
      id: '3',
      name: 'Puma RS-X',
      description: 'Retro-inspired sneakers with chunky sole design and bold color combinations. Great for street style and casual outfits.',
      price: 89.99,
      imageUrl: 'assets/shoes_3.jpg',
    ),
    ProductModel(
      id: '4',
      name: 'New Balance 574',
      description: 'Classic lifestyle sneakers with ENCAP midsole technology. Timeless design that goes with everything.',
      price: 79.99,
      imageUrl: 'assets/shoes_4.jpg',
    ),
    ProductModel(
      id: '5',
      name: 'Converse Chuck Taylor',
      description: 'Iconic canvas sneakers with rubber sole. The perfect everyday shoe that never goes out of style.',
      price: 59.99,
      imageUrl: 'assets/shoes_5.jpg',
    ),
  ];

  // Helper method to get sample product by ID
  static ProductModel? getSampleProductById(String id) {
    try {
      return sampleProducts.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  // Helper method to get all sample products
  static List<ProductModel> getAllSampleProducts() {
    return List.from(sampleProducts);
  }




  // Local storage for CRUD operations
  static final List<ProductModel> _localProducts = List.from(sampleProducts);

  // Add new product locally
  static void addLocalProduct(ProductModel product) {
    _localProducts.add(product);
  }

  // Update existing product locally
  static void updateLocalProduct(ProductModel product) {
    final index = _localProducts.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _localProducts[index] = product;
    }
  }

  // Delete product locally
  static void deleteLocalProduct(String id) {
    _localProducts.removeWhere((p) => p.id == id); // Fixed: was 'product.id' instead of 'id'
  }

  // Get all products (including newly added ones)
  static List<ProductModel> getAllLocalProducts() {
    return List.from(_localProducts);
  }
}