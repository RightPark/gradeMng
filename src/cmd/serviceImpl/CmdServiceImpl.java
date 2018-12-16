package cmd.serviceImpl;

import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import cmd.service.CmdService;
import cmd.vo.CmdVO;
import helper.dao.CommonDAO;
import net.sf.json.JSONObject;




@Service("cmdService")
public class CmdServiceImpl implements CmdService
{
	private final static Log logger = LogFactory.getLog(CmdServiceImpl.class);
	
	@Resource(name="commonDao")
	private CommonDAO commonDao;


	@Override
    public CmdVO getMemberInfo( Map<String, Object> pMap ) {
		CmdVO vo = null;
    	
        try {
			vo = (CmdVO)this.commonDao.getReadData("cmd.getMemberInfo", pMap);
		} catch (Exception e) {
			logger.debug(e.toString());
		}
        
        return vo;
    }

	
	@Override
	public List<Object> get_info_list(Map<String, Object> pMap) {
		
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.get_info_list", pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public List<Object> get_info_Detail(Map<String, Object> pMap) {
		
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.get_info_Detail", pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public int insert_apply(Map<String, Object> pMap) {
		
		int result = 0;
		
		try {

			result = this.commonDao.insertData("cmd.insert_apply",pMap);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	@Override
	public List<Object> get_apply_list(Map<String, Object> pMap) {
		
		List<Object> list = null;
		
		try {
			list = this.commonDao.getListData("cmd.get_apply_list", pMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	





}//end class

