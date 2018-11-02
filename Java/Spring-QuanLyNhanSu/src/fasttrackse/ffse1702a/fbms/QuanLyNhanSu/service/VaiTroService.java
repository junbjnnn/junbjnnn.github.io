package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service;

import java.util.List;

import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.NhiemVu;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.VaiTro;

public interface VaiTroService {
	public List<NhiemVu> getNhiemVuById(int maNhanVien, int maDuAn);
	public VaiTro getVaiTroById(String maVaiTro);
}
