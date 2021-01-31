namespace CPSeed.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Unit")]
    public partial class Unit
    {
        [StringLength(20)]
        public string UnitID { get; set; }

        [StringLength(50)]
        public string UnitName { get; set; }

        public int Priority { get; set; }

        [StringLength(50)]
        public string Description { get; set; }

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
