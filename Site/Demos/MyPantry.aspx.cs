using System;

public partial class Demos_Database : System.Web.UI.Page
{
    private dbHelper db = new dbHelper();

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    //add item to database + grid
    protected void Button1_Click(object sender, EventArgs e)
    {
        db.addItem(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text);
        GridView1.DataBind();
    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {
       
    }
    
    protected void Button3_Click(object sender, EventArgs e)
    {
       
    }

    //Delete using the grid so no invalid values are passed to the sql command
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //db = new dbHelper();
        string deleteId = GridView1.SelectedRow.Cells[1].Text;
        db.deleteItem(deleteId);
        GridView1.DataBind();
    }

    //Shows the selected date under the calendar for verification
    protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
    {
        Label2.Text = "The selected date is " + Calendar1.SelectedDate.ToShortDateString();
        TextBox4.Text = Calendar1.SelectedDate.ToShortDateString();
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
       
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

}