package fasttrackse.ffse1702a.fbms.Security.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import fasttrackse.ffse1702a.fbms.Security.model.dao.UserAccountDao;
import fasttrackse.ffse1702a.fbms.Security.model.entity.UserAccount;
import fasttrackse.ffse1702a.fbms.Security.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserAccountDao userDao;

	@Override
	public UserDetails loadUserByUsername(String username) {
		UserAccount user = userDao.loadUserByUsername(username);

		if (user == null) {
			throw new UsernameNotFoundException("No user found with id:" + username);
		}

		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		return new User(username, user.getPassword(), enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, user.getAuthorities());
	}
}