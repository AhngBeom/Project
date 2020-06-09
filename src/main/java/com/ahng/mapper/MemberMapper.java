package com.ahng.mapper;

import com.ahng.domain.MemberVO;

public interface MemberMapper {
	
	public int idCheck(MemberVO vo);

	public int register(MemberVO vo);
	
	public int update(MemberVO vo);

	public int grantAuth(String userid);

	public MemberVO read(String userid);

	public boolean delete(String userid, String userpw);
}
