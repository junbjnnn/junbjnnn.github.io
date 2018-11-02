package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

/**
 * The persistent class for the phong_ban database table.
 * 
 */
@Entity
@Table(name = "phong_ban")
public class PhongBan implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ma_phong_ban", unique = true, nullable = false, length = 30)
	@NotEmpty
	private String maPhongBan;

	@Column(name = "ten_phong_ban", nullable = false, length = 255)
	@NotEmpty
	private String tenPhongBan;

	// bi-directional many-to-one association to HoSoNhanVien
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "phongBan")
	private List<HoSoNhanVien> hoSoNhanViens;

	public PhongBan() {
	}

	public String getMaPhongBan() {
		return this.maPhongBan;
	}

	public void setMaPhongBan(String maPhongBan) {
		this.maPhongBan = maPhongBan;
	}

	public String getTenPhongBan() {
		return this.tenPhongBan;
	}

	public void setTenPhongBan(String tenPhongBan) {
		this.tenPhongBan = tenPhongBan;
	}

	public List<HoSoNhanVien> getHoSoNhanViens() {
		return this.hoSoNhanViens;
	}

	public void setHoSoNhanViens(List<HoSoNhanVien> hoSoNhanViens) {
		this.hoSoNhanViens = hoSoNhanViens;
	}
	

}