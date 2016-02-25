Public Class Form1

    Private _DBAccess As New DataBaseAccess
    Private Sub loaddataongridview()
        Dim sql As String = "SELECT * FROM dbo.KhachHang"
        Dim dTtable As DataTable = _DBAccess.GetDataTable(sql)
        Me.dvba.DataSource = dTtable
        With Me.dvba
            .Columns(0).HeaderText = "MAKH"
            .Columns(1).HeaderText = "TENKH"
            .Columns(2).HeaderText = "DIACHI"
            .Columns(3).HeaderText = "SDT"
        End With
    End Sub

    Private Sub search(value As String)
        Dim sqlquery As String = "SELECT * FROM dbo.KhachHang"
        If Me.ComboBox1.SelectedIndex = 0 Then ' tim theo ma
            sqlquery += String.Format(" where MAKH like '{0}%'", value)
        ElseIf Me.ComboBox1.SelectedIndex = 1 Then 'tim theo ten
            sqlquery += String.Format(" where TENKH like '{0}%'", value)
        End If
        Dim dTtable As DataTable = _DBAccess.GetDataTable(sqlquery)
        Me.dvba.DataSource = dTtable
    End Sub

    Private Sub QL_LOAD(sender As Object, e As EventArgs) Handles MyBase.Load
        loaddataongridview()
    End Sub

    Private Sub txtsearch_TextChanged(sender As Object, e As EventArgs) Handles txtsearch.TextChanged
        search(Me.txtsearch.Text)
    End Sub


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim frm As New Form2(False)
        frm.ShowDialog()
        If frm.DialogResult = Windows.Forms.DialogResult.OK Then
        End If
    End Sub



    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim frm As New Form2(True)
        frm.bmakh.ReadOnly = True
        With Me.dvba
            frm.bmakh.Text = .Rows(.CurrentCell.RowIndex).Cells("MAKH").Value
            frm.btenkh.Text = .Rows(.CurrentCell.RowIndex).Cells("TENKH").Value
            frm.bdiachi.Text = .Rows(.CurrentCell.RowIndex).Cells("DIACHI").Value
            frm.bsdt.Text = .Rows(.CurrentCell.RowIndex).Cells("SDT").Value
        End With
        frm.ShowDialog()
        If frm.DialogResult = Windows.Forms.DialogResult.OK Then 'sua thanh cong thi load
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim khid As String = Me.dvba.Rows(Me.dvba.CurrentCell.RowIndex).Cells("MAKH").Value


        Dim sqlquery As String = String.Format("DELETE KhachHang WHERE MAKH = '{0}'", khid)

        If _DBAccess.ExecuteNoneQuery(sqlquery) Then
            MessageBox.Show("THANH CONG", "THONG BAO", MessageBoxButtons.OK)
        Else
            MessageBox.Show("KHONG THANH CONG", "THONG BAO", MessageBoxButtons.OK)
        End If
    End Sub
End Class
