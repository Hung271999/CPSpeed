using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CPSeed.Models
{
    [Table("Contact")]
    public class Contact
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ContactID { get; set; }

        [Column(TypeName = "ntext")]
        public string Title { get; set; }

        [Column(TypeName = "ntext")]
        public string contents { get; set; }

        [StringLength(30)]
        public string icons { get; set; }

        public bool? Status { get; set; }

        [StringLength(250)]
        public string url { get; set; }
    }
}