using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ServiceReference1;

public partial class _Default : System.Web.UI.Page
{
    ServiceClient sc = new ServiceClient();
    String trno="";
    protected void Page_Load(object sender, EventArgs e)
    {
        load_data();
    }

    public void load_data()
    {
        var disstudent = sc.studdis();
        GridView1.DataSource = disstudent;
        GridView1.DataBind();
    }

    protected void btninsert_Click(object sender, EventArgs e)
    {
        student s=new student();
        s.rno = Convert.ToInt32(txtrno.Text);
        s.sname = txtsname.Text;
        s.course = txtcourse.Text;
        s.email = txteid.Text;
        s.mno = txtmno.Text;
        s.dob = txtdob.Text;

        string result = sc.studins(s);
        Response.Write("<script>alert('"+ result +"')</script>");
        load_data();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int rno = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        student s = new student();

        s.rno = rno;
        string result = sc.studdel(s);

        Response.Write("<script>alert('"+result+"')</script>");
        load_data();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        trno = GridView1.SelectedRow.Cells[1].Text;
        fetch_data();
        
    }

    public void fetch_data()
    {
        
        txtrno.Text = GridView1.SelectedRow.Cells[1].Text;
        txtsname.Text = GridView1.SelectedRow.Cells[2].Text;
        txtcourse.Text = GridView1.SelectedRow.Cells[3].Text;
        txteid.Text = GridView1.SelectedRow.Cells[4].Text;
        txtmno.Text = GridView1.SelectedRow.Cells[5].Text;
        txtdob.Text = GridView1.SelectedRow.Cells[6].Text;

        
    }

    protected void txtupdate_Click(object sender, EventArgs e)
    {
        student s = new student();
        s.rno = Convert.ToInt32(txtrno.Text);
        s.sname = txtsname.Text;
        s.course = txtcourse.Text;
        s.email = txteid.Text;
        s.mno = txtmno.Text;
        s.dob = txtdob.Text;

        var result = sc.studup(s);
        Response.Write("<script>alert('"+ result +"')</script>");
        load_data();

}