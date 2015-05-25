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
    public partial class EmployeeInformationUI : Form
    {
        public EmployeeInformationUI()
        {
            InitializeComponent();
            LoadAllDesignation();
        }
        int employeeId;
        EmployeeManager employeeManager = new EmployeeManager();
        DesignationManager designationManager = new DesignationManager();
        private void saveButton_Click(object sender, EventArgs e)
        {
            Employee aEmployee = new Employee();
            aEmployee.Id = employeeId;
            aEmployee.Name = nameTextBox.Text;
            aEmployee.Email = emailTextBox.Text;
            aEmployee.Address = addressTextBox.Text;

            aEmployee.DesignationId = (Designation)designationComboBox.SelectedItem;
            if (nameTextBox.Text != "" && emailTextBox.Text != "" && addressTextBox.Text != "" && designationComboBox.Text != "")
            {
                if (saveButton.Text != "Update")
                {
                    string message = "";
                    message = employeeManager.SaveEmployee(aEmployee);
                    MessageBox.Show(message, @"Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    ClearEmployee();
                }
                else
                {
                    string message = "";
                    message = employeeManager.UpdateEmployee(aEmployee);
                    MessageBox.Show(message, @"Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    ClearEmployee();
                    this.Close();

                }

            }
            else
            {
                MessageBox.Show(@"Please fill-up the employee's information properly", @"Error", MessageBoxButtons.OK,MessageBoxIcon.Error);
            }

         }
        public void ClearEmployee()
        {
            nameTextBox.Clear();
            emailTextBox.Clear();
            addressTextBox.Clear();
            designationComboBox.Text = "";
        }

        public void LoadAllDesignation()
        {
            designationComboBox.DataSource = designationManager.GetAllDesignation();
            designationComboBox.DisplayMember = "Title";
            designationComboBox.ValueMember = "Id";
        
        }

        private void addMoreButton_Click(object sender, EventArgs e)
        {
            DesignationUI Designationui = new DesignationUI();
            Designationui.ShowDialog();
            LoadAllDesignation();
            Designation lastAddedDesignation = Designationui.GetLastAddedDesignationByThisUI();

            if (lastAddedDesignation != null)
            {
                designationComboBox.Text = lastAddedDesignation.Title;
            }
            
        }

        public EmployeeInformationUI(Employee employee)
            : this()
        {
            saveButton.Text = @"Update";
            FillFieldsWith(employee);
            employeeId = employee.Id;
        }

        private void FillFieldsWith(Employee employee)
        {
            nameTextBox.Text = employee.Name;
            addressTextBox.Text = employee.Address;
            emailTextBox.Text = employee.Email;
            designationComboBox.SelectedValue = employee.DesignationId.Id;
        }
    }
}
