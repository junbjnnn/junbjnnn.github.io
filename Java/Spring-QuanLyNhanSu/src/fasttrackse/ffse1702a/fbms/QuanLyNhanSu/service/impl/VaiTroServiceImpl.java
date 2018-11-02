package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.NhiemVu;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.VaiTro;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.VaiTroDAO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.VaiTroService;

@Service
public class VaiTroServiceImpl implements VaiTroService {
	
	@Autowired
	VaiTroDAO vaiTroDAO;
	
	public List<NhiemVu> getNhiemVuById(int maNhanVien, int maDuAn) {
		return this.vaiTroDAO.getNhiemVuById(maNhanVien, maDuAn);
	}
	
	public VaiTro getVaiTroById(String maVaiTro) {
		return this.vaiTroDAO.getVaiTroById(maVaiTro);
	}
}
