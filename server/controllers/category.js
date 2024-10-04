//import functions from categoryModel
import {
    getCategory1
  } from "../models/categoryModel.js";
  
  //get all products
  export const showCategory1 = (req, res) => {
    getCategory1((err, results) => {
      if (err) {
        res.send(err);
      } else {
        res.json(results);
      }
    });
  };