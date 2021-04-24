using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CPSeed.Models
{
    [Table("Order")]
    public class Order
    {
        public int OrderID { get; set; }

        public bool? Status { get; set; }

        public bool? Paid { get; set; }

        public DateTime? CreateDate { get; set; }

        public string UserId { get; set; }
        public DateTime? ReceivedDate { get; set; }

        [StringLength(256)]
        public string CreateUser { get; set; }

        public DateTime? UpdateDate { get; set; }

        [StringLength(256)]
        public string UpdateUser { get; set; }

        public int? Priority { get; set; }

        public double? Total { get; set; }

        [StringLength(256)]
        public string Email { get; set; }

        [StringLength(256)]
        public string Address { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }
    }
}