//import db connection
import db from "../config/database.js";

//get all top level categories
export const getCategory1 = (result) => {
    db.query("SELECT `product`.`productFileName`, `category1`.`category1Name`, `category2`.`category2Name`, `category3`.`category3Name` FROM `product` LEFT OUTER JOIN `category1` ON `category1`.`category1ID` = `product`.`category1ID` LEFT OUTER JOIN `category2` ON `category2`.`category2ID` = `product`.`category2ID` LEFT OUTER JOIN `category3` ON `category3`.`category3ID` = `product`.`category3ID` WHERE `product`.`productFeatured`=1", (err, results) => {
      if (err) {
        console.log(err);
        result(err, null);
      } else {
        result(null, results);
      }
    });
  };

  //"SELECT `product`.`productFileName`, `category1`.`category1Name`, `category2`.`category2Name`, `category3`.`category3Name` FROM `product` LEFT OUTER JOIN `category1` ON `category1`.`category1ID` = `product`.`category1ID` LEFT OUTER JOIN `category2` ON `category2`.`category2ID` = `product`.`category2ID` LEFT OUTER JOIN `category3` ON `category3`.`category3ID` = `product`.`category3ID` WHERE `product`.`productFeatured`=1"