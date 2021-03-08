using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CPSeed.Models.Cart
{
    public class Cart
    {
        CPSeedContext data = new CPSeedContext();
        public string iProductID { get; set; }
        public string sProductName { get; set; }
        public string simage { get; set; }
        public double sSellPrice { get; set; }
        public int quantity { get; set; }
        public Double total
        {
            get { return (double)(quantity * sSellPrice); }
        }
        public Cart(string id)
        {
            iProductID = id;
            Product product = data.Products.Single(n => n.ProductID == id);
            sProductName = product.ProductName;
            simage = product.image;
            sSellPrice = double.Parse(product.SellPrice.ToString());
            quantity = 1;
        }

    }
}