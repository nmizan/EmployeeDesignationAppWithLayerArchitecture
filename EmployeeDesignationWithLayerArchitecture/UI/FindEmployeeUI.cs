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
    public partial class FindEmployeeUI : Form
    {
        EmployeeManager employeeManager = new EmployeeManager();
        public FindEmployeeUI()
        {
            InitializeComponent();
        }
        private string partialName = "";
        
        private void searchButton_Click(object sender, EventArgs e)
        {
            partialName = searchTextBox.Text;
            LoadListView(partialName);
        }

        public void LoadListView(string partialName)
        {
            searchListView.Items.Clear();
            List<Employee> employees;
            employees = employeeManager.GetAllEmployees(partialName);

            if (employees.Count > 0)
            {
                int id = 1;
                foreach (Employee employee in employees)
                {

                    ListViewItem item = new ListViewItem(id.ToString());
                    item.Tag = (Employee)employee;
                    item.SubItems.Add(employee.Name);
                    item.SubItems.Add(employee.Email);
                    item.SubItems.Add(employee.Address);
                    searchListView.Items.Add(item);
                    id++;
                
                }
            }
            else
            {
             MessageBox.Show(@"Searching Employee is not found in your system", @"Information",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
        private void editToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Employee selectedEmployee = GetSelectedEmployee();
            if (selectedEmployee != null)
            {
                EmployeeInformationUI employeeInformationui = new EmployeeInformationUI();
                employeeInformationui.ShowDialog();
                LoadListView(partialName);
                searchListView.HideSelection = false;
            }
        }

       public Employee GetSelectedEmployee()
        {
            int index = searchListView.SelectedIndices[0];
            ListViewItem item = searchListView.Items[index];
            return (Employee)item.Tag;
        }

        private void contextMenuStrip1_Opening(object sender, System.ComponentModel.CancelEventArgs e)
        {
            editToolStripMenuItem.Enabled = (searchListView.Items.Count > 0);
            deleteToolStripMenuItem.Enabled = (searchListView.Items.Count > 0);
        }

        private void deleteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Employee selectedEmployee = GetSelectedEmployee();
            int selectedIndex = searchListView.SelectedIndices[0];
            DialogResult result = MessageBox.Show("You are about to delete " + selectedEmployee.Name + " \nIs that alright?",
                    "Delete Employee", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.Yes)
            {
                employeeManager.DeleteEmployee(selectedEmployee);
                searchListView.Items.RemoveAt(selectedIndex);
            }
        }

        
    }
}
