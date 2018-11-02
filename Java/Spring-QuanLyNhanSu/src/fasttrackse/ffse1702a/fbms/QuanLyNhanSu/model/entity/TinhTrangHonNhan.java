package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 * The persistent class for the tinh_trang_hon_nhan database table.
 * 
 */
@Entity
@Table(name = "tinh_trang_hon_nhan")
public class TinhTrangHonNhan implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ma_tinh_trang_hon_nhan", unique = true, nullable = false)
	@NotNull
	private Integer maTinhTrangHonNhan;

	@Column(name = "tinh_trang_hon_nhan", nullable = false, length = 50)
	private String tinhTrangHonNhan;

	// bi-directional many-to-one association to HoSoNhanVien
	@OneToMany(mappedBy = "tinhTrangHonNhan")
	private List<HoSoNhanVien> hoSoNhanViens;

	public TinhTrangHonNhan() {
	}

	public Integer getMaTinhTrangHonNhan() {
		return this.maTinhTrangHonNhan;
	}

	public void setMaTinhTrangHonNhan(Integer maTinhTrangHonNhan) {
		this.maTinhTrangHonNhan = maTinhTrangHonNhan;
	}

	public String getTinhTrangHonNhan() {
		return this.tinhTrangHonNhan;
	}

	public void setTinhTrangHonNhan(String tinhTrangHonNhan) {
		this.tinhTrangHonNhan = tinhTrangHonNhan;
	}

	public List<HoSoNhanVien> getHoSoNhanViens() {
		return this.hoSoNhanViens;
	}

	public void setHoSoNhanViens(List<HoSoNhanVien> hoSoNhanViens) {
		this.hoSoNhanViens = hoSoNhanViens;
	}
}