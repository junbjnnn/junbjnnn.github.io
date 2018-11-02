package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao;

import java.util.List;

import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.NhiemVu;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.VaiTro;

public interface VaiTroDAO {
	public List<NhiemVu> getNhiemVuById(int maNhanVien, int maDuAn);
	public VaiTro getVaiTroById(String maVaiTro);
}
