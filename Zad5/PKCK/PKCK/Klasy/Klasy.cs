using System;
using System.Xml.Serialization;
using System.Collections.Generic;

namespace Klasy
{
    [XmlRoot(ElementName = "domena", Namespace = "http://www.w3schools.com")]
    public class Domena
    {
        [XmlAttribute(AttributeName = "definicja_domeny")]
        public string Definicja_domeny { get; set; }
    }

    [XmlRoot(ElementName = "mail", Namespace = "http://www.w3schools.com")]
    public class Mail
    {
        [XmlElement(ElementName = "alias", Namespace = "http://www.w3schools.com")]
        public string Alias { get; set; }
        [XmlElement(ElementName = "znak", Namespace = "http://www.w3schools.com")]
        public string Znak { get; set; }
        [XmlElement(ElementName = "domena", Namespace = "http://www.w3schools.com")]
        public Domena Domena { get; set; }
    }

    [XmlRoot(ElementName = "autor", Namespace = "http://www.w3schools.com")]
    public class Autor
    {
        [XmlElement(ElementName = "imię_autora", Namespace = "http://www.w3schools.com")]
        public string Imię_autora { get; set; }
        [XmlElement(ElementName = "nazwisko", Namespace = "http://www.w3schools.com")]
        public string Nazwisko { get; set; }
        [XmlElement(ElementName = "mail", Namespace = "http://www.w3schools.com")]
        public Mail Mail { get; set; }
        [XmlAttribute(AttributeName = "album")]
        public string Album { get; set; }
    }

    [XmlRoot(ElementName = "autorzy", Namespace = "http://www.w3schools.com")]
    public class Autorzy
    {
        [XmlElement(ElementName = "autor", Namespace = "http://www.w3schools.com")]
        public List<Autor> Autor { get; set; }
    }

    [XmlRoot(ElementName = "nagłówek", Namespace = "http://www.w3schools.com")]
    public class Nagłówek
    {
        [XmlElement(ElementName = "data_modyfikacji", Namespace = "http://www.w3schools.com")]
        public string Data_modyfikacji { get; set; }
        [XmlElement(ElementName = "autorzy", Namespace = "http://www.w3schools.com")]
        public Autorzy Autorzy { get; set; }
    }

    [XmlRoot(ElementName = "definicja_rasy", Namespace = "http://www.w3schools.com")]
    public class Definicja_rasy
    {
        [XmlAttribute(AttributeName = "nazwa")]
        public string Nazwa { get; set; }
        [XmlAttribute(AttributeName = "idr")]
        public string Idr { get; set; }
    }

    [XmlRoot(ElementName = "lista_ras", Namespace = "http://www.w3schools.com")]
    public class Lista_ras
    {
        [XmlElement(ElementName = "definicja_rasy", Namespace = "http://www.w3schools.com")]
        public List<Definicja_rasy> Definicja_rasy { get; set; }
    }

    [XmlRoot(ElementName = "powierzchnia", Namespace = "http://www.w3schools.com")]
    public class Powierzchnia
    {
        [XmlAttribute(AttributeName = "jednostka")]
        public string Jednostka { get; set; }
        [XmlText]
        public string Text { get; set; }
    }

    [XmlRoot(ElementName = "rasa", Namespace = "http://www.w3schools.com")]
    public class Rasa
    {
        [XmlAttribute(AttributeName = "idr")]
        public string Idr { get; set; }
    }

    [XmlRoot(ElementName = "płeć", Namespace = "http://www.w3schools.com")]
    public class Płeć
    {
        [XmlAttribute(AttributeName = "p")]
        public string P { get; set; }
    }

    [XmlRoot(ElementName = "waga", Namespace = "http://www.w3schools.com")]
    public class Waga
    {
        [XmlAttribute(AttributeName = "jednostka")]
        public string Jednostka { get; set; }
        [XmlText]
        public string Text { get; set; }
    }

    [XmlRoot(ElementName = "długość_runa", Namespace = "http://www.w3schools.com")]
    public class Długość_runa
    {
        [XmlAttribute(AttributeName = "jednostka")]
        public string Jednostka { get; set; }
        [XmlText]
        public string Text { get; set; }
    }

