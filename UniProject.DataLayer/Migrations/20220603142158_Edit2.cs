using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UniProject.DataLayer.Migrations
{
    public partial class Edit2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Diseases");

            migrationBuilder.RenameColumn(
                name: "Specialty",
                table: "Doctors",
                newName: "OfficePhone");

            migrationBuilder.RenameColumn(
                name: "Phone",
                table: "Doctors",
                newName: "OfficeAddress");

            migrationBuilder.AddColumn<int>(
                name: "PresentId",
                table: "Doctors",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SpecialtyId",
                table: "Doctors",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "SpecialtyTitle",
                table: "Doctors",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Prepresents",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DayPresent = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    HoursPresent = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Prepresents", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Reservs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    VisitDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Reservs", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Reservs_Doctors_DoctorId",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Reservs_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Specialtys",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Specialtys", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "DoctorToPresents",
                columns: table => new
                {
                    DoctorId = table.Column<int>(type: "int", nullable: false),
                    PresentId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorToPresents", x => new { x.DoctorId, x.PresentId });
                    table.ForeignKey(
                        name: "FK_DoctorToPresents_Doctors_DoctorId",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_DoctorToPresents_Prepresents_PresentId",
                        column: x => x.PresentId,
                        principalTable: "Prepresents",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Sickness",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SpecialityId = table.Column<int>(type: "int", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sickness", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sickness_Specialtys_SpecialityId",
                        column: x => x.SpecialityId,
                        principalTable: "Specialtys",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Doctors_PresentId",
                table: "Doctors",
                column: "PresentId");

            migrationBuilder.CreateIndex(
                name: "IX_Doctors_SpecialtyId",
                table: "Doctors",
                column: "SpecialtyId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorToPresents_PresentId",
                table: "DoctorToPresents",
                column: "PresentId");

            migrationBuilder.CreateIndex(
                name: "IX_Reservs_DoctorId",
                table: "Reservs",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_Reservs_UserId",
                table: "Reservs",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sickness_SpecialityId",
                table: "Sickness",
                column: "SpecialityId");

            migrationBuilder.AddForeignKey(
                name: "FK_Doctors_Prepresents_PresentId",
                table: "Doctors",
                column: "PresentId",
                principalTable: "Prepresents",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Doctors_Specialtys_SpecialtyId",
                table: "Doctors",
                column: "SpecialtyId",
                principalTable: "Specialtys",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Doctors_Prepresents_PresentId",
                table: "Doctors");

            migrationBuilder.DropForeignKey(
                name: "FK_Doctors_Specialtys_SpecialtyId",
                table: "Doctors");

            migrationBuilder.DropTable(
                name: "DoctorToPresents");

            migrationBuilder.DropTable(
                name: "Reservs");

            migrationBuilder.DropTable(
                name: "Sickness");

            migrationBuilder.DropTable(
                name: "Prepresents");

            migrationBuilder.DropTable(
                name: "Specialtys");

            migrationBuilder.DropIndex(
                name: "IX_Doctors_PresentId",
                table: "Doctors");

            migrationBuilder.DropIndex(
                name: "IX_Doctors_SpecialtyId",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PresentId",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "SpecialtyId",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "SpecialtyTitle",
                table: "Doctors");

            migrationBuilder.RenameColumn(
                name: "OfficePhone",
                table: "Doctors",
                newName: "Specialty");

            migrationBuilder.RenameColumn(
                name: "OfficeAddress",
                table: "Doctors",
                newName: "Phone");

            migrationBuilder.CreateTable(
                name: "Diseases",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Title = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Diseases", x => x.Id);
                });
        }
    }
}
