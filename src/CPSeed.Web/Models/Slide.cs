using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CPSeed.Models
{
    [Table("Slide")]
    public class Slide
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int SlideID { get; set; }

        [StringLength(250)]
        public string url { get; set; }

        public string contents { get; set; }

        [StringLength(50)]
        public string image { get; set; }

        public bool? Status { get; set; }

        public DateTime? CreateDate { get; set; }

        public DateTime? PublicDate { get; set; }

        [StringLength(256)]
        public string CreateUser { get; set; }

        public DateTime? UpdateDate { get; set; }

        [StringLength(256)]
        public string UpdateUser { get; set; }
    }
}