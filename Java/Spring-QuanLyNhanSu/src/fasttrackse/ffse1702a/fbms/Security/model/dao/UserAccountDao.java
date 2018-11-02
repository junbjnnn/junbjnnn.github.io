package fasttrackse.ffse1702a.fbms.Security.model.dao;

import fasttrackse.ffse1702a.fbms.Security.model.entity.UserAccount;

public interface UserAccountDao {
	public UserAccount loadUserByUsername(final String username);
}