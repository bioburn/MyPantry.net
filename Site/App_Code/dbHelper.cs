using System;
using System.Configuration;
using System.Data.SqlClient;


/// <summary>
/// Wrapper class for Manipulating the Groceries Database
/// </summary>
public class dbHelper
{
    public dbHelper()
    {
        
    }

    public void addItem(string title,string quantity,string price, string expiration, string tag)
    {
        //Check for items with the same name(Title)
        try
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
            conn.Open();
            string checkitem = "select count(*) from Groceries where Title='" + title + "'";
            SqlCommand cmd0 = new SqlCommand(checkitem, conn);
            int temp = Convert.ToInt32(cmd0.ExecuteScalar().ToString());

            //If there is at least one item in the database with the same name then do nothing.
            if (temp >= 1)
            {
                conn.Close();
            }
            //Else we make insert statement
            //Insert into RegisterDatabase(Title,Quantity,Price,Expiration,Tag)
            //values (...);
            else
            {

                string insertQuery = "insert into Groceries(Title,Quantity,Price,Expiration,Tag)values (@Title,@Quantity,@Price,@Expiration,@Tag)";
                SqlCommand cmd = new SqlCommand(insertQuery, conn);

                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Expiration", expiration);
                cmd.Parameters.AddWithValue("@Tag", tag);
                cmd.ExecuteNonQuery();
                
                conn.Close();
            }

        }
        catch (Exception ex)
        {
            //Response.Write("error" + ex.ToString());
        }

    }

    public void deleteItem(string id)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
            conn.Open();
            //construct the sql statement 
            string deleteQuery = "delete from Groceries where Id = @Id";
            SqlCommand cmd = new SqlCommand(deleteQuery, conn);
            //place in Id with a valid number
            cmd.Parameters.AddWithValue("@Id", id);

            cmd.ExecuteNonQuery();

            conn.Close();
        }
    
        catch(Exception e)
        {
            
        }
    }
}