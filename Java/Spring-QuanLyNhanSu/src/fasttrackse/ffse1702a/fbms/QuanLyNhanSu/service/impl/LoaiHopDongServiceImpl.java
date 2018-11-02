package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.LoaiHopDongDAO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.LoaiHopDong;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.LoaiHopDongService;

@Service
public class LoaiHopDongServiceImpl implements LoaiHopDongService {
	@Autowired
	private LoaiHopDongDAO loaiHopDongDAO;

	@Override
	@Transactional
	public List<LoaiHopDong> listLoaiHopDong() {
		return this.loaiHopDongDAO.listLoaiHopDong();
	}
}
