USE XSBOOK
SELECT X.����֤��,����,��������
	FROM XS X, view_select Y
	WHERE X.����֤��=Y.����֤�� and ��������>
		(SELECT ��������
			FROM XS U,view_select W
			WHERE U.����֤��=W.����֤�� and U.����='����'
          	)
GO