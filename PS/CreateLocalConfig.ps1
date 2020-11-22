Param($checkoutDir,$AdUserName,$AdPassword)

$checkoutDir = "D:\bfglearn\bfglearn\LetsBuildIt";
$ADName = "EPAM_DEV";
$Domain = "epam.com";
$SizeLimit = "300";

$inFileName =  $checkoutDir + "\LetsBuildIt\local.config.txt";
$outFileName =  $checkoutDir + "\LetsBuildIt\local.config";
$xmlDoc = [System.Xml.XmlDocument](Get-Content $inFileName);
$newXmlAddElement = $xmlDoc.configuration.ActiveDirectoryConfig.Servers.AppendChild($xmlDoc.CreateElement("add"));
$newXmlAddElement.SetAttribute("Name", $ADName);
$newXmlAddElement.SetAttribute("Domain", $Domain);
$newXmlAddElement.SetAttribute("Username", $AdUserName);
$newXmlAddElement.SetAttribute("Password", $AdPassword);
$newXmlAddElement.SetAttribute("SizeLimit", $SizeLimit);
$xmlDoc.Save($outFileName);
