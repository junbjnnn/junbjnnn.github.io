package fasttrackse.ffse1702a.fbms.Security.model.dao.impl;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import fasttrackse.ffse1702a.fbms.Security.model.dao.UserAccountDao;
import fasttrackse.ffse1702a.fbms.Security.model.entity.UserAccount;

@Repository
@Transactional(rollbackFor = Exception.class)
public class UserAccountDaoImpl implements UserAccountDao {

	@Autowired
	SessionFactory sessionFatory;

	@Override
	public UserAccount loadUserByUsername(final String username) {
		Session session = sessionFatory.getCurrentSession();
		UserAccount user = null;
		try {
			user = session.createQuery("from UserAccount where username='" + username + "'", UserAccount.class)
					.getSingleResult();
		} catch (NoResultException nre) {
			// Ignore this because as per your logic this is ok!
		}

		return user;
	}
}