using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using System.Xml;
using System.Xml.Schema;
using System.IO;
using Klasy;

namespace PKCK
{
    public class XMLCentrum
    {
        public FileInfo XML { get; set; }
        public FileInfo Schema { get; set; }
        XmlSerializer Serializer { get; set; }

        public XMLCentrum(string xml, string schema)
        {
            XML = new FileInfo(xml);
            Schema = new FileInfo(schema);
            Serializer = new XmlSerializer(typeof(Spis_owiec));
        }

        public Spis_owiec Zaladuj()
        {
            Spis_owiec spis = null;
            if (XML.Exists)
            {
                using (TextReader textReader = new StreamReader(XML.FullName))
                {
                    spis = (Spis_owiec)Serializer.Deserialize(textReader);
                    textReader.Close();
                }
            }
            else
            {
                throw new IOException();
            }

            return spis;
        }
    }
}
