//import functions from categoryModel
import {
    getCategory1,
    getCategory2,
    getCategory3,
    getSubCategories
  } from "../models/categoryModel.js";
  
//get all level 1 categories
 export const showCategory1 = (req, res) => {
   getCategory1((err, results) => {
     if (err) {
        res.send(err);
      } else {
        res.json(results);
      }
     });
 };

//get all level 2 categories
export const showCategory2 = (req, res) => {
  getCategory2((err, results) => {
    if (err) {
       res.send(err);
     } else {
       res.json(results);
     }
    });
};

//get all level 3 categories
export const showCategory3 = (req, res) => {
  getCategory3((err, results) => {
    if (err) {
       res.send(err);
     } else {
       res.json(results);
     }
    });
};




  //get all level 2 and 3 categories for specified level 1 category
  export const showSubCategories = (req, res) => {
    getSubCategories(req.params.id, (err, results) => {
      if (err) {
        res.send(err);
      } else {
        res.json(results);
      }
    });
  };