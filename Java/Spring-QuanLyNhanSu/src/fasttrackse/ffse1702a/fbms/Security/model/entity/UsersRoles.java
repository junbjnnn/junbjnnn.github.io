package fasttrackse.ffse1702a.fbms.Security.model.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "users_roles")
public class UsersRoles implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Role role;
	private UserAccount user;

	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ma_role")
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ma_tai_khoan")
	public UserAccount getUser() {
		return user;
	}

	public void setUser(UserAccount user) {
		this.user = user;
	}

}