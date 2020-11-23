Param($checkoutDir,$AdUserName,$AdPassword)

$ADName = "EPAM_DEV";
$Domain = "epam.com";
$SizeLimit = "300";

$inFileName =  "LetsBuildIt\LetsBuildIt\local.config.txt";
$outFileName = "LetsBuildIt\LetsBuildIt\local.config";
$xmlDoc = [System.Xml.XmlDocument](Get-Content $inFileName);
$newXmlAddElement = $xmlDoc.CreateElement("add");
$newXmlAddElement.SetAttribute("Name", $ADName);
$newXmlAddElement.SetAttribute("Domain", $Domain);
$newXmlAddElement.SetAttribute("Username", $AdUserName);
$newXmlAddElement.SetAttribute("Password", $AdPassword);
$newXmlAddElement.SetAttribute("SizeLimit", $SizeLimit);

$xmlDoc.SelectSingleNode("//configuration/ActiveDirectoryConfig/Servers").AppendChild($newXmlAddElement);

$xmlDoc.Save($outFileName);
