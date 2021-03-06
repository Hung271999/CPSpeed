﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CPSeed.Models
{
    [Table("Category")]
    public class Category
    {
        public int CategoryID { get; set; }

        [StringLength(100)]
        public string Title { get; set; }

        public bool? Status { get; set; }

        public bool IsDeleted { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(256)]
        public string CreateUser { get; set; }

        public DateTime UpdateDate { get; set; }

        [Required]
        [StringLength(256)]
        public string UpdateUser { get; set; }
    }
}