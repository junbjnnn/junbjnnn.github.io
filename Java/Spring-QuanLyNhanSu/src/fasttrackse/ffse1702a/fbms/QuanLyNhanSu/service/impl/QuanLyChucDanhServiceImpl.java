package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ChucDanh;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.QuanLyChucDanhDAO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.QuanLyChucDanhService;

@Service
public class QuanLyChucDanhServiceImpl implements QuanLyChucDanhService {

	@Autowired
	private QuanLyChucDanhDAO quanlychucdanhDAO;

	@Override
	@Transactional
	public List<ChucDanh> listChucDanh() {
		return this.quanlychucdanhDAO.listChucDanh();
	}

	@Override
	@Transactional
	public void addChucDanh(ChucDanh p) {
		this.quanlychucdanhDAO.addChucDanh(p);
	}

	@Override
	@Transactional
	public void updateChucDanh(ChucDanh p) {
		this.quanlychucdanhDAO.updateChucDanh(p);
	}

	@Override
	@Transactional
	public ChucDanh getChucDanhByMa(String maChucDanh) {
		return this.quanlychucdanhDAO.getChucDanhByMa(maChucDanh);
	}
	
	@Override
	@Transactional
	public void removeChucDanh(String maChucDanh) {
		this.quanlychucdanhDAO.removeChucDanh(maChucDanh);
	}

	@Override
	@Transactional
	public boolean checkChucDanh(String maChucDanh) {
		return this.quanlychucdanhDAO.checkChucDanh(maChucDanh);
	}
}
