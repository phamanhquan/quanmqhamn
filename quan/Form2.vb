Public Class Form2

    Private _DBAccess As New DataBaseAccess
    Private _sua As Boolean = False

    Public Sub New(isedit As Boolean)

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        _sua = isedit
    End Sub

    Private Function insertkh() As Boolean
        Dim sqlquery As String = "Insert into KhachHang ( MAKH, TENKH, DIACHI, SDT )"
        sqlquery += String.Format("values('{0}','{1}','{2}','{3}')", bmakh.Text, btenkh.Text, bdiachi.Text, bsdt.Text)
        Return _DBAccess.ExecuteNoneQuery(sqlquery)
    End Function

    Private Function UPDATEKH() As Boolean
        Dim sqlquery As String = String.Format("UPDATE KhachHang SET TENKH = '{0}' , DIACHI = '{1}', SDT = '{2}' where MAKH = '{3}'", Me.bmakh.Text, Me.btenkh.Text, Me.bdiachi.Text, Me.bsdt.Text)
        Return _DBAccess.ExecuteNoneQuery(sqlquery)
    End Function

    Private Function kiem() As Boolean
        Return (String.IsNullOrEmpty(bmakh.Text) OrElse String.IsNullOrEmpty(btenkh.Text) _
            OrElse String.IsNullOrEmpty(bdiachi.Text) OrElse String.IsNullOrEmpty(bsdt.Text))
    End Function

    Private Sub butok_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If kiem() Then
            MessageBox.Show("hay nhap gia tri truoc khi add", "erro", MessageBoxButtons.OK)
        Else
            If _sua Then
                If UPDATEKH() Then
                    MessageBox.Show("thanh cong", "thong bao", MessageBoxButtons.OK)
                    Me.DialogResult = Windows.Forms.DialogResult.OK
                Else
                    MessageBox.Show("loi", "thong bao", MessageBoxButtons.OK)
                    Me.DialogResult = Windows.Forms.DialogResult.No
                End If
            Else
                If insertkh() Then
                    MessageBox.Show("ok", "thong bao", MessageBoxButtons.OK)
                    Me.DialogResult = Windows.Forms.DialogResult.OK
                Else
                    MessageBox.Show("loi ", "thong bao", MessageBoxButtons.OK)
                    Me.DialogResult = Windows.Forms.DialogResult.No
                End If

            End If
            Me.Close()
        End If
    End Sub


    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Me.Close()
    End Sub
End Class