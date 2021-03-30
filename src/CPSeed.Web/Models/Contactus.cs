using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CPSeed.Models
{
    [Table("Contactus")]
    public class Contactus
    {
        [Key]
        public int ContactusID { get; set; }

        [Column(TypeName = "ntext")]
        public string Email { get; set; }

        [Column(TypeName = "ntext")]
        public string contents { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(256)]
        public string CreateUser { get; set; }
    }
}