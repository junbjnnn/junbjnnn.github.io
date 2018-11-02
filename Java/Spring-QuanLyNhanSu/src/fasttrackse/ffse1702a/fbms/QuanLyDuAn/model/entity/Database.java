package fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="co_so_du_lieu")
public class Database {
	@Id
	@Column(name="ma_database")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	private String maDatabase;
	@Column(name="ten_database")
	@NotEmpty
	private String tenDatabase;
	@Column(name="is_delete")
	private int isDelete;
	
	@ManyToMany(fetch = FetchType.EAGER,mappedBy="database",targetEntity=DuAn.class)
	private Set<DuAn> duAn;
	
	
	public String getMaDatabase() {
		return maDatabase;
	}
	public void setMaDatabase(String maDatabase) {
		this.maDatabase = maDatabase;
	}
	
	public String getTenDatabase() {
		return tenDatabase;
	}
	public void setTenDatabase(String tenDatabase) {
		this.tenDatabase = tenDatabase;
	}
	
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public Set<DuAn> getDuAn() {
		return duAn;
	}
	public void setDuAn(Set<DuAn> duAn) {
		this.duAn = duAn;
	}
	
	
	
}
