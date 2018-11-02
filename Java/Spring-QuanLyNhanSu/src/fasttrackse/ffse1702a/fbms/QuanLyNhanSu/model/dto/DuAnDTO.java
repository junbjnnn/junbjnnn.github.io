package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.Database;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.DoiTac;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.Framework;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.KhachHang;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.NghiepVu;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.NgonNgu;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.TinhTrang;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;

public class DuAnDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer maDuAn;

	private String tenDuAn;

	private String moTaDuAn;

	private int isDelete;

	private Date startDate;

	private Date endDate;

	private TinhTrang tinhTrang;

	private KhachHang khachHang;

	private NghiepVu nghiepVu;

	private Set<NgonNgu> ngonNgu;

	private Set<DoiTac> doiTac;

	private Set<Framework> framework;

	private Set<Database> database;

	private Set<HoSoNhanVien> hoSoNhanVien;

	private int grantUpdate;

	public List<String> vaiTro;

	public List<String> getVaiTro() {
		return vaiTro;
	}

	public void setVaiTro(List<String> vaiTro) {
		this.vaiTro = vaiTro;
	}

	public Integer getMaDuAn() {
		return maDuAn;
	}

	public void setMaDuAn(Integer maDuAn) {
		this.maDuAn = maDuAn;
	}

	public String getTenDuAn() {
		return tenDuAn;
	}

	public void setTenDuAn(String tenDuAn) {
		this.tenDuAn = tenDuAn;
	}

	public String getMoTaDuAn() {
		return moTaDuAn;
	}

	public void setMoTaDuAn(String moTaDuAn) {
		this.moTaDuAn = moTaDuAn;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public TinhTrang getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(TinhTrang tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public KhachHang getKhachHang() {
		return khachHang;
	}

	public void setKhachHang(KhachHang khachHang) {
		this.khachHang = khachHang;
	}

	public NghiepVu getNghiepVu() {
		return nghiepVu;
	}

	public void setNghiepVu(NghiepVu nghiepVu) {
		this.nghiepVu = nghiepVu;
	}

	public Set<NgonNgu> getNgonNgu() {
		return ngonNgu;
	}

	public void setNgonNgu(Set<NgonNgu> ngonNgu) {
		this.ngonNgu = ngonNgu;
	}

	public Set<DoiTac> getDoiTac() {
		return doiTac;
	}

	public void setDoiTac(Set<DoiTac> doiTac) {
		this.doiTac = doiTac;
	}

	public Set<Framework> getFramework() {
		return framework;
	}

	public void setFramework(Set<Framework> framework) {
		this.framework = framework;
	}

	public Set<Database> getDatabase() {
		return database;
	}

	public void setDatabase(Set<Database> database) {
		this.database = database;
	}

	public Set<HoSoNhanVien> getHoSoNhanVien() {
		return hoSoNhanVien;
	}

	public void setHoSoNhanVien(Set<HoSoNhanVien> hoSoNhanVien) {
		this.hoSoNhanVien = hoSoNhanVien;
	}

	public int getGrantUpdate() {
		return grantUpdate;
	}

	public void setGrantUpdate(int grantUpdate) {
		this.grantUpdate = grantUpdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}

