

/* acos(x) ��x(����ֵ)�ĽǶ�(�û��ȱ�ʾ) */
declare @angle real
set @angle=0
select 'the acos='+convert(varchar, acos(@angle))
go