namespace CPSeed.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Employee")]
    public partial class Employee
    {
        [StringLength(20)]
        public string EmployeeID { get; set; }

        [StringLength(20)]
        public string FirstName { get; set; }

        [StringLength(20)]
        public string LastName { get; set; }

        [StringLength(150)]
        public string FullName { get; set; }

        public DateTime? BirthDay { get; set; }

        public DateTime? StartWorkDate { get; set; }

        [StringLength(20)]
        public string IDNo { get; set; }

        [StringLength(20)]
        public string Mobile { get; set; }

        [StringLength(200)]
        public string Address { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string PositionName { get; set; }

        [StringLength(20)]
        public string ManagerID { get; set; }

        [Column(TypeName = "money")]
        public decimal? BasicSalary { get; set; }

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
