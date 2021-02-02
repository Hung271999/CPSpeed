using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CPSeed.Models.ID
{
    [Table("Posts")]
    public class Post
    {
        public int PostID { get; set; }

        [StringLength(100)]
        public string Title { get; set; }
        [Column(TypeName = "tinyint")]
        public string Summary { get; set; }

        [Column(TypeName = "text")]
        public string content { get; set; }

        public int CategotyPostID { get; set; }


        public bool? Status { get; set; }
        public bool? IsDeleted { get; set; }

        public DateTime CreateDate { get; set; }

        public DateTime PublicDate { get; set; }

        [Required]
        [StringLength(256)]
        public string CreateUser { get; set; }

        public DateTime UpdateDate { get; set; }

        [Required]
        [StringLength(256)]
        public string UpdateUser { get; set; }
    }
}