namespace CPSeed.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Promotion")]
    public partial class Promotion
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PromotionID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int InOutKBN { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(20)]
        public string ProductID { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(20)]
        public string UnitID { get; set; }

        [Required]
        [StringLength(20)]
        public string QuantityOfferUnit { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public int? QuantityBuy { get; set; }

        public int? QuantityOffer { get; set; }

        public bool? IsDeleted { get; set; }

        [Required]
        [StringLength(50)]
        public string CreateUser { get; set; }

        public DateTime CreateDate { get; set; }

        [Required]
        [StringLength(50)]
        public string UpdateUser { get; set; }

        public DateTime UpdateDate { get; set; }
    }
}
