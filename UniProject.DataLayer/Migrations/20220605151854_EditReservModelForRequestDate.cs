﻿using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UniProject.DataLayer.Migrations
{
    public partial class EditReservModelForRequestDate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "RequestDate",
                table: "Reservs",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "RequestDate",
                table: "Reservs");
        }
    }
}
