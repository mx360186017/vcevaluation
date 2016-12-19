package com.vcevaluation.mapping;
import com.vcevaluation.pojo.Upload;
import java.util.List;


public interface UploadMapper {
	int insert(Upload up);

	Upload select(Integer upload_id);
	
	Upload selectUploadByName(String upload_name);
    
	List<Upload>selectname();
}
