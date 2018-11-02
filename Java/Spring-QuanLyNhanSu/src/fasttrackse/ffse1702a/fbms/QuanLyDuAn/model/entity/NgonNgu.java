package fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="ngon_ngu")
public class NgonNgu implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="ma_ngon_ngu")
	@NotEmpty
	private String maNgonNgu;
	@NotEmpty
	@Column(name="ten_ngon_ngu")
	private String tenNgonNgu;
	@Column(name="is_delete")
	private int isDelete;
	@ManyToMany(targetEntity = DuAn.class, mappedBy = "ngonNgu", fetch = FetchType.EAGER)
	private List<DuAn> duAn;
	public NgonNgu() {
		super();
	}
	public String getMaNgonNgu() {
		return maNgonNgu;
	}
	public void setMaNgonNgu(String maNgonNgu) {
		this.maNgonNgu = maNgonNgu;
	}
	public String getTenNgonNgu() {
		return tenNgonNgu;
	}
	public void setTenNgonNgu(String tenNgonNgu) {
		this.tenNgonNgu = tenNgonNgu;
	}
	public List<DuAn> getDuAn() {
		return duAn;
	}
	public void setDuAn(List<DuAn> duAn) {
		this.duAn = duAn;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	
	
	
	

}
