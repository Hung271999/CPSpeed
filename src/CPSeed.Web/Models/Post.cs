using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CPSeed.Models
{
    [Table("Posts")]
    public class Post
    {
        public int PostID { get; set; }

        [StringLength(100)]
        public string Title { get; set; }
        [MaxLength]
        public string Summary { get; set; }

        [MaxLength]
        public string contents { get; set; }

        [StringLength(50)]
        public string image { get; set; }

        public int CategoryPostID { get; set; }


        public bool? Status { get; set; }
        public bool? IsDeleted { get; set; }

        public DateTime CreateDate { get; set; }

        public DateTime ?PublicDate { get; set; }

        [Required]
        [StringLength(256)]
        public string CreateUser { get; set; }

        public DateTime UpdateDate { get; set; }

        [Required]
        [StringLength(256)]
        public string UpdateUser { get; set; }
    }
}