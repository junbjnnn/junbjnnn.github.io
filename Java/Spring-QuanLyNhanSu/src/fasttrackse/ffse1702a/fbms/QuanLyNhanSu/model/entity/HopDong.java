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
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * The persistent class for the hop_dong database table.
 * 
 */
@Entity
@Table(name = "hop_dong")
public class HopDong implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ma_hop_dong", unique = true, nullable = false)
	@NotNull
	private int maHopDong;

	@Column(name = "luong_thang_13", nullable = false)
	@NotNull
	private Integer luongThang13;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ngay_ket_thuc", nullable = false)
	@NotNull
	private Date ngayKetThuc;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ngay_ky_ket", nullable = false)
	@NotNull
	private Date ngayKyKet;

	@Column(name = "so_ngay_phep", nullable = false)
	@NotNull
	private Integer soNgayPhep;

	@Column(name = "trang_thai", nullable = false)
	@NotNull
	private Integer trangThai;

	// bi-directional many-to-one association to HoSoNhanVien
	@ManyToOne
	@JoinColumn(name = "ma_nhan_vien", nullable = false)
	private HoSoNhanVien hoSoNhanVien;

	// bi-directional many-to-one association to LoaiHopDong
	@ManyToOne
	@JoinColumn(name = "ma_loai_hop_dong", nullable = false)
	@NotNull
	private LoaiHopDong loaiHopDong;

	public HopDong() {
	}

	public int getMaHopDong() {
		return this.maHopDong;
	}

	public void setMaHopDong(int maHopDong) {
		this.maHopDong = maHopDong;
	}

	public Integer getLuongThang13() {
		return this.luongThang13;
	}

	public void setLuongThang13(Integer luongThang13) {
		this.luongThang13 = luongThang13;
	}

	public Date getNgayKetThuc() {
		return this.ngayKetThuc;
	}

	public void setNgayKetThuc(Date ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}

	public Date getNgayKyKet() {
		return this.ngayKyKet;
	}

	public void setNgayKyKet(Date ngayKyKet) {
		this.ngayKyKet = ngayKyKet;
	}

	public Integer getSoNgayPhep() {
		return this.soNgayPhep;
	}

	public void setSoNgayPhep(Integer soNgayPhep) {
		this.soNgayPhep = soNgayPhep;
	}

	public Integer getTrangThai() {
		return this.trangThai;
	}

	public void setTrangThai(Integer trangThai) {
		this.trangThai = trangThai;
	}

	public HoSoNhanVien getHoSoNhanVien() {
		return this.hoSoNhanVien;
	}

	public void setHoSoNhanVien(HoSoNhanVien hoSoNhanVien) {
		this.hoSoNhanVien = hoSoNhanVien;
	}

	public LoaiHopDong getLoaiHopDong() {
		return this.loaiHopDong;
	}

	public void setLoaiHopDong(LoaiHopDong loaiHopDong) {
		this.loaiHopDong = loaiHopDong;
	}

	@Override
	public String toString() {
		return "HopDong [maHopDong=" + maHopDong + ", maNhanVien=" + hoSoNhanVien.getMaNhanVien() + ", luongThang13="
				+ luongThang13 + ", ngayKetThuc=" + ngayKetThuc + ", ngayKyKet=" + ngayKyKet + ", soNgayPhep="
				+ soNgayPhep + ", trangThai=" + trangThai + ", loaiHopDong=" + loaiHopDong + "]";
	}

}