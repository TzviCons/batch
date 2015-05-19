Option Explicit
'Testing:
' The .vsdx sub has been successfully used 5/19/2015
Main()

Sub Main()
  If WScript.Arguments.Count > 0 Then 
      Dim objFSO : Set objFSO = CreateObject("Scripting.FileSystemObject")
      Dim i
      For i = 0 to wscript.arguments.count - 1
          Dim strFilePath : strFilePath = WScript.Arguments.Item(i)
          'Dim dirPath : dirPath = objFSO.GetParentFolderName(strFilePath)
          WScript.Echo "dirPath: " & dirPath
          Dim fileBaseName : fileBaseName = objFSO.GetBaseName(strFilePath)
          WScript.Echo "orig file strFilePath: " & strFilePath
          Dim strFullFilePath : strFullFilePath = objFSO.GetAbsolutePathName(strFilePath)
		  'I replaced orig dirPath with this one as the orig was returning relative path not absolute path
		  Dim dirPath : dirPath = objFSO.GetParentFolderName(strFullFilePath)
          
		  WScript.Echo "strFullFilePath: " & strFullFilePath
          'Dim strNewFileName : strNewFileName = dirPath & "\" & fileBaseName & ".pdf"
          Dim strNewFileName : strNewFileName = dirPath & "\" & fileBaseName & ".pdf"
          
		  WScript.Echo "strNewFileName: " & strNewFileName
          Dim strFileExt : strFileExt = UCase(objFSO.GetExtensionName(strFilePath))
		  Select Case strFileExt
              Case "DOC"
                  DOC2PDF strFilePath, strNewFileName
              Case "XLS"
                  XLS2PDF strFilePath, strNewFileName
              Case "PPT"
                  PPT2PDF strFilePath, strNewFileName
              Case "VSD"
                  VSD2PDF strFilePath, strNewFileName
              Case "VSDX"
                  VSDX2PDF strFullFilePath, strNewFileName
              Case Else
                  WScript.Echo "There is no conversion engine for extension type " & strFileExt
          End Select
      Next
  Else
      msgbox("You must select a valid file to convert.")
  End If
End Sub

Sub PPT2PDF(strSourceFile, strDestFile)
  Const ppWindowMinimized = 2
  Const ppWindowNormal = 1
  Const ppSaveAsPDF = 32

  Dim objPPT : Set objPPT = CreateObject("PowerPoint.Application")
  objPPT.Visible = True
  objPPT.WindowState = ppWindowMinimized
  objPPT.Presentations.Open strSourceFile
  objPPT.ActivePresentation.SaveAs strDestFile, ppSaveAsPDF 
  objPPT.Quit()
End Sub

Sub DOC2PDF(strSourceFile, strDestFile)
  Const wdExportAllDocument = 0
  Const wdExportOptimizeForPrint = 0
  Const wdExportDocumentContent = 0
  Const wdExportFormatPDF = 17
  Const wdExportCreateHeadingBookmarks = 1

  Dim objWord : Set objWord = CreateObject("Word.Application")
  Dim objDoc : Set objDoc = objWord.Documents.Open(strSourceFile,,TRUE)    
  objWord.ActiveDocument.ExportAsFixedFormat strDestFile, wdExportFormatPDF, False, _
                  wdExportOptimizeForPrint, wdExportAllDocument,,, _
                  wdExportDocumentContent, False, True, wdExportCreateHeadingBookmarks
  objWord.Quit()
End Sub

Sub XLS2PDF(strSourceFile, strDestFile)
  Const xlTypePDF = 0

  Dim objExcel : Set objExcel = CreateObject("Excel.Application")
  Dim objeDoc : Set objeDoc = objExcel.Workbooks.Open(strSourceFile,,TRUE)    
  objExcel.ActiveWorkbook.ExportAsFixedFormat xlTypePDF, strDestFile
  objExcel.ActiveWorkbook.Close(False)
  objExcel.Quit
End Sub

Sub VSD2PDF(strSourceFile, strDestFile)
  Const xlTypePDF = 1
  Const visOpenRO = 2
  Const visOpenMinimized = 16
  Const visOpenHidden = 64
  Const visOpenMacrosDisabled = 128
  Const visOpenNoWorkspace = 256

  Dim objVisio : Set objVisio = CreateObject("Visio.Application")
  Dim objeDoc
  Set objeDoc = objVisio.Documents.OpenEx(strSourceFile, visOpenRO + visOpenMinimized + visOpenHidden + visOpenMacrosDisabled + visOpenNoWorkspace)    
  objeDoc.ExportAsFixedFormat xlTypePDF, strDestFile, 1, 0
  objeDoc.Close
  objVisio.Quit
End Sub

Sub VSDX2PDF(strSourceFile, strDestFile)
  Const xlTypePDF = 1
  Const visOpenRO = 2
  Const visOpenMinimized = 16
  Const visOpenHidden = 64
  Const visOpenMacrosDisabled = 128
  Const visOpenNoWorkspace = 256

  Dim objVisio : Set objVisio = CreateObject("Visio.Application")
  Dim objeDoc
  'Set objeDoc = objVisio.Documents.OpenEx(strSourceFile, visOpenRO + visOpenMinimized + visOpenHidden + visOpenMacrosDisabled + visOpenNoWorkspace)    
  Set objeDoc = objVisio.Documents.Open(strSourceFile)    
  objeDoc.ExportAsFixedFormat xlTypePDF, strDestFile, 1, 0
  objeDoc.Close
  objVisio.Quit
End Sub