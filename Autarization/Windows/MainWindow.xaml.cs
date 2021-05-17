using Autarization.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Autarization
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Entrance_Click(object sender, RoutedEventArgs e)
        {
            if (Login.Text != "" && Password.Password != "")
            {
                using (var db = new EntityContext())
                {
                    var manager = db.Managers.FirstOrDefault(b => b.Login == Login.Text && b.Password == Password.Password);
                    if (manager == null)
                        return;
                    ManagerWindow window = new ManagerWindow();
                    window.Show();
                    this.Close();
                }


            }
            else if (Login.Text == "" || Password.Password == "")
            { MessageBox.Show("Не все поля заполнены!", "Ошибка", MessageBoxButton.OKCancel, MessageBoxImage.Error);
                return;
            }
            

            
            
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
