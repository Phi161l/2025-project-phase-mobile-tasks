# E-Commerce App - Task 17: Implement Product BLoC

This Flutter app demonstrates **Task 17**: implementing a **ProductBloc** to manage state and events for product operations in an e-commerce app.

---

## Task 17 Overview

### Events Implemented
- `LoadAllProductsEvent` – Load all products from the repository  
- `LoadSingleProductEvent` – Get a single product by ID  
- `CreateProductEvent` – Add a new product  
- `UpdateProductEvent` – Update an existing product  
- `DeleteProductEvent` – Delete a product by ID  

### States Implemented
- `InitialState` – Initial state before data is loaded  
- `LoadingState` – While fetching or processing data  
- `LoadedAllProductsState` – When all products are successfully loaded  
- `LoadedSingleProductState` – When a single product is successfully loaded  
- `ErrorState` – When an error occurs  

### ProductBloc
- Handles all product-related events  
- Interacts with **use cases** for CRUD operations  
- Emits the appropriate states to update the UI efficiently  
- Error handling implemented for all operations  

---

## Notes
- Follows **BLoC pattern** and **Clean Architecture**  
- Uses **composition** to inject use cases into the bloc  
- UI reacts to state changes via `BlocBuilder`  
- Events are dispatched using `context.read<ProductBloc>().add(Event())`

---
