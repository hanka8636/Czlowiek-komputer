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
using Klasy;

namespace PKCK
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public Spis_owiec Spis_owiec { get; set; }
        public XMLCentrum XMLCentrum { get; set; }
        public Owieczki Owieczki { get; set; }

        public MainWindow()
        {
            InitializeComponent();
            Spis_owiec Spis_owiec = new Spis_owiec();

            XMLCentrum = new XMLCentrum("XML/spisOwiec.xml", "XML/spisOwiec.xsd", "XML/spisOwiec.xslt");

            Spis_owiec = XMLCentrum.Zaladuj();
            Owieczki = new Owieczki(Spis_owiec);

            this.ComboBoxPastwiska.DataContext = Spis_owiec.Lista_pastwisk.Pastwisko;
            XMLCentrum.Konwertuj();
        }
    }
}
