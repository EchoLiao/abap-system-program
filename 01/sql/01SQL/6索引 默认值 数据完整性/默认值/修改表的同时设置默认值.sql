USE XSBOOK
ALTER TABLE XS
	ADD 办证日期 SMALLDATETIME NULL
		CONSTRAINT AddDateDflt  /* 设置默认值约束名 */
		DEFAULT  getdate() WITH VALUES  /* 设置默认值 */
