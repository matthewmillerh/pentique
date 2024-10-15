import express from "express";

//import product functions from controller
import {
  showProductsByCategory,
  showProducts,
  showProductById,
  createProduct,
  updateProduct,
  deleteProduct,
} from "../controllers/product.js";

//import category functions
import { 
  showCategory1, 
  showCategory2, 
  showCategory3, 
  showSubCategories
} from "../controllers/category.js";

//init express router
const router = express.Router();

//get products buy category1ID
router.get("/products-by-category/:category1ID", showProductsByCategory)

//get all products
router.get("/products", showProducts);

//get a single product by id
router.get("/products/:id", showProductById);

// Create New Product
router.post("/products", createProduct);

// Update Product
router.put("/products/:id", updateProduct);

// Delete Product
router.delete("/products/:id", deleteProduct);

//get all category 1 items
router.get("/category1", showCategory1)

//get all category 2 items
router.get("/category2", showCategory2)

//get all category 3 items
router.get("/category3", showCategory3)

//get all category 2 and 3 items
router.get("/sub-categories/:id", showSubCategories)

//export default router
export default router;