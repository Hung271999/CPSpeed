using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CPSeed.Models
{
    [Table("NewDetail")]
    public class NewDetail
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int NewDetailID { get; set; }

        [Column(TypeName = "ntext")]
        public string Title { get; set; }

        [Column(TypeName = "ntext")]
        public string Summary { get; set; }

        public int? NewsID { get; set; }

        public bool? Status { get; set; }

        public bool? IsDeleted { get; set; }

        public DateTime? CreateDate { get; set; }

        public DateTime? PublicDate { get; set; }

        [StringLength(256)]
        public string CreateUser { get; set; }

        public DateTime? UpdateDate { get; set; }

        [StringLength(256)]
        public string UpdateUser { get; set; }

        [StringLength(50)]
        public string image { get; set; }

        public int? Priority { get; set; }

        [Column(TypeName = "ntext")]
        public string contents { get; set; }
    }
}