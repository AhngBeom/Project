package com.ahng.service;

import java.util.List;

import com.ahng.domain.MemberVO;
import com.ahng.domain.Criteria;

public interface MemberService {

	public List<MemberVO> getList(String authority);
	
	public int idCheck(MemberVO	vo);

	public void register(MemberVO vo);

	public MemberVO get(String userID);

	public boolean modify(MemberVO vo);

	public boolean remove(String userID, String userpw);

	public int getTotal(Criteria cri);

}
