
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;
namespace CPSeed.Models
{
    [Table("Recruitment")]
    public class Recruitment
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int RecruitmentID { get; set; }
        [Column(TypeName = "ntext")]
        public string Title { get; set; }
        public string Tag { get; set; }
        [Column(TypeName = "ntext")]
        public string contents { get; set; }

        public DateTime? CreateDate { get; set; }
        public int Quantity { get; set; }
        public string Workplace { get; set; }
        public DateTime? ExpirationDate { get; set; }


    }
}