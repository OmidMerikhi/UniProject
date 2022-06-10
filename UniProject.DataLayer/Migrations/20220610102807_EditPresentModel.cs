using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UniProject.DataLayer.Migrations
{
    public partial class EditPresentModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Day",
                table: "Prepresents",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Day",
                table: "Prepresents");
        }
    }
}
