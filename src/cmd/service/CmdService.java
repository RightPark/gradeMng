package cmd.service;

import java.util.List;
import java.util.Map;

import cmd.vo.CmdVO;

public interface CmdService {
	

    public CmdVO getMemberInfo( Map<String, Object> pMap );
    public List<Object> get_info_list(Map<String, Object> pMap); 
    public List<Object> get_info_Detail(Map<String, Object> pMap);
    public int insert_apply(Map<String, Object> pMap);
    public List<Object> get_apply_list(Map<String, Object> pMap);  
    
    
 
}


