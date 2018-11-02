package fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="doi_tac")
public class DoiTac {
	@Id
	@Column(name="ma_doi_tac")
	@NotEmpty
	private String maDoiTac;
	@NotEmpty
	@Column(name="ten_doi_tac")
	private String tenDoiTac;
	@NotEmpty
	@Column(name="dia_chi")
	private String diaChi;
	@NotNull
	@Column(name="phone_number")
	private Integer phoneNumber;
	@NotEmpty
	@Email
	@Column(name="email")
	private String email;
	@Column(name="is_delete")
	private int isDelete;
	
	@ManyToMany(fetch=FetchType.EAGER,mappedBy="doiTac",targetEntity=DuAn.class)
	private Set<DuAn> duAn;
	
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public String getMaDoiTac() {
		return maDoiTac;
	}
	public void setMaDoiTac(String maDoiTac) {
		this.maDoiTac = maDoiTac;
	}
	public String getTenDoiTac() {
		return tenDoiTac;
	}
	public void setTenDoiTac(String tenDoiTac) {
		this.tenDoiTac = tenDoiTac;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public Integer getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(Integer phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Set<DuAn> getDuAn() {
		return duAn;
	}
	public void setDuAn(Set<DuAn> duAn) {
		this.duAn = duAn;
	}
	
}
