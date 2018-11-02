package fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;

@Entity
@Table(name = "du_an")
public class DuAn implements Serializable, Comparable<DuAn> {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "ma_du_an")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer maDuAn;

	@Column(name = "ten_du_an")
	@NotEmpty
	@Length(min = 10, max = 200)
	private String tenDuAn;

	@Column(name = "mo_ta_du_an")
	@NotEmpty
	@Length(min = 10, max = 200)
	private String moTaDuAn;
	@Column(name = "is_delete")
	private int isDelete;

	@Column(name = "start_date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@NotNull
	private Date startDate;

	@Column(name = "end_date")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull
	private Date endDate;

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "ma_tinh_trang", referencedColumnName = "ma_tinh_trang", insertable = true, updatable = true)
	@NotNull
	private TinhTrang tinhTrang;

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL, optional = true)
	@JoinColumn(name = "ma_khach_hang", referencedColumnName = "ma_khach_hang", insertable = true, updatable = true)
	@NotNull
	private KhachHang khachHang;

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL, optional = true)
	@JoinColumn(name = "ma_nghiep_vu", referencedColumnName = "ma_nghiep_vu", insertable = true, updatable = true)
	@NotNull
	private NghiepVu nghiepVu;

	@ManyToMany(targetEntity = NgonNgu.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "ngon_ngu_du_an", joinColumns = {
			@JoinColumn(name = "ma_du_an", referencedColumnName = "ma_du_an", updatable = true, insertable = true) }, inverseJoinColumns = {
					@JoinColumn(name = "ma_ngon_ngu", referencedColumnName = "ma_ngon_ngu", nullable = true, updatable = false, insertable = true) })
	@NotEmpty
	private Set<NgonNgu> ngonNgu;

	@ManyToMany(targetEntity = DoiTac.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "doi_tac_du_an", joinColumns = {
			@JoinColumn(name = "ma_du_an", referencedColumnName = "ma_du_an", updatable = true, insertable = true) }, inverseJoinColumns = {
					@JoinColumn(name = "ma_doi_tac", referencedColumnName = "ma_doi_tac", nullable = true, updatable = false, insertable = true) })
	@NotEmpty
	private Set<DoiTac> doiTac;

	@ManyToMany(targetEntity = Framework.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "framework_du_an", joinColumns = {
			@JoinColumn(name = "ma_du_an", referencedColumnName = "ma_du_an", updatable = true, insertable = true) }, inverseJoinColumns = {
					@JoinColumn(name = "ma_framework", referencedColumnName = "ma_framework", nullable = true, updatable = false, insertable = true) })
	@NotEmpty
	private Set<Framework> framework;

	@ManyToMany(targetEntity = Database.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "database_du_an", joinColumns = {
			@JoinColumn(name = "ma_du_an", referencedColumnName = "ma_du_an", updatable = true, insertable = true) }, inverseJoinColumns = {
					@JoinColumn(name = "ma_database", referencedColumnName = "ma_database", nullable = true, updatable = false, insertable = true) })
	@NotEmpty
	private Set<Database> database;

	@ManyToMany(targetEntity = HoSoNhanVien.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "nhiem_vu", joinColumns = {
			@JoinColumn(name = "ma_du_an", referencedColumnName = "ma_du_an", updatable = true, insertable = true) }, inverseJoinColumns = {
					@JoinColumn(name = "ma_nhan_vien", referencedColumnName = "ma_nhan_vien", nullable = true, updatable = false, insertable = true) })
	private Set<HoSoNhanVien> hoSoNhanVien;
	@Column(name = "update_link")
	private int grantUpdate;

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

	public Set<NgonNgu> getNgonNgu() {
		return ngonNgu;
	}

	public void setNgonNgu(Set<NgonNgu> ngonNgu) {
		this.ngonNgu = ngonNgu;
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

	public NghiepVu getNghiepVu() {
		return nghiepVu;
	}

	public void setNghiepVu(NghiepVu nghiepVu) {
		this.nghiepVu = nghiepVu;
	}

	public Set<DoiTac> getDoiTac() {
		return doiTac;
	}

	public void setDoiTac(Set<DoiTac> doiTac) {
		this.doiTac = doiTac;
	}

	public int getGrantUpdate() {
		return grantUpdate;
	}

	public void setGrantUpdate(int grantUpdate) {
		this.grantUpdate = grantUpdate;
	}

	@Override
	public int compareTo(DuAn o) {
		// TODO Auto-generated method stub
		return o.getMaDuAn() - this.getMaDuAn();
	}
}
