package fasttrackse.ffse1702a.fbms.Security.model.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;

@Entity
@Table(name = "users", uniqueConstraints = @UniqueConstraint(columnNames = { "username" }))
public class UserAccount implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ma_tai_khoan", unique = true, nullable = false)
	private Integer maTaiKhoan;
	@Column(name = "username", unique = true, length = 45)
	private String username;
	@Column(name = "password")
	private String password;
	@Column(name = "enabled", nullable = false, columnDefinition = "TINYINT(1)")
	private Boolean enabled;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
	private Set<UsersRoles> usersRoleses = new HashSet<UsersRoles>(0);

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "ma_nhan_vien", referencedColumnName = "ma_nhan_vien", insertable = true, unique = true)
	private HoSoNhanVien nhanVien;

	public Integer getMaTaiKhoan() {
		return maTaiKhoan;
	}

	public void setMaTaiKhoan(Integer maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(final String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(final String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(final Boolean enabled) {
		this.enabled = enabled;
	}

	public Set<UsersRoles> getUsersRoleses() {
		return this.usersRoleses;
	}

	public void setUsersRoleses(final Set<UsersRoles> usersRoleses) {
		this.usersRoleses = usersRoleses;
	}

	public HoSoNhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(HoSoNhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	@Transient
	public List<GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (UsersRoles usersRoles : this.usersRoleses) {
			authorities.add(new SimpleGrantedAuthority(usersRoles.getRole().getName()));
		}
		return authorities;
	}

}