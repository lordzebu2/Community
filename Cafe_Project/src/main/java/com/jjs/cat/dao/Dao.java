package com.jjs.cat.dao;

import java.io.File;
import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jjs.cat.dto.Dto_allboard;
import com.jjs.cat.dto.Dto_blacklist;
import com.jjs.cat.dto.Dto_comment;
import com.jjs.cat.dto.Dto_freeboard;
import com.jjs.cat.dto.Dto_member;
import com.jjs.cat.dto.Dto_qaboard;

@Repository
public class Dao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* ===== 전체글 게시판 ===== */
	
	public int allboardcnt() {
		return sqlSession.selectOne("com.js.mybatis.allboardcnt");
	}
	
	public int allmembercnt() {
		return sqlSession.selectOne("com.js.mybatis.allmembercnt");
	}
	
	public int comment_cnt(Map<String, String> map) {
		return sqlSession.selectOne("com.js.mybatis.comment_cnt", map);
	}
	
	public List<Dto_allboard> allboardlist(Map<String, Integer> map) {
		return sqlSession.selectList("com.js.mybatis.allboardlist", map);
	}
	
	public int allhita(Map<String, String> map) {
		return sqlSession.update("com.js.mybatis.allhita", map);
	}
	
	public int allhitb(Map<String, String> map) {
		return sqlSession.update("com.js.mybatis.allhitb", map);
	}
	
	public List<Dto_allboard> all_contents(Map<String, String> map) {
		return sqlSession.selectList("com.js.mybatis.allcontents", map);
	}
	
	public int write_input_all(Map<String, String> map) {
		if(map.get("board").equals("자유게시판")) {
			return sqlSession.insert("com.js.mybatis.write_freeinput_all", map);
		} else if(map.get("board").equals("질문&답변")) {
			return sqlSession.insert("com.js.mybatis.write_qainput_all", map);
		}
		return 0;
	}
	
	public int update_input(Map<String, String> map) {
		return sqlSession.update("com.js.mybatis.update_input", map);
	}
	
	public int board_delete(int allidx) {
		return sqlSession.delete("com.js.mybatis.board_delete", allidx);
	}
	
	public List<Dto_member> member(Map<String, Integer> map) {
		return sqlSession.selectList("com.js.mybatis.member", map);
	}
	
	public List<Dto_blacklist> black() {
		return sqlSession.selectList("com.js.mybatis.black");
	}
	
	public List<String> black_String() {
		return sqlSession.selectList("com.js.mybatis.black_String");
	}
	
	
	
	/* ===== 자유 게시판 ===== */
	
	public int freeboardcnt() {
		return sqlSession.selectOne("com.js.mybatis.freeboardcnt");
	}
	
	public List<Dto_freeboard> freeboardlist(Map<String, Integer> map) {
		return sqlSession.selectList("com.js.mybatis.freeboardlist", map);
	}
	
	public int write_input_free() {
		return sqlSession.insert("com.js.mybatis.write_input_free");
	}
	
	/* ===== 질문과답변 게시판 ===== */
	
	public int qaboardcnt() {
		return sqlSession.selectOne("com.js.mybatis.qaboardcnt");
	}
	
	public List<Dto_qaboard> qaboardlist(Map<String, Integer> map) {
		return sqlSession.selectList("com.js.mybatis.qaboardlist", map);
	}

	public int write_input_qa() {
		return sqlSession.insert("com.js.mybatis.write_input_qa");
	}
	
	
	

	public int newid_proc(Map<String, String> map){
		return sqlSession.insert("com.js.mybatis.insertData", map);
	}	
	
	public Dto_member member_session(Dto_member dto) {		
		return sqlSession.selectOne("com.js.mybatis.member_ssesion", dto);
	}
	
	public List<Dto_comment> comment(Map<String, String> map) {
		return sqlSession.selectList("com.js.mybatis.comment", map);
	}
	
	public int comment_input(Map<String, String> map){
		return sqlSession.insert("com.js.mybatis.comment_input", map);
	}	
	
	public String isExsitId(String id) {
		String str = "사용 가능한 아이디";		
		
		int res = sqlSession.selectOne("com.js.mybatis.ajax_id", id);
		if(res>0) {
			str = "이미 존재하는 아이디";
		}
		return str;
	}
	
	public String isExsitnn(String nickname) {
		String str_nn = "사용 가능한 닉네임";	
		
		int res_nn = sqlSession.selectOne("com.js.mybatis.ajax_nickname", nickname);
		if(res_nn>0) {
			str_nn = "이미 존재하는 닉네임";
		}
		return str_nn;
	}
	
	public String findid_proc(Map<String, String> map) {
		return sqlSession.selectOne("com.js.mybatis.findid_proc", map);
	}
	
	public String findpw_proc(Map<String, String> map) {
		return sqlSession.selectOne("com.js.mybatis.findpw_proc", map);
	}
	
	public int member_update(Map<String, String> map){
		return sqlSession.update("com.js.mybatis.member_update", map);
	}
	
	public int member_delete(int idx){
		return sqlSession.delete("com.js.mybatis.member_delete", idx);
	}
	
	public int member_black_input(Map<String, String> map){
		return sqlSession.insert("com.js.mybatis.member_black_input", map);
	}
	
	public int member_black_delete(String nickname){
		return sqlSession.delete("com.js.mybatis.member_black_delete", nickname);
	}
	
}
