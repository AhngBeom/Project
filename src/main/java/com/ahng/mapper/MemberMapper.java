package com.ahng.mapper;

import com.ahng.domain.MemberVO;

public interface MemberMapper {

	public int register(MemberVO vo);

	public int grantAuth(String userid);

	public MemberVO read(String userid);

	public boolean delete(String userid, String userpw);
}
