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
            Spis_owiec = new Spis_owiec();

            XMLCentrum = new XMLCentrum("../../XML/spisOwiec.xml", "../../XML/spisOwiec.xsd", "../../XML/spisOwiec.xslt");

            Spis_owiec = XMLCentrum.Zaladuj();
            Owieczki = new Owieczki(Spis_owiec);

            ComboBoxPastwiska.DataContext = Spis_owiec.Lista_pastwisk.Pastwisko;
            OwieczekLista.DataContext = Owieczki;
            XMLCentrum.Konwertuj(Spis_owiec);
        }

        public void DodajOwce(object sender, RoutedEventArgs e)
        {
            int owcaId = 0;
            foreach(Pastwisko p in Spis_owiec.Lista_pastwisk.Pastwisko)
            {
                owcaId += p.Stado.Owca.Count;
            }
            owcaId++;

            Owca o = new Owca()
            {
                Id = "ow" + owcaId.ToString(),
                Imię = Imie.Text,
                Data_urodzenia = Data.Text,
                Płeć = new Płeć() { P = Plec.Text },
                Opis = Opis.Text,
                Waga = new Waga() { Text = Waga.Text, Jednostka = WagaJednostka.Text },
                Długość_runa = new Długość_runa() { Text = DlugoscRuna.Text, Jednostka = DlugoscJednostka.Text },
                Szybkość_marszu = new Szybkość_marszu() { Text = SzybkoscMarszu.Text, Jednostka = SzybkoscMarszuJednostka.Text },
                Szybkość_zjadania_trawy = new Szybkość_zjadania_trawy() { Text = SzybkoscTrawy.Text, Jednostka = SzybkoscTrawyJednostka.Text }
            };

            Spis_owiec.Lista_pastwisk.Pastwisko.Find(x => x.Nazwa.Equals(ComboBoxPastwiska.Text)).Stado.Owca.Add(o);

            if (XMLCentrum.Waliduj(Spis_owiec))
            {
                XMLCentrum.Zapisz(Spis_owiec);
                Owieczki = new Owieczki(Spis_owiec);
                //this.PracownicyListBox.DataContext = Pracownicy;
                Imie.Text = Opis.Text = Data.Text = Waga.Text = DlugoscRuna.Text = SzybkoscMarszu.Text = SzybkoscTrawy.Text = String.Empty;
            }
            else
            {
                MessageBox.Show("Dane nie zgodne z xml schema", "Error!");
                Spis_owiec = XMLCentrum.Zaladuj();
            }
        }
    }
}
