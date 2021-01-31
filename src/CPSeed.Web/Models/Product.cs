namespace CPSeed.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [StringLength(20)]
        public string ProductID { get; set; }

        [StringLength(100)]
        public string ProductName { get; set; }

        [StringLength(20)]
        public string UnitID { get; set; }

        [StringLength(50)]
        public string UnitName { get; set; }

        [StringLength(50)]
        public string ProductType { get; set; }

        [StringLength(20)]
        public string ProviderID { get; set; }

        [StringLength(50)]
        public string ProviderName { get; set; }

        [Column(TypeName = "money")]
        public decimal? BuyPriceCurrent { get; set; }

        [Column(TypeName = "money")]
        public decimal? BuyPricePrevious { get; set; }

        [Column(TypeName = "money")]
        public decimal? BuyPriceAverage { get; set; }

        [Column(TypeName = "money")]
        public decimal? SellPrice { get; set; }

        public int? ExportBuy { get; set; }

        public int? ExportOffer { get; set; }

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
