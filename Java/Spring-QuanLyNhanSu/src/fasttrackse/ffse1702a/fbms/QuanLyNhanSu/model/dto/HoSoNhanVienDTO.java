package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ChucDanh;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.PhongBan;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.QuocTich;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ThongTinBangCap;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ThongTinGiaDinh;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.TinhTrangHonNhan;

/**
 * The persistent class for the ho_so_nhan_vien database table.
 * 
 */

public class HoSoNhanVienDTO implements Serializable {
	private static final long serialVersionUID = 1L;

	private int maNhanVien;

	private String anhDaiDien;

	private String danToc;

	private String email;

	private Integer gioiTinh;

	private String hoDem;

	private Date namSinh;

	private Date ngayCap;

	private String noiCap;

	private String noiTamTru;

	private String queQuan;

	private String soCmnd;

	private String soDienThoai;

	private String ten;

	private Integer trangThai;

	private PhongBan phongBan;

	private ChucDanh chucDanh;

	private QuocTich quocTich;

	private TinhTrangHonNhan tinhTrangHonNhan;

	private List<ThongTinBangCap> thongTinBangCaps;

	private List<ThongTinGiaDinh> thongTinGiaDinhs;

	private Set<DuAnDTO> duAnDTO;

	public int getMaNhanVien() {
		return maNhanVien;
	}

	public void setMaNhanVien(int maNhanVien) {
		this.maNhanVien = maNhanVien;
	}

	public String getAnhDaiDien() {
		return anhDaiDien;
	}

	public void setAnhDaiDien(String anhDaiDien) {
		this.anhDaiDien = anhDaiDien;
	}

	public String getDanToc() {
		return danToc;
	}

	public void setDanToc(String danToc) {
		this.danToc = danToc;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(Integer gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getHoDem() {
		return hoDem;
	}

	public void setHoDem(String hoDem) {
		this.hoDem = hoDem;
	}

	public Date getNamSinh() {
		return namSinh;
	}

	public void setNamSinh(Date namSinh) {
		this.namSinh = namSinh;
	}

	public Date getNgayCap() {
		return ngayCap;
	}

	public void setNgayCap(Date ngayCap) {
		this.ngayCap = ngayCap;
	}

	public String getNoiCap() {
		return noiCap;
	}

	public void setNoiCap(String noiCap) {
		this.noiCap = noiCap;
	}

	public String getNoiTamTru() {
		return noiTamTru;
	}

	public void setNoiTamTru(String noiTamTru) {
		this.noiTamTru = noiTamTru;
	}

	public String getQueQuan() {
		return queQuan;
	}

	public void setQueQuan(String queQuan) {
		this.queQuan = queQuan;
	}

	public String getSoCmnd() {
		return soCmnd;
	}

	public void setSoCmnd(String soCmnd) {
		this.soCmnd = soCmnd;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public Integer getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(Integer trangThai) {
		this.trangThai = trangThai;
	}

	public PhongBan getPhongBan() {
		return phongBan;
	}

	public void setPhongBan(PhongBan phongBan) {
		this.phongBan = phongBan;
	}

	public ChucDanh getChucDanh() {
		return chucDanh;
	}

	public void setChucDanh(ChucDanh chucDanh) {
		this.chucDanh = chucDanh;
	}

	public QuocTich getQuocTich() {
		return quocTich;
	}

	public void setQuocTich(QuocTich quocTich) {
		this.quocTich = quocTich;
	}

	public TinhTrangHonNhan getTinhTrangHonNhan() {
		return tinhTrangHonNhan;
	}

	public void setTinhTrangHonNhan(TinhTrangHonNhan tinhTrangHonNhan) {
		this.tinhTrangHonNhan = tinhTrangHonNhan;
	}

	public List<ThongTinBangCap> getThongTinBangCaps() {
		return thongTinBangCaps;
	}

	public void setThongTinBangCaps(List<ThongTinBangCap> thongTinBangCaps) {
		this.thongTinBangCaps = thongTinBangCaps;
	}

	public List<ThongTinGiaDinh> getThongTinGiaDinhs() {
		return thongTinGiaDinhs;
	}

	public void setThongTinGiaDinhs(List<ThongTinGiaDinh> thongTinGiaDinhs) {
		this.thongTinGiaDinhs = thongTinGiaDinhs;
	}

	public Set<DuAnDTO> getDuAnDTO() {
		return duAnDTO;
	}

	public void setDuAnDTO(Set<DuAnDTO> duAnDTO) {
		this.duAnDTO = duAnDTO;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
