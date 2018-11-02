package fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="nghiep_vu")
public class NghiepVu {
	@Id
	@Column(name="ma_nghiep_vu")
	@NotEmpty
	private String maNghiepVu;
	@Column(name="ten_nghiep_vu")
	@NotEmpty
	private String tenNghiepVu;
	
	
	@Column(name="is_delete")
	private int isDelete;
	
	public NghiepVu() {
		super();
	}
	
	public NghiepVu( String maNghiepVu,  String tenNghiepVu) {
		super();
		this.maNghiepVu = maNghiepVu;
		this.tenNghiepVu = tenNghiepVu;
	}

	public String getMaNghiepVu() {
		return maNghiepVu;
	}
	public void setMaNghiepVu(String maNghiepVu) {
		this.maNghiepVu = maNghiepVu;
	}
	public String getTenNghiepVu() {
		return tenNghiepVu;
	}
	public void setTenNghiepVu(String tenNghiepVu) {
		this.tenNghiepVu = tenNghiepVu;
	}
	
	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
}
