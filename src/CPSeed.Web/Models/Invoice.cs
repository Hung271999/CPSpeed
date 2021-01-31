namespace CPSeed.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Invoice")]
    public partial class Invoice
    {
        [Key]
        [StringLength(20)]
        public string InvoiceNo { get; set; }

        public DateTime OrderDate { get; set; }

        public DateTime DeliveryDate { get; set; }

        public int? InOutKbn { get; set; }

        public int StoreID { get; set; }

        [Column(TypeName = "money")]
        public decimal? Amount { get; set; }

        public double? Discount { get; set; }

        [Column(TypeName = "money")]
        public decimal? TotalAmount { get; set; }

        [StringLength(20)]
        public string CustomerID { get; set; }

        [StringLength(50)]
        public string CustomerName { get; set; }

        [StringLength(20)]
        public string EmployeeID { get; set; }

        [StringLength(150)]
        public string EmployeeName { get; set; }

        [StringLength(250)]
        public string Note { get; set; }

        public bool? IsDeleted { get; set; }

        public DateTime CreateDate { get; set; }

        [Required]
        [StringLength(256)]
        public string CreateUser { get; set; }

        public DateTime UpdateDate { get; set; }

        [Required]
        [StringLength(256)]
        public string UpdateUser { get; set; }
    }
}
