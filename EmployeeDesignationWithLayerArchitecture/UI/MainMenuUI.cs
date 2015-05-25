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
    public partial class MainMenuUI : Form
    {
        public MainMenuUI()
        {
            InitializeComponent();
        }

        private void addButton_Click(object sender, EventArgs e)
        {
            EmployeeInformationUI Employeeinformationui = new EmployeeInformationUI();
            Employeeinformationui.Show();
        }

        private void findButton_Click(object sender, EventArgs e)
        {
            FindEmployeeUI findemployeeui = new FindEmployeeUI();
            findemployeeui.Show();
        }
    }
}
