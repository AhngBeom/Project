package com.ahng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ahng.domain.Criteria;
import com.ahng.domain.MemberVO;
import com.ahng.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public List<MemberVO> getList(String authority) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int idCheck(MemberVO vo) {
		return mapper.idCheck(vo);
	}

	@Transactional
	@Override
	public void register(MemberVO vo) {
		if(mapper.register(vo) == 1) {
			mapper.grantAuth(vo.getUserid());
		}
	}

	@Override
	public MemberVO get(String userID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(MemberVO vo) {
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(String userID, String userpw) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

}