    [XmlRoot(ElementName = "szybkość_marszu", Namespace = "http://www.w3schools.com")]
    public class Szybkość_marszu
    {
        [XmlAttribute(AttributeName = "jednostka")]
        public string Jednostka { get; set; }
        [XmlText]
        public string Text { get; set; }
    }

    [XmlRoot(ElementName = "szybkość_zjadania_trawy", Namespace = "http://www.w3schools.com")]
    public class Szybkość_zjadania_trawy
    {
        [XmlAttribute(AttributeName = "jednostka")]
        public string Jednostka { get; set; }
        [XmlText]
        public string Text { get; set; }
    }

    [XmlRoot(ElementName = "owca", Namespace = "http://www.w3schools.com")]
    public class Owca
    {
        [XmlElement(ElementName = "imię", Namespace = "http://www.w3schools.com")]
        public string Imię { get; set; }
        [XmlElement(ElementName = "data_urodzenia", Namespace = "http://www.w3schools.com")]
        public string Data_urodzenia { get; set; }
        [XmlElement(ElementName = "płeć", Namespace = "http://www.w3schools.com")]
        public Płeć Płeć { get; set; }
        [XmlElement(ElementName = "waga", Namespace = "http://www.w3schools.com")]
        public Waga Waga { get; set; }
        [XmlElement(ElementName = "długość_runa", Namespace = "http://www.w3schools.com")]
        public Długość_runa Długość_runa { get; set; }
        [XmlElement(ElementName = "opis", Namespace = "http://www.w3schools.com")]
        public string Opis { get; set; }
        [XmlElement(ElementName = "szybkość_marszu", Namespace = "http://www.w3schools.com")]
        public Szybkość_marszu Szybkość_marszu { get; set; }
        [XmlElement(ElementName = "szybkość_zjadania_trawy", Namespace = "http://www.w3schools.com")]
        public Szybkość_zjadania_trawy Szybkość_zjadania_trawy { get; set; }
        [XmlAttribute(AttributeName = "id")]
        public string Id { get; set; }
    }

    [XmlRoot(ElementName = "stado", Namespace = "http://www.w3schools.com")]
    public class Stado
    {
        [XmlElement(ElementName = "rasa", Namespace = "http://www.w3schools.com")]
        public Rasa Rasa { get; set; }
        [XmlElement(ElementName = "owca", Namespace = "http://www.w3schools.com")]
        public List<Owca> Owca { get; set; }
    }

    [XmlRoot(ElementName = "pastwisko", Namespace = "http://www.w3schools.com")]
    public class Pastwisko
    {
        [XmlElement(ElementName = "nazwa", Namespace = "http://www.w3schools.com")]
        public string Nazwa { get; set; }
        [XmlElement(ElementName = "powierzchnia", Namespace = "http://www.w3schools.com")]
        public Powierzchnia Powierzchnia { get; set; }
        [XmlElement(ElementName = "stado", Namespace = "http://www.w3schools.com")]
        public Stado Stado { get; set; }
    }

    [XmlRoot(ElementName = "lista_pastwisk", Namespace = "http://www.w3schools.com")]
    public class Lista_pastwisk
    {
        [XmlElement(ElementName = "pastwisko", Namespace = "http://www.w3schools.com")]
        public List<Pastwisko> Pastwisko { get; set; }
    }

    [XmlRoot(ElementName = "spis_owiec", Namespace = "http://www.w3schools.com")]
    public class Spis_owiec
    {
        [XmlElement(ElementName = "nagłówek", Namespace = "http://www.w3schools.com")]
        public Nagłówek Nagłówek { get; set; }
        [XmlElement(ElementName = "lista_ras", Namespace = "http://www.w3schools.com")]
        public Lista_ras Lista_ras { get; set; }
        [XmlElement(ElementName = "lista_pastwisk", Namespace = "http://www.w3schools.com")]
        public Lista_pastwisk Lista_pastwisk { get; set; }
        [XmlAttribute(AttributeName = "xmlns")]
        public string Xmlns { get; set; }
        [XmlAttribute(AttributeName = "xsi", Namespace = "http://www.w3.org/2000/xmlns/")]
        public string Xsi { get; set; }
        [XmlAttribute(AttributeName = "schemaLocation", Namespace = "http://www.w3.org/2001/XMLSchema-instance")]
        public string SchemaLocation { get; set; }
    }

}
