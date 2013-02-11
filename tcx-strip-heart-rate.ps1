param ($tcxinputfilename, $tcxoutputfilename)

function Usage()
{
  Write-Host "Usage: .\tcx-strip-heart-rate.ps1 tcxinputfilename tcxoutputfilename";
	exit;
}

if (-not $tcxinputfilename -or -not $tcxoutputfilename)
{
	Usage;
}

if(-not (Test-Path $tcxinputfilename))
{
	Write-Host "Input file $tcxinputfilename does not exist, or is not readable.";
	Usage;
}

$xsltfile = Resolve-Path "tcx-strip-heart-rate.xsl";
$tcxinputfile = Resolve-Path $tcxinputfilename;

New-Item $tcxoutputfilename -type file -force | out-null
$tcxoutputfile = Resolve-Path $tcxoutputfilename

$xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
$xslt.Load($xsltfile);
$xslt.Transform($tcxinputfile, $tcxoutputfile);
