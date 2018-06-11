using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Klasy;

namespace PKCK
{
    public class Owieczki
    {
        public ObservableCollection<Owieczka> ListaOwieczek { get; set; }

        public Owieczki(Spis_owiec spis)
        {
            ListaOwieczek = new ObservableCollection<Owieczka>();

            foreach (Pastwisko pastwisko in spis.Lista_pastwisk.Pastwisko)
            {
                string nazwaPastwiska = pastwisko.Nazwa;
                string nazwaRasy = spis.Lista_ras.Definicja_rasy.Find(x => x.Idr.Equals(pastwisko.Stado.Rasa.Idr)).Nazwa;

                foreach (Owca owca in pastwisko.Stado.Owca)
                {
                    ListaOwieczek.Add(new Owieczka()
                    {
                        Pastwisko = nazwaPastwiska,
                        Rasa = nazwaRasy,
                        Imie = owca.Imię,
                        DataUrodzenia = owca.Data_urodzenia,
                        Plec = owca.Płeć.P,
                        Waga = owca.Waga.Text,
                        SzybkoscMarszu = owca.Szybkość_marszu.Text,
                        Opis = owca.Opis,
                        SzybkoscZjadaniaTrawy = owca.Szybkość_zjadania_trawy.Text,
                        DlugpscRuna = owca.Długość_runa.Text
                    });
                }
            }
        }
    }
}
