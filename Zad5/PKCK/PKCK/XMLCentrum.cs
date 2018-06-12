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
using System.Xml.Xsl;
using System.Xml.XPath;
using System.Xml.Linq;

namespace PKCK
{
    public class XMLCentrum
    {
        public FileInfo XML { get; set; }
        public FileInfo Schema { get; set; }
        public FileInfo XSLT { get; set; }
        XmlSerializer Serializer { get; set; }

        public XMLCentrum(string xml, string schema, string xslt)
        {
            XML = new FileInfo(xml);
            Schema = new FileInfo(schema);
            XSLT = new FileInfo(xslt);
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

        public void Zapisz(Spis_owiec spis)
        {
            if (XML.Exists) XML.Delete();

            Stream stream = new FileStream(XML.FullName, FileMode.Create);
            Serializer.Serialize(stream, spis);
            stream.Close();

            string text = File.ReadAllText(XML.FullName);
            text = text.Replace("xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"", "");
            File.WriteAllText(XML.FullName, text);
        }

        public bool Waliduj(Spis_owiec spis)
        {
            try
            {
                FileInfo kopia = new FileInfo("kopia.xml");

                if (kopia.Exists) kopia.Delete();

                Stream stream = new FileStream(kopia.FullName, FileMode.Create);
                Serializer.Serialize(stream, spis);
                stream.Close();

                string text = File.ReadAllText("kopia.xml");
                text = text.Replace("xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"", "");
                File.WriteAllText("kopia.xml", text);

                XmlDocument xmld = new XmlDocument();
                //string xmlText = File.ReadAllText("kopia.xml");
                xmld.Load("kopia.xml");
                xmld.Schemas.Add("http://www.w3schools.com", Schema.FullName);
                xmld.Validate(WalidacjaCallBack);
                return true;
            }
            catch
            {
                return false;
            }

        }

        private void WalidacjaCallBack(object sender, ValidationEventArgs e)
        {

            throw new Exception();
        }

        public void Konwertuj(Spis_owiec spis)
        {
            FileInfo kopia = new FileInfo("kopiaXSL.xml");

            if (kopia.Exists) kopia.Delete();

            Stream stream = new FileStream(kopia.FullName, FileMode.Create);
            Serializer.Serialize(stream, spis);
            stream.Close();
            string text = File.ReadAllText("kopiaXSL.xml");
            text = text.Replace("xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"", "");
            text = text.Replace("xmlns=\"http://www.w3schools.com\"", "");
            File.WriteAllText("kopiaXSL.xml", text);

            var xmlDocument = new XPathDocument("kopiaXSL.xml");
            var xslt = new XslCompiledTransform();

            xslt.Load(XSLT.FullName);
            FileStream outputStream = new FileStream("pomocniczy.xml", FileMode.Create);
            xslt.Transform(xmlDocument, null, outputStream);
            outputStream.Close();
        }

        public void DoSVG()
        {

            var xmlDocument = new XPathDocument("pomocniczy.xml");
            var xslt = new XslCompiledTransform();

            xslt.Load("../../XML/DoSVGg.xsl");
            FileStream outputStream = new FileStream("SVG.svg", FileMode.Create);
            xslt.Transform(xmlDocument, null, outputStream);
            outputStream.Close();
        }
<<<<<<< HEAD

        //public void DoPDF()
        //{

        //    var xmlDocument = new XPathDocument("pomocniczy.xml");
        //    var xslt = new XslCompiledTransform();

        //    xslt.Load("../../XML/DoPDF.xsl");
        //    FileStream outputStream = new FileStream("PDF.pdf", FileMode.Create);
        //    xslt.Transform(xmlDocument, null, outputStream);
        //    outputStream.Close();
        //}

        public void DoTXT()
        {

            var xmlDocument = new XPathDocument("pomocniczy.xml");
            var xslt = new XslCompiledTransform();

            xslt.Load("../../XML/ZPomocniczegoDoTxt.xsl");
            FileStream outputStream = new FileStream("TXT.txt", FileMode.Create);
            xslt.Transform(xmlDocument, null, outputStream);
            outputStream.Close();
        }

     /*   public void DoXHTML()
        {

            var xmlDocument = new XPathDocument("pomocniczy.xml");
            var xslt = new XslCompiledTransform();

            xslt.Load("../../XML/ZpomocniczegoDoXhtml.xsl");
            FileStream outputStream = new FileStream("XHTML.xhtml", FileMode.Create);
            xslt.Transform(xmlDocument, null, outputStream);
            outputStream.Close();
        }
        */
=======
>>>>>>> parent of 5541e10... Niepotrzebne rzeczy
    }
}
