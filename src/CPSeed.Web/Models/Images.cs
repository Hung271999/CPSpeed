using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CPSeed.Models
{
    [Table("Images")]
    public class Images
    {
        public int ImagesID { get; set; }
        [StringLength(50)]
        public string url { get; set; }
        [StringLength(20)]
        public string ProductID { get; set; }
    }
}