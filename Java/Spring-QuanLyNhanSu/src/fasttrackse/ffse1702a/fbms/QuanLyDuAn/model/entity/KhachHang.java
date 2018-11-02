package fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="khach_hang")
public class KhachHang {
	@Id
	@Column(name="ma_khach_hang")
	@NotEmpty
	private String maKhachHang;
	@NotEmpty
	@Column(name="ten_khach_hang")
	private String tenKhachHang;
	@NotEmpty
	@Column(name="dia_chi")
	private String diaChi;
	@NotEmpty
	@Column(name="nghiep_vu")
	private String nghiepVu;
	@NotNull
	@Column(name="phone_number")
	private Integer phoneNumber;
	@NotEmpty
	@Email
	@Column(name="email")
	private String email;
	@Column(name="is_delete")
	private int isDelete;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "khachHang",cascade=CascadeType.MERGE)
	private Set<DuAn> duAn = new HashSet<DuAn>(0);
	public KhachHang() {
		
	}
	@OneToMany
	public String getMaKhachHang() {
		return maKhachHang;
	}
	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}
	public String getTenKhachHang() {
		return tenKhachHang;
	}
	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getNghiepVu() {
		return nghiepVu;
	}
	public void setNghiepVu(String nghiepVu) {
		this.nghiepVu = nghiepVu;
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
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	
	
	

}
