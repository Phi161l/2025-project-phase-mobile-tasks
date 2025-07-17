// bin/main.dart

import 'dart:io';
import '../lib/product_manager.dart';

void main() {
  var manager = ProductManager();

  while (true) {
    print('''


==== eCommerce App ====
1. Add Product
2. View All Products
3. View Single Product
4. Edit Product
5. Delete Product
6. Exit
''');

    stdout.write('Choose an option: ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter product name: ');
        var name = stdin.readLineSync() ?? '';

        stdout.write('Enter description: ');
        var description = stdin.readLineSync() ?? '';

        stdout.write('Enter price: ');
        var priceInput = stdin.readLineSync() ?? '';
        var price = double.tryParse(priceInput) ?? 0.0;

        manager.addProduct(name, description, price);
        break;

      case '2':
        manager.viewAllProducts();
        break;

      case '3':
        stdout.write('Enter product number to view: ');
        var input = stdin.readLineSync() ?? '';
        var index = int.tryParse(input);
        if (index != null) {
          manager.viewProduct(index - 1);
        } else {
          print('⚠️ Invalid input.\n');
        }
        break;

      case '4':
        stdout.write('Enter product number to edit: ');
        var input = stdin.readLineSync() ?? '';
        var index = int.tryParse(input);
        if (index != null) {
          stdout.write('Enter new name: ');
          var name = stdin.readLineSync() ?? '';

          stdout.write('Enter new description: ');
          var description = stdin.readLineSync() ?? '';

          stdout.write('Enter new price: ');
          var priceInput = stdin.readLineSync() ?? '';
          var price = double.tryParse(priceInput) ?? 0.0;

          manager.editProduct(index - 1, name, description, price);
        } else {
          print('⚠️ Invalid input.\n');
        }
        break;

      case '5':
        stdout.write('Enter product number to delete: ');
        var input = stdin.readLineSync() ?? '';
        var index = int.tryParse(input);
        if (index != null) {
          manager.deleteProduct(index - 1);
        } else {
          print('⚠️ Invalid input.\n');
        }
        break;

      case '6':
        print('Exiting...');
        return;

      default:
        print('⚠️ Invalid choice.\n');
    }
  }
}
