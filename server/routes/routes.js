import express from "express";

//import product functions from controller
import {
  showProducts,
  showProductById,
  createProduct,
  updateProduct,
  deleteProduct,
} from "../controllers/product.js";

//import category functions
import { showCategory1 } from "../controllers/category.js";

//init express router
const router = express.Router();

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

//export default router
export default router;