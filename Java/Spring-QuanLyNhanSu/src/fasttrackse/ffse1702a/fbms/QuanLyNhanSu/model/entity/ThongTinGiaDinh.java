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
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * The persistent class for the thong_tin_gia_dinh database table.
 * 
 */
@Entity
@Table(name = "thong_tin_gia_dinh")
public class ThongTinGiaDinh implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private int id;

	@Column(name = "gioi_tinh", nullable = false)
	@NotNull
	private Integer gioiTinh;

	@Column(name = "ho_dem", nullable = false, length = 100)
	@NotEmpty
	private String hoDem;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "nam_sinh", nullable = false)
	@NotNull
	private Date namSinh;

	@Column(name = "quan_he", nullable = false, length = 20)
	@NotEmpty
	private String quanHe;

	@Column(name = "que_quan", nullable = false, length = 250)
	@NotEmpty
	private String queQuan;

	@Column(name = "so_dien_thoai", nullable = false, length = 11)
	@Size(min = 10, max = 11)
	private String soDienThoai;

	@Column(nullable = false, length = 20)
	@NotEmpty
	private String ten;

	// bi-directional many-to-one association to HoSoNhanVien
	@ManyToOne
	@JoinColumn(name = "ma_nhan_vien", nullable = false)
	private HoSoNhanVien hoSoNhanVien;

	public ThongTinGiaDinh() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getGioiTinh() {
		return this.gioiTinh;
	}

	public void setGioiTinh(Integer gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getHoDem() {
		return this.hoDem;
	}

	public void setHoDem(String hoDem) {
		this.hoDem = hoDem;
	}

	public Date getNamSinh() {
		return this.namSinh;
	}

	public void setNamSinh(Date namSinh) {
		this.namSinh = namSinh;
	}

	public String getQuanHe() {
		return this.quanHe;
	}

	public void setQuanHe(String quanHe) {
		this.quanHe = quanHe;
	}

	public String getQueQuan() {
		return this.queQuan;
	}

	public void setQueQuan(String queQuan) {
		this.queQuan = queQuan;
	}

	public String getSoDienThoai() {
		return this.soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getTen() {
		return this.ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public HoSoNhanVien getHoSoNhanVien() {
		return this.hoSoNhanVien;
	}

	public void setHoSoNhanVien(HoSoNhanVien hoSoNhanVien) {
		this.hoSoNhanVien = hoSoNhanVien;
	}

}