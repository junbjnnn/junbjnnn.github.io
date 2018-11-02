package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * The persistent class for the loai_hop_dong database table.
 * 
 */
@Entity
@Table(name = "loai_hop_dong")
public class LoaiHopDong implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ma_loai_hop_dong", unique = true, nullable = false)
	private int maLoaiHopDong;

	@Column(name = "ten_hop_dong", nullable = false, length = 250)
	private String tenHopDong;

	// bi-directional many-to-one association to HopDong
	@OneToMany(mappedBy = "loaiHopDong")
	private List<HopDong> hopDongs;

	public LoaiHopDong() {
	}

	public int getMaLoaiHopDong() {
		return this.maLoaiHopDong;
	}

	public void setMaLoaiHopDong(int maLoaiHopDong) {
		this.maLoaiHopDong = maLoaiHopDong;
	}

	public String getTenHopDong() {
		return this.tenHopDong;
	}

	public void setTenHopDong(String tenHopDong) {
		this.tenHopDong = tenHopDong;
	}

	public List<HopDong> getHopDongs() {
		return this.hopDongs;
	}

	public void setHopDongs(List<HopDong> hopDongs) {
		this.hopDongs = hopDongs;
	}

}