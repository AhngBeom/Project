package com.ahng.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberTests {

	@Autowired
	private PasswordEncoder pwencoder;
	@Autowired
	private DataSource ds;

	public void insertMember() {
		String sql = "insert into members(userid, userpw, username) values(?, ?, ?)";

		for (int i = 0; i < 1; i++) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(2, pwencoder.encode("admin"));

				if (i == 0) {
					pstmt.setString(1, "admin");
					pstmt.setString(3, "관리자" + i);
				} else{
					pstmt.setString(1, "member" + i);
					pstmt.setString(3, "회원" + i);
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e2) {
						// TODO: handle exception
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e2) {
						// TODO: handle exception
					}
				}
			}

		}
	}

	public void grantMemberAuthority() {
		String sql = "insert into authorities(userid, authority) values(?, ?)";

		for (int i = 0; i < 1; i++) {

			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);

				if (i == 0) {
					pstmt.setString(1, "admin");
					pstmt.setString(2, "ROLE_ADMIN");
				} else{
					pstmt.setString(1, "member" + i);
					pstmt.setString(2, "ROLE_MEMBER");
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e2) {
						// TODO: handle exception
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e2) {
						// TODO: handle exception
					}
				}
			}

		}
	}

	@Test
	public void test() {
		insertMember();
		grantMemberAuthority();
	}

}
