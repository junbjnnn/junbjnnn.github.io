Public sheetName As String
Public selectCell As String
Public maxCri As Integer
Public xCri As Integer
Public yCri As Integer

'Setting default value
Function set_value()
    sheetName = "Sheet1"
    selectCell = "B1"
    maxCri = 5
    xCri = 4
    yCri = 5
End Function

'Select num criteria
Private Sub Worksheet_Change(ByVal Target As Range)
    Call set_value
    If Not Intersect(Target, Range(selectCell)) Is Nothing Then
        Select Case Range(selectCell)
            Case 1 To maxCri
                Cells(yCri, xCri).Value = "Criteria"
                Dim val As Variant
                val = ThisWorkbook.Worksheets(sheetName).Range(selectCell).Value
                Dim i, j As Integer
                For i = 1 To maxCri
                    Cells(yCri + i, xCri + i).Value = 1
                    Cells(yCri + i, xCri).Value = i
                    Cells(yCri, xCri + i).Value = i
                    For j = 1 To i - 1
                        If IsEmpty(Cells(yCri + i - j, xCri + i).Value) = True Then
                            Cells(yCri + i - j, xCri + i).Value = 1
                        End If
                        
                        Cells(yCri + i, xCri + i - j).Formula = "= 1/" & Cells(yCri + i - j, xCri + i).Address
                    Next j
                Next i
                
                Range(Cells(yCri, xCri), Cells(yCri + maxCri, xCri + maxCri)).Font.Strikethrough = True
                Range(Cells(yCri, xCri), Cells(yCri + val, xCri + val)).Font.Strikethrough = False
        End Select
    End If
End Sub