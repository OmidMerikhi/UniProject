using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UniProject.DataLayer.Migrations
{
    public partial class EditDoctorModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Doctors_Prepresents_PresentId",
                table: "Doctors");

            migrationBuilder.DropIndex(
                name: "IX_Doctors_PresentId",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PresentId",
                table: "Doctors");

            migrationBuilder.AddColumn<string>(
                name: "OfficeName",
                table: "Doctors",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "OfficeName",
                table: "Doctors");

            migrationBuilder.AddColumn<int>(
                name: "PresentId",
                table: "Doctors",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Doctors_PresentId",
                table: "Doctors",
                column: "PresentId");

            migrationBuilder.AddForeignKey(
                name: "FK_Doctors_Prepresents_PresentId",
                table: "Doctors",
                column: "PresentId",
                principalTable: "Prepresents",
                principalColumn: "Id");
        }
    }
}
