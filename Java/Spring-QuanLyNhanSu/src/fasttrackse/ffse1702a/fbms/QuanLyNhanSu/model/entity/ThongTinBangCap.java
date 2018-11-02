package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * The persistent class for the thong_tin_bang_cap database table.
 * 
 */
@Entity
@Table(name = "thong_tin_bang_cap")
public class ThongTinBangCap implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private int id;

	@Column(name = "don_vi_cap", nullable = false, length = 200)
	@NotEmpty
	private String donViCap;

	@Column(name = "loai_bang_cap", nullable = false, length = 20)
	@NotEmpty
	private String loaiBangCap;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ngay_cap", nullable = false)
	@NotNull
	private Date ngayCap;

	@Column(name = "ten_bang_cap", nullable = false, length = 250)
	@NotEmpty
	private String tenBangCap;

	// bi-directional many-to-one association to HoSoNhanVien
	@ManyToOne
	@JoinColumn(name = "ma_nhan_vien", nullable = false)
	private HoSoNhanVien hoSoNhanVien;

	public ThongTinBangCap() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDonViCap() {
		return this.donViCap;
	}

	public void setDonViCap(String donViCap) {
		this.donViCap = donViCap;
	}

	public String getLoaiBangCap() {
		return this.loaiBangCap;
	}

	public void setLoaiBangCap(String loaiBangCap) {
		this.loaiBangCap = loaiBangCap;
	}

	public Date getNgayCap() {
		return this.ngayCap;
	}

	public void setNgayCap(Date ngayCap) {
		this.ngayCap = ngayCap;
	}

	public String getTenBangCap() {
		return this.tenBangCap;
	}

	public void setTenBangCap(String tenBangCap) {
		this.tenBangCap = tenBangCap;
	}

	public HoSoNhanVien getHoSoNhanVien() {
		return this.hoSoNhanVien;
	}

	public void setHoSoNhanVien(HoSoNhanVien hoSoNhanVien) {
		this.hoSoNhanVien = hoSoNhanVien;
	}

}