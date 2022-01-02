package com.jjs.cat;

import java.io.File;





import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jjs.cat.dao.Dao;
import com.jjs.cat.dto.Dto_allboard;
import com.jjs.cat.dto.Dto_blacklist;
import com.jjs.cat.dto.Dto_comment;
import com.jjs.cat.dto.Dto_freeboard;
import com.jjs.cat.dto.Dto_member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private Dao dao;
	
	@Autowired
	ServletContext context;

	@RequestMapping("main.do")
	public String home(
		@RequestParam(value="pageNum", required=false, defaultValue="1")String strNum,
		@RequestParam(value="board_lv", required=false, defaultValue="0")String bLv,		
		Model model, HttpSession session_board) {
		//value="pageNum"�޴� �̸��� pageNum�̰� required=false ���� �����ص� �����߻� ����, defaultValue="1" �⺻���� 1�̴�. 
		int pageSize = 14;
		int pageSize_m = 10;
		
		int all_totalCount = dao.allboardcnt();
		int free_totalCount = dao.freeboardcnt();
		int qa_totalCount = dao.qaboardcnt();
		int member_totalCoint = dao.allmembercnt();
		
		int all_pageCount = all_totalCount/pageSize;//������ �ƴϱ� ������ 12�ϰ�� 12/10 �̸� 1�̵�.
		    if(all_totalCount%pageSize > 0) all_pageCount++; //������ �ƴϾ ������ ���� �������� pagecount�� �������� �߰���.
		int all_numTmp = (Integer.parseInt(strNum)-1)*pageSize;
		
		int free_pageCount = free_totalCount/pageSize;//������ �ƴϱ� ������ 12�ϰ�� 12/10 �̸� 1�̵�.
	    	if(free_totalCount%pageSize > 0) free_pageCount++; //������ �ƴϾ ������ ���� �������� pagecount�� �������� �߰���.
	    int free_numTmp = (Integer.parseInt(strNum)-1)*pageSize;
	
		int qa_pageCount = qa_totalCount/pageSize;//������ �ƴϱ� ������ 12�ϰ�� 12/10 �̸� 1�̵�.
	    	if(qa_totalCount%pageSize > 0) qa_pageCount++; //������ �ƴϾ ������ ���� �������� pagecount�� �������� �߰���.
	    int qa_numTmp = (Integer.parseInt(strNum)-1)*pageSize;
	    
	    int m_pageCount = member_totalCoint/pageSize_m;//������ �ƴϱ� ������ 12�ϰ�� 12/10 �̸� 1�̵�.
    	if(member_totalCoint%pageSize_m > 0) m_pageCount++; //������ �ƴϾ ������ ���� �������� pagecount�� �������� �߰���.
    	int m_numTmp = (Integer.parseInt(strNum)-1)*pageSize_m;
	
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("all_numTmp", all_numTmp); //num���� 14�� 14�� �� ���� ������.
		map.put("pageSize", pageSize);
		map.put("pageSize_m", pageSize_m);//�� �������� ������ �� ����.
		map.put("free_numTmp", free_numTmp); 
		map.put("qa_numTmp", qa_numTmp);
		map.put("m_numTmp", m_numTmp);
		
		model.addAttribute("all_cnt_member",dao.allmembercnt());
		model.addAttribute("all_list", dao.allboardlist(map));
		model.addAttribute("all_cnt",dao.allboardcnt());// ��ü ������ ���� �ǹ̰� ����.
		model.addAttribute("all_pageCount",all_pageCount);// �� �������� , jsp���� for�� �̿���.
		
		
		if(bLv.equals("1")) {
			model.addAttribute("free_list", dao.freeboardlist(map));
			model.addAttribute("free_cnt",dao.freeboardcnt());// ��ü ������ ���� �ǹ̰� ����.
			model.addAttribute("free_pageCount",free_pageCount);
		}else if(bLv.equals("2")) {		
			model.addAttribute("qa_list", dao.qaboardlist(map));
			model.addAttribute("qa_cnt",dao.qaboardcnt());// ��ü ������ ���� �ǹ̰� ����.
			model.addAttribute("qa_pageCount",qa_pageCount);
		}else if(bLv.equals("11")) {
			model.addAttribute("member_list", dao.member(map));
			model.addAttribute("m_pageCount", m_pageCount);
			model.addAttribute("black", dao.black());
		}
		
		session_board.setAttribute("boardlv", bLv);		
		
		return "main";
	}
	
	@RequestMapping("login.do")
	public String login() {
		return "login";
	}
	@RequestMapping("newid.do")
	public String newid() {
		return "newid";
	}	
	@RequestMapping("newid_proc.do")
	public String newid_proc(Dto_member dto) {	

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", dto.getEmail());
		map.put("id", dto.getId());
		map.put("idnum", dto.getIdnum());
		map.put("name", dto.getName());
		map.put("nickname", dto.getNickname());
		map.put("pnum", dto.getPnum());
		map.put("pw", dto.getPw());
		
		dao.newid_proc(map);
	
		return "login";
	}
	@RequestMapping("free_contents.do")
	public String free_contents(Dto_comment dto_c, Model model, int allidx) {
		HashMap<String, String> map_allboard = new HashMap<String, String>();
		map_allboard.put("idx", allidx+"");
//		map_freeboard.put("title", dto.getTitle());
//		map_freeboard.put("nickname", dto.getNickname());
//		map_freeboard.put("rdate", dto.getRdate());
//		map_freeboard.put("stime", dto.getTt());
//		map_freeboard.put("hit", dto.getHit()+"");
//		map_freeboard.put("contents", dto.getContents());
//		
		HashMap<String, String> map_comment = new HashMap<String, String>();
		map_comment.put("idx_c", allidx+"");
		map_comment.put("nickname", dto_c.getNickname());
		map_comment.put("rdate_c", dto_c.getRdate_c());
		map_comment.put("stime_c", dto_c.getStime_cc());
		map_comment.put("contents_c", dto_c.getContents_c());		

		dao.allhita(map_allboard);
		dao.allhitb(map_allboard);
		model.addAttribute("all_cnt_member",dao.allmembercnt());
		model.addAttribute("list", dao.all_contents(map_allboard));
		model.addAttribute("c_cnt", dao.comment_cnt(map_allboard));
		model.addAttribute("all_cnt",dao.allboardcnt());
		model.addAttribute("list_cm", dao.comment(map_comment));		
		
		return "free_contents";
	}
	
	@RequestMapping("update.do")
	public String update(Model model, int allidx) {
		HashMap<String, String> map_allboard = new HashMap<String, String>();
		map_allboard.put("idx", allidx+"");
		
		model.addAttribute("list", dao.all_contents(map_allboard));
		
		return "update";
	}
	
	@RequestMapping("comment_input.do")
	public String comment_input(Dto_comment dto, @RequestParam(value="idx_c", required=false, defaultValue="0")String strNum) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("idx_c", strNum);
		map.put("nickname", dto.getNickname());
		map.put("contents_c", dto.getContents_c());
		
		dao.comment_input(map);
		
		String idx = strNum;		
		String return_c = String.format("redirect:/free_contents.do?allidx=%s", idx);
		
		return return_c;
	}
	
	@RequestMapping("member_ssesion.do")
	public String member_ssesion(Dto_member dto, HttpSession session) {
		
		List<String> blackList = dao.black_String();		
		String black_id = dto.getId();
		
		if(blackList.contains(black_id)) {
			JOptionPane.showMessageDialog(null, "Ȱ�������� ���� �Դϴ� �����ڿ��� ���� �ٶ��ϴ�.", "Message", JOptionPane.ERROR_MESSAGE);			
			return "login";
		}
		
		Dto_member dto_info = dao.member_session(dto);
		
		if(dto_info == null) {
			JOptionPane.showMessageDialog(null, "���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.");
			return "login";
			
		}else if(dto_info != null) {
			session.setAttribute("userinfo", dto_info);
			session.setMaxInactiveInterval(900);
			
			return "redirect:/main.do";
		}
		
			return null;
		
	}
	@RequestMapping("write.do")
	public String write() {		
		return "write";
	}
	@RequestMapping("write_input.do")
	public String write_freeinput(MultipartHttpServletRequest mrequest) {
		MultipartFile file = mrequest.getFile("file");
		String img = file.getOriginalFilename();
		
		String title = mrequest.getParameter("title");
		String board = mrequest.getParameter("board");
		String contents = mrequest.getParameter("contents");
		String nickname = mrequest.getParameter("nickname");
		
		String path = context.getRealPath("/resources/upload/");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("img", img);
		map.put("title", title);
		map.put("board", board);
		map.put("contents", contents);
		map.put("nickname", nickname);
		
		try {
			file.transferTo(new File(path+img));			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}		
		
		dao.write_input_all(map);
		
		if(board.equals("�����Խ���")) {			
			dao.write_input_free();
		} else if(board.equals("����&�亯")) {
			dao.write_input_qa();
		}		
		
		return "redirect:/main.do";
	}
	
	@RequestMapping("update_input.do")
	public String update_input(MultipartHttpServletRequest mrequest) {
		MultipartFile file = mrequest.getFile("file");
		String img = file.getOriginalFilename();
		
		String title = mrequest.getParameter("title");
		String board = mrequest.getParameter("board");
		String contents = mrequest.getParameter("contents");		
		String idx = mrequest.getParameter("idx");
		
		String path = context.getRealPath("/resources/upload/");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("allidx", idx);
		map.put("img", img);
		map.put("title", title);
		map.put("board", board);
		map.put("contents", contents);		
		
		try {
			file.transferTo(new File(path+img));			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}		
		
		dao.update_input(map);		
	
		return "redirect:/main.do";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}
	
	@RequestMapping("board_delete.do")
	public String board_delete(int allidx, String img) {
		String filename = img;
		String path = context.getRealPath("/resources/upload/");
		File f = new File(path+filename);
		f.delete();
		
		dao.board_delete(allidx);
		return "redirect:/main.do";
	}
	
	@RequestMapping(value="isIdExsit.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> ajaxCheck(@RequestBody Dto_member dto) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("res",dao.isExsitId(dto.getId()));
		return map;
	}
	
	@RequestMapping(value="nicknameExsit.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> ajaxCheck_nn(@RequestBody Dto_member dto) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("res_nn",dao.isExsitnn(dto.getNickname()));
		return map;
	}
	
	@RequestMapping("findid.do")
	public String findid() {
		return "findid";
	}
	
	@RequestMapping("findid_proc.do")
	public String findid_proc(String name, String email) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);	
		
		String id = dao.findid_proc(map);
		JOptionPane.showMessageDialog(null, "���̵�� "+id+"�Դϴ�.");
		
		return "findid";
	}
	
	@RequestMapping("findpw.do")
	public String findpw() {
		return "findpw";
	}
	
	@RequestMapping("findpw_proc.do")
	public String findpw_proc(String id, String pnum) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pnum", pnum);	
		
		String pw = dao.findpw_proc(map);
		JOptionPane.showMessageDialog(null, "��й�ȣ�� "+pw+"�Դϴ�.");
		
		return "findpw";
	}
	
	@RequestMapping("admin.do")
	public String admin() {
		return "admin";
	}
	
	@RequestMapping("member_update.do")
	public String member_update(Dto_member dto, String black) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		String idx = dto.getIdx()+"";
				
		map.put("idx", idx);
		map.put("email", dto.getEmail());
		map.put("id", dto.getId());
		map.put("idnum", dto.getIdnum());
		map.put("name", dto.getName());
		map.put("nickname", dto.getNickname());
		map.put("pnum", dto.getPnum());
		
		dao.member_update(map);
		
		if(black.equals("Ȱ������")) {
			dao.member_black_input(map);
		}else if(black.equals("��������")) {
			dao.member_black_delete(dto.getNickname());
		}
		
		return "redirect:/main.do?board_lv=11";
	}
	
	@RequestMapping("member_delete.do")
	public String member_delete(Dto_member dto) {
		dao.member_delete(dto.getIdx());
		
		return "redirect:/main.do?board_lv=11";
	}
	
}

