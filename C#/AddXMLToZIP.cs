protected void AddXMLToZIP(object Sender, EventArgs e)
{
string ZIPName = "TestZIP";

using (ZipFile zip = ZipFile.Create(MapPath + "ZIP" + ZIPName + ".zip"))
{
//Allow the zipfile to be updated
zip.BeginUpdate();

//Set the folder on the server
string MapPath = Server.MapPath("ZIP/");

//Set the name of the XML file to produce
string xmlName = "ZIPTest";

//Setup the XML File
string XML = "<?xml version=\"1.0\" encoding=\"utf-8\"?><XMLTest Version=\"8.0\" Units=\"twips\"><PaperOrientation>Landscape</PaperOrientation><Id>Address</Id><IsOutlined>false</IsOutlined><Attributes><Font Family=\"Arial\" Size=\"12\" Bold=\"False\" Italic=\"False\" Underline=\"False\" Strikeout=\"False\" /><ForeColor Alpha=\"255\" Red=\"0\" Green=\"0\" Blue=\"0\" HueScale=\"100\" /></Attributes></Element></StyledText></TextObject><Bounds X=\"1893\" Y=\"810\" Width=\"2880\" Height=\"300\" /></ObjectInfo></XMLTest>";

//Create a XML document
XmlDocument XMLDoc = new XmlDocument();

//Load the XML into the document (also parses it)
XMLDoc.LoadXml(XML);

//Test if the file already exists or not 
FileInfo OverWriteXML = new FileInfo(MapPath + xmlName);

if (!OverWriteXML.Exists)
{//File doesn't exist yet, save it to the folder
    XMLDoc.Save(MapPath + xmlName);
}
else if (OverWriteXML.Exists)
{//File already exists, add a number at the end to give it an unique identifier in the form of todays date
    xmlName = xmlName + DateTime.Now.ToShortDateString() + ".xml";
    XMLDoc.Save(MapPath + xmlName);
}

//The nametransform is done to prevent the zip file from adding the folders as seperate files. 
zip.NameTransform = new ZipNameTransform(MapPath);

//Add the file, standard compression applies
zip.Add(MapPath + xmlName, CompressionMethod.Stored);

//Commit the update
zip.CommitUpdate();
}
}