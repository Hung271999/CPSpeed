namespace CPSeed.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("InventoryHistory")]
    public partial class InventoryHistory
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string InvoiceNo { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int StoreID { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int InventoryID { get; set; }

        public DateTime OrderDate { get; set; }

        public DateTime DeliveryDate { get; set; }

        [Required]
        [StringLength(20)]
        public string ProductID { get; set; }

        [StringLength(100)]
        public string ProductName { get; set; }

        public int InOutKBN { get; set; }

        [StringLength(20)]
        public string UnitID { get; set; }

        [StringLength(50)]
        public string UnitName { get; set; }

        public decimal? Quantity { get; set; }

        public decimal? QuantityOffer { get; set; }

        [StringLength(20)]
        public string QuantityOfferUnit { get; set; }

        [Column(TypeName = "money")]
        public decimal? BuyPrice { get; set; }

        [Column(TypeName = "money")]
        public decimal? SellPrice { get; set; }

        [Column(TypeName = "money")]
        public decimal? AmountBuy { get; set; }

        [Column(TypeName = "money")]
        public decimal? AmountSell { get; set; }

        public bool? IsDeleted { get; set; }

        public DateTime CreateDate { get; set; }

        [Required]
        [StringLength(50)]
        public string CreateUser { get; set; }

        public DateTime UpdateDate { get; set; }

        [Required]
        [StringLength(50)]
        public string UpdateUser { get; set; }
    }
}
