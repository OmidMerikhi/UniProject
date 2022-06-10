﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniProject.DataLayer.Entites
{
    public class Reservs
    {
        public int Id { set; get; }
        public int DoctorId { set; get; }
        public int UserId { set; get; }
        public string VisitDate { set; get; }
        public string ReservationCode { set; get; }
        public DateTime RequestDate { set; get; }
        public DateTime FinalDate { set; get; }

        [ForeignKey("DoctorId")]
        public Doctor Doctor { set; get; }

        [ForeignKey("UserId")]
        public User User { set; get; }

    }
}
