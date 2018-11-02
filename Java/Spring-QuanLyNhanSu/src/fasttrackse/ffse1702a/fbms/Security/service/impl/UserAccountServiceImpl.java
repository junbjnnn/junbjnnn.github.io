package fasttrackse.ffse1702a.fbms.Security.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fasttrackse.ffse1702a.fbms.Security.model.dao.UserAccountDao;
import fasttrackse.ffse1702a.fbms.Security.model.entity.UserAccount;
import fasttrackse.ffse1702a.fbms.Security.service.UserAccountService;

@Service
public class UserAccountServiceImpl implements UserAccountService {
	@Autowired
	private UserAccountDao userAccountDao;

	@Override
	@Transactional
	public UserAccount loadUserByUsername(String username) {

		return this.userAccountDao.loadUserByUsername(username);
	}

}
