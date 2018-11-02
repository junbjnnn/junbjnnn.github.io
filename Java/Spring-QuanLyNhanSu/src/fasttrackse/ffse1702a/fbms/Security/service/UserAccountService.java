package fasttrackse.ffse1702a.fbms.Security.service;

import fasttrackse.ffse1702a.fbms.Security.model.entity.UserAccount;

public interface UserAccountService {
	public UserAccount loadUserByUsername(final String username);
}
