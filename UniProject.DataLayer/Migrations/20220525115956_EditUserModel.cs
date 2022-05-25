using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UniProject.DataLayer.Migrations
{
    public partial class EditUserModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Diseases_Users_UserId",
                table: "Diseases");

            migrationBuilder.DropIndex(
                name: "IX_Diseases_UserId",
                table: "Diseases");

            migrationBuilder.DropColumn(
                name: "Address",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Gender",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Diseases");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Address",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<bool>(
                name: "Gender",
                table: "Users",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "Diseases",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Diseases_UserId",
                table: "Diseases",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Diseases_Users_UserId",
                table: "Diseases",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id");
        }
    }
}
