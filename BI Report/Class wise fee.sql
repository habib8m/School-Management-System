
	SELECT c.class_name, 
	cfd.month, 
	cfd.tution_fee, 
	cfd.exam_fee, 
	cfd.development_fee, 
	cfd.others_fee, 
	cfd.total 
	FROM class_fee_m cfm 
	JOIN class_fee_d cfd 
	ON cfd.class_fee_m_id = cfm.class_fee_m_id 
	JOIN class c 
	ON c.class_id = cfm.class_id 
	WHERE C.class_id = nvl(:P205_CLASS_NAME, C.class_id) 
	ORDER BY c.class_id, cfd.class_fee_d_id;