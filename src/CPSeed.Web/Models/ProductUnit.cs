namespace CPSeed.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductUnit")]
    public partial class ProductUnit
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string ProductID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string UnitID1 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(20)]
        public string UnitIDMin { get; set; }

        public decimal Quantity { get; set; }

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
