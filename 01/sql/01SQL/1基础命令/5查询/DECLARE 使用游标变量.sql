/* �α������ʹ�ò���: �����α�--->���α������ֵ--->���α�--->�����α��ȡ��(��¼)--->ʹ�ý�����ر��α�
 * --->ɾ���α������ */
USE XSBOOK
DECLARE @CursorVar CURSOR 
SET @CursorVar = CURSOR SCROLL DYNAMIC /* ���α������ֵ */
FOR
	SELECT ����֤��,����
	FROM XS
	--WHERE ����֤�� '20%'
	WHERE ����֤�� LIKE '20%'
OPEN @CursorVar 
FETCH NEXT FROM @CursorVar 
WHILE @@FETCH_STATUS=0
	BEGIN 
		FETCH NEXT FROM @CursorVar /* ͨ���α��ȡ�� */
	END
CLOSE @CursorVar
DEALLOCATE @CursorVar