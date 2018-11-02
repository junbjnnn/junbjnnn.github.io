package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.QuanLyPhongBanDao;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.PhongBan;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.QuanLyPhongBanService;

@Service
public class QuanLyPhongBanServiceImpl implements QuanLyPhongBanService {
	@Autowired
	private QuanLyPhongBanDao quanLyPhongBanDao;

	@Override
	@Transactional
	public void addPhongBan(PhongBan p) {
		this.quanLyPhongBanDao.addPhongBan(p);
	}

	@Override
	@Transactional
	public void updatePhongBan(PhongBan p) {
		this.quanLyPhongBanDao.updatePhongBan(p);
	}

	@Override
	@Transactional
	public List<PhongBan> listPhongBan() {
		return this.quanLyPhongBanDao.listPhongBan();
	}

	@Override
	@Transactional
	public PhongBan getMaPhongBan(String id) {
		return this.quanLyPhongBanDao.getMaPhongBan(id);
	}

	@Override
	@Transactional
	public void removePhongBan(String id) {
		this.quanLyPhongBanDao.removePhongBan(id);
	}

	@Override
	@Transactional
	public boolean checkPhongBan(String maPhongBan) {
		return this.quanLyPhongBanDao.checkPhongBan(maPhongBan);
	}

}
