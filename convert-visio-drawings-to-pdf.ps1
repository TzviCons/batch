# Convert Visio (2013) documents to PDF 
# Will be applied to all files in the current folder

$drawings = Get-ChildItem -Filter "*.vsdx"
Write-Host "Converting Visio documents to PDF..." -ForegroundColor Cyan
 
try
{
    $visio = New-Object -ComObject Visio.Application
    $visio.Visible = $true
 
    foreach ($drawing in $drawings)
    {
        $pdfname = [IO.Path]::ChangeExtension($drawing.FullName, '.pdf')
        Write-Host "Converting:" $drawing.FullName "to" $pdfname
        $document = $visio.Documents.Open($drawing.FullName)
        # Export all pages to PDF, see constants here http://msdn.microsoft.com/en-us/library/office/ff766893.aspx
        $document.ExportAsFixedFormat(1, $pdfname, 1, 0)
    }
 
}
 
catch
{
    Write-Error $_
}
 
finally
{
    if ($visio) 
    {
        $visio.Quit()
    }
 
}

    Write Preview 

Parsed as Markdown Edit in fullscreen
