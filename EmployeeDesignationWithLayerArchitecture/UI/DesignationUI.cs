using EmployeeDesignationWithLayerArchitecture.BLL;
using EmployeeDesignationWithLayerArchitecture.DAL.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EmployeeDesignationWithLayerArchitecture
{
    public partial class DesignationUI : Form
    {
        Designation aDesignation =new Designation();
    
        public DesignationUI()
        {
            InitializeComponent();
        }
        DesignationManager manager = new DesignationManager();
        private void saveButton_Click(object sender, EventArgs e)
        {
            string message="";
            if(codeTextBox.Text!= ""&& titleTextBox.Text!="")
            {
                aDesignation.Code=codeTextBox.Text;
                aDesignation.Title=titleTextBox.Text;

                if(manager.Save(aDesignation, out message))
                {
                this.Close();
                }
                else
                {
                MessageBox.Show(message,@"Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
                }

            }
            else
            {
            MessageBox.Show("Pls Fill Up The Designation field properly",@"Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
            }
        }

        public Designation GetLastAddedDesignationByThisUI()
        {
        return aDesignation;
        }
       
    }
}
