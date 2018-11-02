package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.TinhTrangHonNhanDao;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.TinhTrangHonNhan;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.TinhTrangHonNhanService;

@Service
public class TinhTrangHonNhanServiceImpl implements TinhTrangHonNhanService {

	@Autowired
	private TinhTrangHonNhanDao tinhTrangHonNhanDao;

	@Override
	@Transactional
	public List<TinhTrangHonNhan> getAllTinhTrangHonNhan() {
		return this.tinhTrangHonNhanDao.getAllTinhTrangHonNhan();
	}

}
