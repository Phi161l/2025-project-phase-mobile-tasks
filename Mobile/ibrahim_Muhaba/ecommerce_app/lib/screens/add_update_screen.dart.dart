import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/image_upload_box.dart';
import '../widgets/styled_text_field.dart';
import '../widgets/action_buttons.dart';

class AddUpdateScreen extends StatefulWidget {
  final Product? product;

  const AddUpdateScreen({super.key, this.product});

  @override
  State<AddUpdateScreen> createState() => _AddUpdateScreenState();
}




class _AddUpdateScreenState extends State<AddUpdateScreen> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  late TextEditingController imageController;

  bool get isUpdateMode => widget.product != null;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product?.title ?? '');
    priceController = TextEditingController(text: widget.product?.price.toString() ?? '');
    descriptionController = TextEditingController(text: widget.product?.detail ?? '');
    imageController = TextEditingController(text: widget.product?.image ?? '');
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back, color: Colors.blue),
          ),
        ),
        title: Text(
          isUpdateMode ? 'Update Product' : 'Add  Product',
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ImageUploadBox(),
            const SizedBox(height: 20),
            StyledTextField(label: 'name', controller: nameController),
            StyledTextField(label: 'category', controller: imageController),
            StyledTextField(
              label: 'price',
              controller: priceController,
              suffix: const Text('\$', style: TextStyle(color: Colors.black)),
            ),
            StyledTextField(label: 'description', controller: descriptionController, maxLines: 4),
            const SizedBox(height: 30),
            ActionButtons(
              isUpdateMode: isUpdateMode,
              onAddUpdate: () {
                // TODO: handle add/update logic
              },
              onDelete: () {
                // TODO: handle delete logic
              },
            ),
          ],
        ),
      ),
    );
  }
}




