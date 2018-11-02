package fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

/**
 * @author Sang
 *
 */
@Entity
@Table(name = "vai_tro_thanh_vien")
public class VaiTro {
	@Id
	@Column(name = "ma_vai_tro")
	@NotEmpty
	private String maVaiTro;
	@Column(name = "ten_vai_tro")
	@NotEmpty
	private String tenVaiTro;
	@Column(name = "is_delete")
	private int isDelete;
	// @ManyToMany(targetEntity = HoSoNhanVien.class, mappedBy = "vaiTro", fetch =
	// FetchType.EAGER)
	// private Set<HoSoNhanVien> hoSoNhanVien;

	public String getMaVaiTro() {
		return maVaiTro;
	}

	public void setMaVaiTro(String maVaiTro) {
		this.maVaiTro = maVaiTro;
	}

	public String getTenVaiTro() {
		return tenVaiTro;
	}

	public void setTenVaiTro(String tenVaiTro) {
		this.tenVaiTro = tenVaiTro;
	}

	// public Set<HoSoNhanVien> getHoSoNhanVien() {
	// return hoSoNhanVien;
	// }
	//
	// public void setHoSoNhanVien(Set<HoSoNhanVien> hoSoNhanVien) {
	// this.hoSoNhanVien = hoSoNhanVien;
	// }

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

}
