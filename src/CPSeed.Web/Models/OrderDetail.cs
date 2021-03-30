using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CPSeed.Models
{
    [Table("OrderDetail")]
    public class OrderDetail
    {
        public int OrderDetailID { get; set; }

        public int OrderID { get; set; }

        public int? Quantity { get; set; }

        [Column(TypeName = "money")]
        public decimal? SellPrice { get; set; }

        [StringLength(20)]
        public string ProductID { get; set; }
    }
}